"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let name = req.query.name;
    let sql = `SELECT id, full_name, address, city, zip, state, full_name as name
        FROM teacher ORDER BY full_name`;
    db.query(sql)
        .then(result => res.json(result))
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    let sql = `SELECT id, full_name, address, city, state, zip, title, phone, mobile_phone, email, pic
        FROM teacher WHERE id=?`;
    db.query(sql, [parseInt(id)])
        .then(teachers =>  res.json(teachers[0]))
        .catch(next);
};

let findByData = (req, res, next) => {
    let teacher = req.body;
    let sql = `SELECT * FROM teacher WHERE user_id=? AND pwd=?`;
    db.query(sql, [teacher.user_id,teacher.pwd])
    .then(teachers =>  res.json(teachers[0]))
    .catch(next);
};

let createItem = (req, res, next) => {
    let teacher = req.body;
    let sql = `
        INSERT INTO teacher SET ? ;
        SELECT LAST_INSERT_ID()`;
    db.query(sql, [teacher])
        .then(result => {
            console.log(result);
            res.json(result[0])
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let teacher = req.body;
    let sql = `UPDATE teacher SET full_name=?, address=?, city=?, state=?, zip=?, title=?, phone=?,
                mobile_phone=?, email=?, pic=? WHERE id=?`;
    db.query(sql, [teacher.full_name, teacher.address, teacher.city, teacher.state, teacher.zip,
        teacher.title, teacher.phone, teacher.mobile_phone, teacher.email, teacher.pic, teacher.id])
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