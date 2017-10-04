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
  login(username, password, callback) {
    // If there is a token in the localStorage, the user already is
    // authenticated

    if (this.loggedIn()) {
      callback(true);
      return;
    }
    // Post a fake request (see below)
    StudentService.findByData({ 'user_id': username, 'pwd': password }).then(response => {
      // If the user was authenticated successfully, save a random token to the
      // localStorage
      
      if (response != null) {
        localStorage.token = response.id;
        localStorage.pos = "student";
        callback(true);
      } else {
        // If there was a problem authenticating the user, show an error on the
        // form
        TeacherService.findByData({ 'user_id': username, 'pwd': password }).then(response => {
          // If the user was authenticated successfully, save a random token to the
          // localStorage
          
          if (response != null) {
            localStorage.token = response.id;
            localStorage.pos = "teacher";
            callback(true);
          } else {
            var err={
              type:'input-isnot-correct'
            };
            callback(false, err);
          }
        });
      }
    });
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
  register(pos, stdid, fullname, username, password, callback) {
    // Post a fake request
    if(pos == "teacher")
    {
      var data = {
        'full_name': fullname,
        'user_id': username,
        'pwd': password
      }
      
      TeacherService.createItem(data).then(response => {
        // If the user was successfully registered, log them in
        if (response.insertId != false) {
          console.log('log');
          this.login(username, password, callback);
        } else {
          console.log('err');
          // If there was a problem registering, show the error
          callback(false, response.error);
        }
      });
    }
    else {
      var data = {
        'std_id': stdid,
        'full_name': fullname,
        'user_id': username,
        'pwd': password
      }
      
      StudentService.createItem(data).then(response => {
        // If the user was successfully registered, log them in
        
        if (response.insertId != false) {
          console.log('log');
          this.login(username, password, callback);
        } else {
          console.log('err');
          // If there was a problem registering, show the error
          callback(false, response.error);
        }
      });
    }
  },
  onChange() {}
}

module.exports = auth;
