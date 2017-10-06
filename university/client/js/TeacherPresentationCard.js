import React from 'react';

import * as PresentationService from './services/PresentationService';

import DataGrid from './components/DataGrid';
import {Icon, ButtonIcon} from './components/Icons';

import ReactUploadFile from 'react-upload-file';
var fileDownload = require('react-file-download');

export default React.createClass({

    getInitialState() {
        return {presents:[]};
    },

    componentWillReceiveProps(props) {
        this.getPresents(props.teacher.id);
    },

    viewAllHandler(event) {
        this.getPresents(this.props.teacher.id);
        event.preventDefault();
    },

    getPresents(teacherId) {
        if (teacherId) {
            PresentationService.findAll({teacherId}).then(presents => this.setState({presents}));
        }
    },

    presentLinkHandler(present) {
        var link = document.createElement('a');
        link.download = present.path;
        link.href = 'http://localhost:5000/upload/'+present.path;
        var clickEvent = document.createEvent("MouseEvent");
        clickEvent.initEvent("click", true, true);
        
        link.dispatchEvent(clickEvent);
        // PresentationService.downFile({filename: present.path}).then(downloaded => {
            
        //     // fileDownload(downloaded, present.path);
        //     // writeFile(present.path, downloaded, function (err) {
        //     //     if (err) return console.log(err)
        //     //     console.log('file is written')
        //     //   })
        //     var link = document.createElement('a');
        //     link.download = present.path;
        //     link.href = 'http://localhost:5000/upload/'+present.path;
        // });
    },

    presentDeleteHandler(present)
    {
        PresentationService.deleteItem(present.id);
        PresentationService.deleteFile({filename: present.path});
        this.getPresents(this.props.teacher.id);
    },

    newPresentHandler() {
        this.setState({addingPresent:true});
    },

    newPresentCancelHandler() {
        this.setState({addingPresent:false});
    },

    newPresentSavedHandler(present) { 
        this.setState({addingPresent:false});
        this.getPresents(this.props.teacher.id);
    },

    actionHandler(data, index, value, label) {
        switch(label) {
            case "Download File":
                this.presentLinkHandler(data);
                break;
            case "Delete":
                this.presentDeleteHandler(data);
                break;
        }
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
              accept: '.ppt,.pptx,.doc,.docx,.pdf',
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
                this.setState({present: {teacher_id: this.props.teacher.id, path:files[0].name, size: files[0].size}});
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
                PresentationService.createItem(this.state.present)
                .then(() => this.getPresents(this.props.teacher.id))
                .catch((error) => {
                    let event = new CustomEvent('notify', {detail:'You already uploaded this file'});
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
                            <h3 className="slds-text-heading--small slds-truncate">Presentations</h3>
                        </div>
                    </div>
                    <div className="slds-no-flex">
                        <div className="slds-button-group">
                        <ReactUploadFile options={options} 
                                            chooseFileButton={<button className="slds-button slds-button--neutral slds-button--small"></button>} 
                                            uploadFileButton={<button className="slds-button slds-button--neutral slds-button--small">Upload</button>} />
                            {/* <button className="slds-button slds-button--neutral slds-button--small" onClick={this.newPresentHandler}>New</button> */}
                            <button className="slds-button slds-button--icon-border-filled">
                                <ButtonIcon name="down"/>
                                <span className="slds-assistive-text">Show More</span>
                            </button>
                        </div>
                    </div>
                </header>

                <section className="slds-card__body">
                    <DataGrid data={this.state.presents} keyField="id" actions={localStorage.pos=="teacher"?["Download File", "Delete"]:["Download File"]} onAction={this.actionHandler}>
                        <div header="File Name" field="path" sortable={true} onLink={this.presentLinkHandler}/>
                        <div header="Description" field="description" sortable={true}/>
                        <div header="Size" field="size" sortable={true} format="size"/>
                        <div header="Uploaded Time" field="uploaded_time" sortable={true} format="datatime"/>
                    </DataGrid>
                </section>
            </div>
        );
    }

});