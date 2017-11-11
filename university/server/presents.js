"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let courseId = req.query.courseId;
    let sql = `
        SELECT *, IF(SHARE, 'Shared', '-') AS shared
        FROM ${courseId}_material`;
    db.query(sql)
        .then(result => res.json(result))
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    let sql = `SELECT *, IF(SHARE, 'Shared', '-') AS shared
        FROM lecture
        WHERE id = ?`;
    db.query(sql, [parseInt(id)])
        .then(presents =>  res.json(presents[0]))
        .catch(next);
};

let findByData = (req, res, next) => {
    let id = req.params.id;
    let present = req.body;
    let table_name = present.course_code + '_material';
    delete present.course_code;
    let sql = `SELECT *, IF(SHARE, 'Shared', '-') AS shared
            FROM ${table_name} WHERE ?`;
    db.query(sql, present)
        .then(presents =>  res.json(presents))
        .catch(next);
};

let createItem = (req, res, next) => {
    let present = req.body;
    let table_name = present.course_code + '_material';
    delete present.course_code;
    let sql = `INSERT INTO ${table_name} SET ?`;
    db.query(sql, present)
        .then(result => {
            res.send({id: result.insertId});
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let present = req.body;
    let table_name = present.course_code + '_material';
    delete present.course_code;
    var id = present.id;
    delete present.id;
    let sql = `UPDATE ${table_name} SET ? WHERE id=?`;
    db.query(sql, [present, id])
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

let deleteItem = (req, res, next) => {
    let Id = req.params.id;
    var search = Id.search('_');
    let table_name = Id.slice(0,search) + '_material';
    let presentkId = Id.slice(search + 1);
    db.query(`DELETE FROM ${table_name} WHERE id=?`, [presentkId], true)
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

exports.findAll = findAll;
exports.findById = findById;
exports.createItem = createItem;
exports.updateItem = updateItem;
exports.deleteItem = deleteItem;
exports.findByData = findByData;