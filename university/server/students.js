"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let name = req.query.name;
    let params = [];
    let sql;
    if (name) {
        sql = `
            SELECT id, name FROM course${student.course_id}student
            WHERE name LIKE ? ORDER BY name LIMIT 20`;
        params.push("%" + name + "%");
    } else {
        sql = `SELECT id, name FROM student ORDER BY id LIMIT 20`;
    }
    db.query(sql, params)
        .then(result => res.json(result))
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    var search = id.search(/\d/);
    var university_id = id.slice(0,search);
    var student_id = id.slice(search);
    let sql = `SELECT * FROM ${university_id}_student WHERE id=?`;
    db.query(sql, [student_id])
        .then(students =>  res.json(students[0]))
        .catch(next);
};

let findByData = (req, res, next) => {
    let student = req.body;
    let sql = `SELECT * FROM course${student.course_id}student WHERE id=? AND pwd=?`;
    db.query(sql, [student.id, student.pwd])
    .then(students =>  res.json(students[0]))
    .catch(next);
};

let createItem = (req, res, next) => {
    let student = req.body;
    var course_id = student.course_id;
    delete student.course_id;
    let sql = `
        INSERT INTO course${course_id}student SET ?`;
    db.query(sql, [student])
        .then(result => {
            res.json(result)
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let student = req.body;
    let sql = `UPDATE course${student.course_id}student SET name=? WHERE id=?`;
    db.query(sql, [student.name, student.id])
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

let deleteItem = (req, res, next) => {
    let studentId = req.params.id;
    db.query('DELETE FROM course${student.course_id}student WHERE id=?', [studentId], true)
        .then(() =>res.send({result: 'ok'}))
        .catch(next);
};

exports.findAll = findAll;
exports.findById = findById;
exports.createItem = createItem;
exports.findByData = findByData;
exports.updateItem = updateItem;
exports.deleteItem = deleteItem;