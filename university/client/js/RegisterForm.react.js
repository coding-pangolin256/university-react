/**
 * Form.react.js
 *
 * The form with a username and a password input field, both of which are
 * controlled via the application state.
 *
 */

import React, { Component } from 'react';
import { changeForm } from './actions/AppActions';
import LoadingButton from './LoadingButton.react';
import ErrorMessage from './ErrorMessage.react';
// Object.assign is not yet fully supported in all browsers, so we fallback to
// a polyfill
const assign = Object.assign || require('object.assign');

class RegisterForm extends Component {
  constructor(props) {
		super(props);

		this.state = {
			showTeacher: true
		};
	}
  render() {
    return(
      <form className="form" onSubmit={this._onSubmit.bind(this)}>
        <ErrorMessage />
        <div className="form__field-wrapper">
          <select className="form__field-input" id="pos" value={this.props.data.pos} onChange={this._changePos.bind(this)} autoCorrect="off" autoCapitalize="off" spellCheck="false" >
            <option value="teacher">Teacher</option>
            <option value="student">Student</option>
          </select>
          <label className="form__field-label" htmlFor="pos">Position</label>
        </div>
        {
          this.state.showTeacher?
            <div className="form__field-wrapper" id="teacher_form">
              <input className="form__field-input" type="text" id="email" value={this.props.data.email} placeholder="samuel.S@mail.com" onChange={this._changeEmail.bind(this)} autoCorrect="off" autoCapitalize="off" spellCheck="false" />
              <label className="form__field-label" htmlFor="email">Email Address</label>
            </div>
            :
            <div className="form__field-wrapper" id="student_form">
              <input className="form__field-input" type="text" id="stdid" value={this.props.data.stdid} placeholder="24" onChange={this._changeStdid.bind(this)} autoCorrect="off" autoCapitalize="off" spellCheck="false" />
              <label className="form__field-label" htmlFor="stdid">Student ID</label>
            </div>
        }
        <div className="form__field-wrapper">
          <input className="form__field-input" type="text" id="name" value={this.props.data.name} placeholder="Samuel Stevens" onChange={this._changeUsername.bind(this)} autoCorrect="off" autoCapitalize="off" spellCheck="false" />
          <label className="form__field-label" htmlFor="name">Name</label>
        </div>
        <div className="form__field-wrapper">
          <input className="form__field-input" id="password" type="password" value={this.props.data.password} placeholder="••••••••••"  onChange={this._changePassword.bind(this)} />
          <label className="form__field-label" htmlFor="password">Password</label>
        </div>
        <div className="form__submit-btn-wrapper">
          {this.props.currentlySending ? (
            <LoadingButton />
          ) : (
            <button className="form__submit-btn" type="submit">{this.props.btnText}</button>
          )}
        </div>
      </form>
    );
  }
  // Change the position in the app state
    _changePos(evt) {
      var newState = this._mergeWithCurrentState({
        pos: evt.target.value
      });
      this.setState({showTeacher: evt.target.value == "teacher"});
      this._emitChange(newState);
    }
  // Change the Student ID in the app state
    _changeStdid(evt) {
      var newState = this._mergeWithCurrentState({
        stdid: evt.target.value
      });
  
      this._emitChange(newState);
    }
    // Change the email in the app state
  _changeEmail(evt) {
      var newState = this._mergeWithCurrentState({
        email: evt.target.value
      });
  
      this._emitChange(newState);
    }
  // Change the username in the app state
  _changeUsername(evt) {
    var newState = this._mergeWithCurrentState({
      name: evt.target.value
    });

    this._emitChange(newState);
  }

  // Change the password in the app state
  _changePassword(evt) {
    var newState = this._mergeWithCurrentState({
      password: evt.target.value
    });

    this._emitChange(newState);
  }

  // Merges the current state with a change
  _mergeWithCurrentState(change) {
    return assign(this.props.data, change);
  }

  // Emits a change of the form state to the application state
  _emitChange(newState) {
    this.props.dispatch(changeForm(newState));
  }

  // onSubmit call the passed onSubmit function
  _onSubmit(evt) {
    evt.preventDefault();
    if(this.props.data.pos == null)
    {
      this.props.data.pos = "teacher";
    }
    this.props.onSubmit(this.props.data.pos, this.props.data.stdid, this.props.data.email, this.props.data.name, this.props.data.password);
  }
}

RegisterForm.propTypes = {
  onSubmit: React.PropTypes.func.isRequired,
  btnText: React.PropTypes.string.isRequired,
  data: React.PropTypes.object.isRequired
}

export default RegisterForm;
