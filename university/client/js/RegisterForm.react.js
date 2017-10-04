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
        <div className="form__field-wrapper">
          <input className="form__field-input" type="text" id="stdid" value={this.props.data.stdid} placeholder="24" onChange={this._changeStdid.bind(this)} autoCorrect="off" autoCapitalize="off" spellCheck="false" />
          <label className="form__field-label" htmlFor="stdid">ID</label>
        </div>
        <div className="form__field-wrapper">
          <input className="form__field-input" type="text" id="fullname" value={this.props.data.fullname} placeholder="John Depth" onChange={this._changeFullname.bind(this)} autoCorrect="off" autoCapitalize="off" spellCheck="false" />
          <label className="form__field-label" htmlFor="fullname">Fullname</label>
        </div>
        <div className="form__field-wrapper">
          <input className="form__field-input" type="text" id="username" value={this.props.data.username} placeholder="frank.underwood" onChange={this._changeUsername.bind(this)} autoCorrect="off" autoCapitalize="off" spellCheck="false" />
          <label className="form__field-label" htmlFor="username">Username</label>
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
  
      this._emitChange(newState);
    }
  // Change the username in the app state
    _changeStdid(evt) {
      var newState = this._mergeWithCurrentState({
        stdid: evt.target.value
      });
  
      this._emitChange(newState);
    }
    // Change the username in the app state
  _changeFullname(evt) {
      var newState = this._mergeWithCurrentState({
        fullname: evt.target.value
      });
  
      this._emitChange(newState);
    }
  // Change the username in the app state
  _changeUsername(evt) {
    var newState = this._mergeWithCurrentState({
      username: evt.target.value
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
    this.props.onSubmit(this.props.data.pos, this.props.data.stdid, this.props.data.fullname, 
      this.props.data.username, this.props.data.password);
  }
}

RegisterForm.propTypes = {
  onSubmit: React.PropTypes.func.isRequired,
  btnText: React.PropTypes.string.isRequired,
  data: React.PropTypes.object.isRequired
}

export default RegisterForm;
