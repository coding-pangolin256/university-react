import request from './fakeRequest';
import * as StudentService from '../services/StudentService';
import * as TeacherService from '../services/TeacherService';
/**
 * Authentication lib
 * @type {Object}
 */
var auth = {
  /**
   * Logs a user in
   * @param  {string}   username The username of the user
   * @param  {string}   password The password of the user
   * @param  {Function} callback Called after a user was logged in on the remote server
   */
  login(pos, name, password, callback) {
    // If there is a token in the localStorage, the user already is
    // authenticated
    if (this.loggedIn()) {
      callback(true);
      return;
    }
    // Post a fake request (see below)

    if(pos == "student")
    {
      StudentService.findByData({ 'id': name, 'pwd': password }).then(response => {
        // If the user was authenticated successfully, save a random token to the
        // localStorage
        if (response != null) {
          localStorage.token = response.id;
          localStorage.permission = 0;
          localStorage.pos = "student";
          callback(true);
        } else {
          // If there was a problem authenticating the user, show an error on the
          // form
          var err={
            type:'input-wrong'
          };
          callback(false, err);
        }
      });
    }
    else
    {
      TeacherService.findByData({ 'email': name, 'pwd': password }).then(response => {
        // If the user was authenticated successfully, save a random token to the
        // localStorage
        if (response != null && response.allowed) {
          localStorage.token = response.id;
          localStorage.pos = "teacher";
          localStorage.permission = response.allowed;
          callback(true);
        } else {
          var err={
            type:'input-wrong'
          };
          if(response != null && !response.allowed)
          {
            err.type = 'permission-not-allowed';
          }
          callback(false, err);
        }
      });
    }
  },
  /**
   * Logs the current user out
   */
  logout(callback) {
    request.post('/logout', {}, () => {
      callback(true);
    });
  },
  /**
   * Checks if anybody is logged in
   * @return {boolean} True if there is a logged in user, false if there isn't
   */
  loggedIn() {
    return !!localStorage.token;
  },
  /**
   * Registers a user in the system
   * @param  {string}   username The username of the user
   * @param  {string}   password The password of the user
   * @param  {Function} callback Called after a user was registered on the remote server
   */
  register(pos, stdid, email, name, password, callback) {
    // Post a fake request
    if(pos == "teacher")
    {
      var data = {
        'name': name,
        'email': email,
        'pwd': password
      }
      
      TeacherService.createItem(data).then(response => {
        // If the user was successfully registered, log them in
        if (response.affectedRows != false) {
          callback(true);
        } else {
            var err = {
              type: 'username-exists'
            }
            // If there was a problem registering, show the error
            callback(false, err);
        }
      });
    }
    else {
      var data = {
        'id': stdid,
        'name': name,
        'pwd': password
      }
      
      StudentService.createItem(data).then(response => {
        // If the user was successfully registered, log them in
        
        if (response.affectedRows != false) {
          callback(true, err);
        } else {
          // If there was a problem registering, show the error
          var err = {
            type: 'username-exists'
            }
          // If there was a problem registering, show the error
          callback(false, err);
        }
      });
    }
  },
  onChange() {}
}

module.exports = auth;
