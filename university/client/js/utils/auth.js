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
  login(pos, data, callback) {console.log(data);
    // If there is a token in the sessionStorage, the user already is
    // authenticated
    if (this.loggedIn()) {
      callback(true);
      return;
    }
    // Post a fake request (see below)

    if(pos == "student")
    {
      StudentService.findByData({ 'student_id': data.stdid, 'pswd': data.password, 'univ_code': data.university_id }).then(response => {
        // If the user was authenticated successfully, save a random token to the
        // sessionStorage
        if (response != null) {
          sessionStorage.token = response.student_id;
          sessionStorage.permission = 0;
          sessionStorage.university = data.univ_code;
          sessionStorage.pos = "student";
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
      TeacherService.findByData({ 'phone': data.phone, 'pswd': data.password }).then(response => {
        // If the user was authenticated successfully, save a random token to the
        // sessionStorage
        if (response != null) {
          sessionStorage.token = response.phone;
          sessionStorage.pos = "teacher";
          sessionStorage.university = response.univ_code;
          sessionStorage.permission = 1;
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
    return !!sessionStorage.token;
  },
  /**
   * Registers a user in the system
   * @param  {string}   username The username of the user
   * @param  {string}   password The password of the user
   * @param  {Function} callback Called after a user was registered on the remote server
   */
  register(info, callback) {
    // Post a fake request
    console.log(info);
    if(info.pos == "teacher")
    {
      var data = {
        'univ_code': info.university,
        'teacher_name': info.name,
        'phone': info.phone,
        'pswd': info.password
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
        'student_id': info.stdid,
        'student_name': info.name,
        'pswd': info.password,
        'univ_code': info.university
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
