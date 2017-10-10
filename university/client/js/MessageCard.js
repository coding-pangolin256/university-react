import React from 'react';

import * as CourseService from './services/CourseService';

import DataGrid from './components/DataGrid';
import {Icon, ButtonIcon} from './components/Icons';
import CourseFormWindow from './CourseFormWindow';

export default React.createClass({

    render() {
        return (
            <div>
                {/* <header className="slds-card__header slds-grid">
                    <div className="slds-media slds-media--center slds-has-flexi-truncate">
                        <div className="slds-media__figure">
                            <Icon name="post" size="small"/>
                        </div>
                        <div className="slds-media__body">
                            <h3 className="slds-text-heading--small slds-truncate">
                                {this.props.data.pos=="teacher"?
                                    'Professor '+this.props.data.user_name:
                                    this.props.data.user_name}
                            </h3>
                        </div>
                        <div className="slds-media__body">
                            <span className="slds-text-body--small slds-truncate slds-text-align--right">{this.props.data.time}</span>
                        </div>
                    </div>
                </header> */}

                <section className="slds-card__body">
                        <div className="slds-media__body">
                            
                                {this.props.data.pos=="teacher"?
                                    'Professor '+this.props.data.user_name:
                                    this.props.data.user_name}
                           
                        </div>
                    <span className="slds-input">{this.props.data.text}</span>
                </section>
            </div>
        );
    }

});