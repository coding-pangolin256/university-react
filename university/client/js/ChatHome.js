import React from 'react';

import * as ChatService from './services/ChatService';
import MessageCard from './MessageCard';
import {RecordHeader, HeaderField} from './components/PageHeader';
import ChatBox from './ChatBox';
import axios from 'axios';

export default React.createClass({

    getInitialState() {
        return {msgs: [], msg_len: 0};
    },
    componentWillReceiveProps(props) {
        this.getMessages(props.course.code);
        this.setState({course_code: props.course.code});
        setTimeout(this.startReceivingMessages, 3000);
    },
    componentDidMount() {
        
    },
    componentWillUnmount() {
        // use intervalId from the state to clear the interval
        clearInterval(this.state.intervalId);
    },

    componentDidUpdate() {
        if(this.state.msg_len != this.state.msgs.length)
        {
            var objDiv = document.getElementById("cht_box");
            objDiv.scrollTop = objDiv.scrollHeight;
            this.setState({msg_len: this.state.msgs.length});
        }
        
    },

    getMessages(code) {
        ChatService.findByData({course_code: code}).then((data) => {this.setState({msgs: data})});
        // fetch(window.location.protocol + 'messages')
        // .then((response) => {
        //     return response.json();
        // })
    },
    
    startReceivingMessages()
    {
        var intervalId = setInterval(this.getMessagesInverval, 3000);
        // // store intervalId in the state so it can be accessed later:
        this.setState({intervalId: intervalId});
    },
    getMessagesInverval() {
        //ChatService.findByData({course_code: this.state.course_code}).then((data) => {this.setState({msgs: data})});
        // fetch(window.location.protocol + 'messages')
        // .then((response) => {
        //     return response.json();
        // })
        let data = {
            course_code: this.state.course_code
        }
    
        axios.post(window.location.protocol + 'message', data, {
            headers: {
                'Content-Type': 'application/json',
            }
        }
        ).then((response) => {
                return response.json();
        }).then((data) => {this.setState({msgs: data})});
    },

    deleteHandler(msg) {
        ChatService.deleteItem(this.state.msg.id).then(() => window.location.hash = "chat");
    },

    editHandler(msg) {
        window.location.hash = "#chat/" + msg.id + "/edit";
    },

    sendHandler(msg,type)
    {
        ChatService.createItem({user_id: sessionStorage.token, pos: sessionStorage.pos, text: msg, type: type, course_code: this.props.course.code})
        .then(()=>{
            this.getMessages(this.props.course.code);
        });
    },

    render() {
        let rows = [];
        rows = this.state.msgs.map(item => <MessageCard data={item}/>);
        // for (let i = 0 ; i < this.state.msgs.length; i++) {
        //     rows.push(<MessageCard data={this.state.msgs[i]}/>);
        // }
        return (
            <div  className="slds-card">
                {/* <RecordHeader icon="chat"
                              title="Chat Room"
                              itemCount={this.state.msgs.length}>
                </RecordHeader> */}
                <div className="slds-m-around--medium slds-scrollable--y" id="cht_box">
                    {rows}
                </div>
                <ChatBox onSend={this.sendHandler}/>
            </div>
            
        );
    }
});