import React from 'react';
import DataGrid from './components/DataGrid';

export default React.createClass({

    linkHandler(teacher) {
        window.location.hash = "#teacher/" + teacher.id;
    },

    actionHandler(data, value, label) {
        if (label === "Delete") {
            this.props.onDelete(data);
        } else if (label === "Edit") {
            this.props.onEdit(data);
        }
    },

    render() {
        return (
            <DataGrid data={this.props.teachers}>
                <div header="Name" field="full_name" onLink={this.linkHandler}/>
                <div header="Address" field="address"/>
                <div header="City" field="city"/>
            </DataGrid>
        );
    }

});