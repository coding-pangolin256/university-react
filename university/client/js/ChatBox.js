import React from 'react';

import * as StudentService from './services/StudentService';

import SearchBox from './components/SearchBox';

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
                    </div>
                </div>
        );
    }

});