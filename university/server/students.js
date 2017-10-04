"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let name = req.query.name;
    let params = [];
    let sql;
    if (name) {
        sql = `
            SELECT id, full_name AS name FROM student
            WHERE full_name LIKE ? ORDER BY full_name LIMIT 20`;
        params.push("%" + name + "%");
    } else {
        sql = `SELECT id, std_id, full_name, address, city, state FROM student ORDER BY last_update DESC LIMIT 20`;
    }
    db.query(sql, params)
        .then(result => res.json(result))
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    let sql = "SELECT * FROM student WHERE id=?";
    db.query(sql, [parseInt(id)])
        .then(students =>  res.json(students[0]))
        .catch(next);
};

let findByData = (req, res, next) => {
    let student = req.body;
    let sql = `SELECT * FROM student WHERE user_id=? AND pwd=?`;
    db.query(sql, [student.user_id,student.pwd])
    .then(students =>  res.json(students[0]))
    .catch(next);
};

let createItem = (req, res, next) => {
    let student = req.body;
    let sql = `
        INSERT INTO student SET ? ;
        SELECT LAST_INSERT_ID()`;
    db.query(sql, [student])
        .then(result => {
            console.log(result);
            res.json(result[0])
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let student = req.body;
    let sql = `UPDATE student SET full_name=?, address=?, city=?, state=?, zip=?, dob=?, phone=?,
                mobile_phone=?, email=?, pic=?, last_update=current_timestamp WHERE id=?`;
    db.query(sql, [student.full_name, student.address, student.city, student.state, student.zip,
        student.dob, student.phone, student.mobile_phone, student.email, student.pic, student.id])
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

let deleteItem = (req, res, next) => {
    let studentId = req.params.id;
    db.query('DELETE FROM student WHERE id=?', [studentId], true)
        .then(() =>res.send({result: 'ok'}))
        .catch(next);
};

exports.findAll = findAll;
exports.findById = findById;
exports.createItem = createItem;
exports.findByData = findByData;
exports.updateItem = updateItem;
exports.deleteItem = deleteItem;