import React from 'react';

import * as StudentService from './services/StudentService';
import {Icon, ButtonIcon} from './components/Icons';

import SearchBox from './components/SearchBox';
import FileInput from 'react-fine-uploader/file-input'
import FineUploaderTraditional from 'fine-uploader-wrappers'
 
const uploader = new FineUploaderTraditional({
   options: {
      request: {
         endpoint: 'upload/'
      },
      autoUpload: false
   },
   callbacks: {
    onComplete: function(id, name, response) {
        var serverPathToFile = response.filePath,
            fileItem = this.getItemByFileId(id);
            console.log('name');
        if (response.success) {
            console.log('name');
        }
    }
}
})
 
const fileInput = (
   <FileInput accept='.c,.cpp,.java,.js,.txt' uploader={ uploader}>
      <span class="icon ion-upload"><Icon name="link"/></span>
   </FileInput>
)

export default React.createClass({
    getInitialState() {
        return {searchKey: ""}
    },
    handleKeyPress(target) {
        if(target.charCode==13){
            this.props.onSend(this.state.searchKey);
            this.setState({searchKey: ""});    
        }
    },
    changeHandler: function(event) {
        let inputKey = event.target.value;
        this.setState({searchKey: inputKey});
    },

    render() {
        return (
                <div className="slds-form-element">
                    <div className="slds-form-element__control">
                        <input className="slds-input" type="text"
                               placeholder={this.props.placeholder || 'Enter your message...'}
                               value={this.state.searchKey}
                               style={{minWidth:"200px",marginTop:"1px"}}
                               onChange={this.changeHandler}
                               onKeyPress={this.handleKeyPress}/>
                        <span>
                        {fileInput}
                        </span>
                    </div>
                </div>
        );
    }

});