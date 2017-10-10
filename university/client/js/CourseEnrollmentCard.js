import React from 'react';

import * as ResultService from './services/ResultService';

import DataGrid from './components/DataGrid';
import StudentSearchBox from './StudentSearchBox';
import ResultFormWindow from './ResultFormWindow';

import {Icon} from './components/Icons';

export default React.createClass({

    getInitialState() {
        return {results:[]};
    },

    componentWillReceiveProps(props) {
        this.getResults(props.course);
    },

    getResults(courseId) {
        if (courseId) {
            ResultService.findByCourse(courseId).then(results => this.setState({results}));
        }
    },

    studentLinkHandler(result) {
        window.location.hash = "#student/" + result.std_id;
    },

    actionHandler(data, index, value, label) {
        switch(value) {
            case "View Student":
                this.studentLinkHandler(data);
                break;
            case "Delete":
                ResultService.deleteItem(data.id)
                    .then(() => this.getResults(this.props.course.id));
                break;
            case "Submit":

                break;
        }
    },
    
    resultLinkHandler(result) {
        console.log(result);
        this.setState({estimatting:true, current: result.result, selected_hwId: result.homeworkId});
    },

    resultDeleteHandler(result) {
        ResultService.deleteFile(result.path)
        .then(() => this.getResults(this.props.course));
    },

    scoreSavedHandler() {
        this.setState({estimatting:false});
        this.getResults(this.props.course);
    },

    scoreCancelHandler() {
        this.setState({estimatting:false});
    },

    render() {
        let cols = [];
        
        
        // for(let index=0;index<keys.length;index++)
        // {
        //    cols.push(<div header={keys[index]} field={keys[index]}/>);
        // }
        // console.log(result.toString());
        for( let i = 0; i<1&&this.state.results.length; i++)
        {
            let keys = Object.keys(this.state.results[i]);
            for(let index = 0; index < keys.length; index ++)
            {
                if(keys[index] == "name")
                {
                    cols.push(<div header={keys[index]} field={keys[index]} sortable={true} onLink={this.studentLinkHandler}/>);    
                }
                else if(keys[index] == "std_id")
                {
                    continue;
                }
                else{
                    if(keys[index].endsWith("_score"))
                    {
                        continue;
                    }
                    if(this.props.editable == true)
                        cols.push(<div header={keys[index]} field={keys[index+1]} action="Details" onLink={this.resultLinkHandler}/>);
                    else
                    cols.push(<div header={keys[index]} field={keys[index+1]}/>);
                }
                
            }
        }
        // <div header={item} field={item}/>

        
        return (
            <div className="slds-card">
                <header className="slds-card__header slds-grid">
                    <div className="slds-media slds-media--center slds-has-flexi-truncate">
                        <div className="slds-media__figure">
                            <Icon name={this.props.icon} size="small"/>
                        </div>
                        <div className="slds-media__body">
                            <h3 className="slds-text-heading--small slds-truncate">{this.props.title}</h3>
                        </div>
                    </div>
                </header>

                <section className="slds-card__body">
                    <DataGrid data={this.state.results} keyField="std_id" actions={localStorage.pos=="teacher"?["View Student", "Delete"]:null} onAction={this.actionHandler}>
                        {/* <div header="Name" field="name" sortable={true} onLink={this.studentLinkHandler}/>
                        <div header="Student ID" field="std_id"/> */}
                        {cols}
                    </DataGrid>
                </section>
                {this.state.estimatting?<ResultFormWindow result={this.state.current} course={this.props.course} selected_hw={this.state.selected_hwId} onSaved={this.scoreSavedHandler} onCancel={this.scoreCancelHandler}/>:null}
            </div>

        );
    }

});