import React from 'react';

import * as ChatService from './services/ChatService';
import MessageCard from './MessageCard';
import {RecordHeader, HeaderField} from './components/PageHeader';
import ChatBox from './ChatBox';

export default React.createClass({

    getInitialState() {
        return {msgs: []};
    },

    componentDidMount() {
        this.getMessages();
    },

    getMessages() {
        ChatService.findAll().then(msgs => this.setState({msgs}));
    },

    deleteHandler(msg) {
        ChatService.deleteItem(this.state.msg.id).then(() => window.location.hash = "chat");
    },

    editHandler(msg) {
        window.location.hash = "#chat/" + msg.id + "/edit";
    },

    sendHandler(msg)
    {
        ChatService.createItem({user_id: localStorage.token, pos: localStorage.pos, text: msg})
        .then(()=>{
            this.getMessages();
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
                <div className="slds-m-around--medium slds-scrollable--y">
                    {rows}
                </div>
                <ChatBox onSend={this.sendHandler}/>
            </div>
        );
    }
});