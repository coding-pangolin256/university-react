import React from 'react';

import * as PresentationService from './services/PresentationService';

import DataGrid from './components/DataGrid';
import {Icon, ButtonIcon} from './components/Icons';

import ReactUploadFile from 'react-upload-file';
import FileInput from 'react-fine-uploader/file-input'
import FineUploaderTraditional from 'fine-uploader-wrappers'

const uploader = new FineUploaderTraditional({
    options: {
       request: {
          endpoint: 'upload/'
       },
       autoUpload: false
    },
});

export default React.createClass({

    getInitialState() {
        return {presents:[]};
    },

    componentDidMount() {
        uploader.on('complete', (id, name, response) => {
            // handle completed upload
            // PresentationService.createItem(this.state.present)
            // .then(() => this.getPresents(this.props.course.code))
            // .catch((error) => {
            //     let event = new CustomEvent('notify', {detail:'You already uploaded this file'});
            //     document.dispatchEvent(event);
            // });
            console.log('upload success!');
        })
        uploader.on('submitted', id => {
            uploader.methods.setFile
            this.setState({present: {course_code: this.props.course.code, path: uploader.methods.getFile(id).name, size: uploader.methods.getFile(id).size}});
        })
    },

    componentWillReceiveProps(props) {
        this.getPresents(props.course.code);
    },

    viewAllHandler(event) {
        this.getPresents(this.props.course.code);
        event.preventDefault();
    },

    getPresents(courseId) {
        if (courseId) 
        {
            if(sessionStorage.pos=="teacher")
            {
                PresentationService.findAll({courseId}).then(presents => this.setState({presents}));
            }
            else
            {
                PresentationService.findByData({course_code: courseId, share: 1}).then(presents => this.setState({presents}));
            }
        }
        console.log(this.state.presents);
    },

    presentLinkHandler(present) {
        var link = document.createElement('a');
        link.download = present.path;
        link.href = window.location.protocol + '/upload/'+present.path;
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

    presentShareHandler(present)
    {
        PresentationService.updateItem({course_code: this.props.course.code, share: present.share?0:1, id: present.id})
        .then(() => this.getPresents(this.props.course.code));
    },

    presentDeleteHandler(present)
    {
        PresentationService.deleteItem(this.props.course.code+'_'+present.id);
        PresentationService.deleteFile({filename: present.path});
        this.getPresents(this.props.course.code);
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
            case "Download":
                this.presentLinkHandler(data);
                break;
            case "Delete":
                this.presentDeleteHandler(data);
                break;
            case "Share":
                this.presentShareHandler(data);
                break;
        }
    },

    uploadFiles(){
        uploader.methods.uploadStoredFiles();
    },

    render() {
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
                        {
                        sessionStorage.pos=="teacher"?
                        <div className="slds-button-group">
                        {/* <ReactUploadFile options={options} 
                                            chooseFileButton={<button className="slds-button slds-button--icon-border-filled">
                                                    <ButtonIcon name="down"/>
                                                    <span className="slds-assistive-text">Show More</span>
                                                </button>} 
                                            uploadFileButton={<button className="slds-button slds-button--neutral slds-button--small">Upload</button>} /> */}
                            <FileInput accept='*' uploader={ uploader}>
                                <span class="icon ion-upload"><Icon name="link"/></span>
                            </FileInput>
                            {/* <button className="slds-button slds-button--neutral slds-button--small" onClick={this.newPresentHandler}>New</button> */}
                            <button className="slds-button slds-button--neutral slds-button--small" onClick={this.uploadFiles}>
                                Upload
                            </button>
                        </div>:
                        ''
                        }
                    </div>
                </header>

                <section className="slds-card__body">
                    <DataGrid data={this.state.presents} keyField="id" actions={sessionStorage.pos=="teacher"?["Download", "Share", "Delete"]:["Download"]} onAction={this.actionHandler}>
                        <div header="Title" field="title" sortable={true} onLink={this.presentLinkHandler}/>
                        <div header="File" field="file" sortable={true}/>
                        {/* <div header="Description" field="description" sortable={true}/> */}
                        {/* <div header="Size" field="size" sortable={true} format="size"/>
                        <div header="Uploaded Time" field="uploaded_time" sortable={true} format="datatime"/>
                        {
                            sessionStorage.pos=="teacher"?
                            <div header="Shared" field="shared"/>:''
                        } */}
                    </DataGrid>
                </section>
            </div>
        );
    }

});