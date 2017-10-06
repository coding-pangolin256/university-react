import React from 'react';

import * as ResultService from './services/ResultService';

export default React.createClass({

    getInitialState() {
        let result = this.props.result;
        result.course_id = this.props.homework.course_id;
        result.course_code = this.props.homework.course_code;
        result.homework_id = this.props.homework.id;
        return {result: result, src_code:""};
    },

    componentWillReceiveProps(props) {
        this.setState({result:props.result});
    },

    componentDidMount() {
        this._downloadTxtFile();
    },

    scoreChangeHandler(event) {
        let result = this.state.result;
        result.score = event.target.value;
        this.setState({result});
    },

    save() {
        let saveItem = this.state.result.id ? ResultService.updateItem : ResultService.createItem;
        saveItem(this.state.result).then(savedresult => {
            if (this.props.onSaved) this.props.onSaved(savedresult);
        });
    },
    _downloadTxtFile() {
        ResultService.downFile({filename:this.state.result.path}).then(downloaded => {
            console.log(downloaded);
            this.setState({src_code: downloaded});
        });
    },

    render() {
        let result = this.state.result;
        let src_code = this.state.src_code;
        return (
            <div className="slds-form--stacked slds-grid slds-wrap">
                <div className="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-1">
                    <div className="slds-form-element">
                        <label className="slds-form-element__label" htmlFor="sample1">Source</label>
                        <div className="">
                            <textarea className="slds-input" style={{"height": "400px"}} value={src_code} />
                        </div>
                    </div>
                    <div className="slds-form-element">
                        <label className="slds-form-element__label" htmlFor="sample1">Score</label>
                        <div className="slds-form-element__control">
                            <input className="slds-input" type="number" value={result.score} onChange={this.scoreChangeHandler}/>
                        </div>
                    </div>
                </div>
            </div>
        );
    }

});