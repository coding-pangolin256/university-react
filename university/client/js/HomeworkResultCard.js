import React from 'react';

import * as ResultService from './services/ResultService';

import DataGrid from './components/DataGrid';
import StudentSearchBox from './StudentSearchBox';

import {Icon, ButtonIcon} from './components/Icons';

import ReactUploadFile from 'react-upload-file';

const assign = Object.assign || require('object.assign');

export default React.createClass({

    getInitialState() {
        return {results:[], submitting:false};
    },

    componentWillReceiveProps(props) {
        this.getResults(props.homework);
    },

    getResults(homework) {
        if (homework) {
            ResultService.findByHomework(homework).then(results => this.setState({results}));
        }
    },

    resultLinkHandler(result) {
        window.location.hash = "#result/" + result.id;
    },

    actionHandler(data, index, value, label) {
        switch(index) {
            case 0:
                this.resultLinkHandler(data);
                break;
            case 1:
                ResultService.deleteItem(data.id)
                    .then(() => this.getResults(this.props.homework));
                break;
        }
    },
    submitHomeworkHandler() {
        this.setState({submitting:true});
    },

    render() {
        const options = {
            baseUrl: '/upload',
            query: (files)=>{
                const l = files.length;
                const queryObj = {};
                for(let i = l-1; i >= 0; --i) {
                  queryObj[i] = files[i].name;
                }
                return queryObj;
              },
              body: {
                purpose: 'save'
              },
            //   body: (files) => {
            //     const l = files.length;
            //     const queryObj = {};
            //     for(let i = l-1; i >= 0; --i) {
            //       queryObj[i] = files[i].name;
            //     }
            //     return queryObj;
            //   },
              dataType: 'json',
              multiple: false,
              numberLimit: 1,
              accept: '*',
              // fileFieldName: 'file',
              fileFieldName: (file) => {
                return file.name;
              },
              withCredentials: false,
              requestHeaders: {
                'method': 'POST'
              },
              beforeChoose: () => {
                return true;
              },
              didChoose: (files) => {
                console.log('you choose', typeof files == 'string' ? files : files[0].name);
              },
              beforeUpload: (files) => {
                this.setState({homework: assign(this.props.homework,({std_id: localStorage.token, path:files[0].name}))});
                if (typeof files === 'string') return true;
                if (files[0].size < 1024 * 1024 * 20) {
                  
                  return true;
                }
                return false;
              },
              didUpload: (files) => {
                console.log('you just uploaded', typeof files === 'string' ? files : files[0].name);
              },
              uploading: (progress) => {
                console.log('loading...', progress.loaded / progress.total + '%');
              },
              uploadSuccess: (resp) => {
                ResultService.createItem(this.state.homework)
                .then(() => this.getResults(this.props.homework))
                .catch((error) => {
                    let event = new CustomEvent('notify', {detail:'Student already submitted in this homework'});
                    document.dispatchEvent(event);
                });
                console.log('upload success!');
              },
              uploadError: (err) => {
                alert(err.message);
              }
          }
        
        return (
            <div className="slds-card">
                <header className="slds-card__header slds-grid">
                    <div className="slds-media slds-media--center slds-has-flexi-truncate">
                        <div className="slds-media__figure">
                            <Icon name="file" size="small"/>
                        </div>
                        <div className="slds-media__body">
                            <h3 className="slds-text-heading--small slds-truncate">Results</h3>
                        </div>
                    </div>
                    {/* <div className="slds-no-flex">
                        <StudentSearchBox placeholder="Search to enroll..." onSelect={this.studentSelectHandler}/>
                    </div> */}
                    {
                    localStorage.pos=="student"?
                    <div className="slds-no-flex">
                        <div className="slds-button-group">
                        <ReactUploadFile options={options} 
                                            chooseFileButton={<button className="slds-button slds-button--icon-border-filled" ><ButtonIcon name="add"/></button>} 
                                            uploadFileButton={<button className="slds-button slds-button--neutral slds-button--small">Submit</button>} />
                            {/* <button className="slds-button slds-button--neutral slds-button--small" onClick={this.submitHomeworkHandler}>Submit</button> */}
                            <button className="slds-button slds-button--icon-border-filled">
                                <ButtonIcon name="down"/>
                                <span className="slds-assistive-text">Show More</span>
                            </button>
                        </div>
                    </div>:
                    null
                    }
                </header>

                <section className="slds-card__body">
                    <DataGrid data={this.state.results} keyField="id" actions={["View Result", "Delete"]} onAction={this.actionHandler}>
                        <div header="Student Name" field="student_name" sortable={true} onLink={this.resultLinkHandler}/>
                        {/* <div header="Last Name" field="last_name" sortable={true} onLink={this.resultLinkHandler}/>
                        <div header="File Path" field="path"/> */}
                        <div header="Show details" field="details" actions={["Details"]}/>
                            <button className="slds-button slds-button--icon-border-filled">
                                <ButtonIcon name="plus"/>
                                <span className="slds-assistive-text">Details</span>
                            </button>
                        <div header="Delete file" field="delete" actions={["Delete"]}/>
                            <button className="slds-button slds-button--icon-border-filled">
                                <ButtonIcon name="minus"/>
                                <span className="slds-assistive-text">Delete</span>
                            </button>
                        <div header="Score" field="score" sortable={true}/>
                    </DataGrid>
                </section>
            </div>

        );
    }

});