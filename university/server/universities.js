"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let name = req.query.name;
    let sql = `SELECT code, name
        FROM university ORDER BY name`;
    db.query(sql)
        .then(result => res.json(result))
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    let sql = `SELECT code, name
        FROM university WHERE id=?`;
    db.query(sql, [parseInt(id)])
        .then(universitys =>  res.json(universitys[0]))
        .catch(next);
};

let createItem = (req, res, next) => {
    let university = req.body;
    let sql = `
        INSERT IGNORE INTO university SET ?`;
    db.query(sql, [university])
        .then(result => {
            res.json(result)
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let university = req.body;
    let sql = `UPDATE university SET name=? WHERE code=?`;
    db.query(sql, [university.name, university.email, university.allowed, university.university, university.department, university.id])
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

let deleteItem = (req, res, next) => {
    let universityId = req.params.id;
    db.query('DELETE FROM university WHERE code=?', [universityId], true)
        .then(() =>res.send({result: 'ok'}))
        .catch(next);
};


exports.findAll = findAll;
exports.findById = findById;
exports.createItem = createItem;
exports.updateItem = updateItem;
exports.deleteItem = deleteItem;