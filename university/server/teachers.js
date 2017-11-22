"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let name = req.query.name;
    let sql = `SELECT t.teacher_name AS name, t.phone, u.univ_name AS university, t.univ_code AS university_id
        FROM teacher as t 
        INNER JOIN university as u ON t.univ_code=u.univ_code
        ORDER BY teacher_name`;
    db.query(sql)
        .then(result => res.json(result))
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    let sql = `SELECT t.teacher_name AS name, t.phone, u.univ_name AS university, t.univ_code AS university_id
        FROM teacher as t 
        INNER JOIN university as u ON t.univ_code=u.univ_code WHERE phone=?`;
    db.query(sql, [parseInt(id)])
        .then(teachers =>  res.json(teachers[0]))
        .catch(next);
};

let findByData = (req, res, next) => {
    let teacher = req.body;
    let sql = `SELECT teacher_name, phone, univ_code AS university FROM teacher WHERE phone=? AND pswd=?`;
    db.query(sql, [teacher.phone,teacher.pswd])
    .then(teachers =>  res.json(teachers[0]))
    .catch(next);
};

let createItem = (req, res, next) => {
    let teacher = req.body;
    let sql = `
        INSERT IGNORE INTO teacher SET ?`;
    db.query(sql, [teacher])
        .then(result => {
            res.json(result)
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let teacher = req.body;
    let sql = `UPDATE teacher SET name=?, phone=?, university=?, allowed=? WHERE id=?`;
    db.query(sql, [teacher.name, teacher.phone, teacher.university_id, teacher.allowed, teacher.id])
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

let deleteItem = (req, res, next) => {
    let teacherId = req.params.id;
    db.query('DELETE FROM teacher WHERE id=?', [teacherId], true)
        .then(() =>res.send({result: 'ok'}))
        .catch(next);
};


exports.findAll = findAll;
exports.findById = findById;
exports.createItem = createItem;
exports.updateItem = updateItem;
exports.findByData = findByData;
exports.deleteItem = deleteItem;