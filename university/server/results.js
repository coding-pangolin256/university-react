"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let courseId = req.query.courseId;
    let sql = `
        SELECT h.id, h.title, h.details, c.id as course_id, c.code as course_code, c.name
        FROM homework as h
        LEFT OUTER JOIN course as c ON h.course_id=c.id
        ${courseId ? 'WHERE h.course_id = ?' : ''}`;
    db.query(sql, courseId ? [courseId] : [])
        .then(result => res.json(result))
        .catch(next);
};

let findByHomework = (req, res, next) => {
    let homework = req.body;
    let table_name = homework.course_code + homework.course_id;
    let path_field = homework.id + '_hw';
    let score_field = homework.id + '_score';
    let sql = `
        SELECT r.std_id as id, ${path_field} as path, ${score_field} as score, s.full_name as student_name
        FROM ${table_name} as r
        LEFT JOIN student as s ON r.std_id = s.id
        WHERE ${path_field} IS NOT NULL
        ORDER BY r.std_id`;
    db.query(sql)
        .then(homeworks =>  {
            res.json(homeworks);
        })
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    let sql = `
        SELECT h.id, h.title, h.details, c.id, c.code, c.name, 
        c.period_id, 
        FROM homework as h
        LEFT JOIN homework as c ON c.id=h.homework_id
        WHERE h.id = ?`;
    db.query(sql, [parseInt(id)])
        .then(homeworks =>  res.json(homeworks[0]))
        .catch(next);
};

let createItem = (req, res, next) => {
    let homework = req.body;
    let table_name = homework.course_code + homework.course_id;
    let path_field = homework.id + '_hw';
    let score_field = homework.id + '_score';
    // let sql = `IF EXISTS (SELECT * FROM ${table_name} WHERE std_id=${homework.std_id})
    //                 UPDATE ${table_name} SET ${path_field} = '${homework.path}' WHERE std_id=${homework.std_id}
    //             ELSE
    //                 INSERT INTO ${table_name} (std_id, ${path_field})    VALUES (?, ?)`;
    let sql = `INSERT INTO ${table_name} (std_id, ${path_field}) VALUES (?, ?)
    ON DUPLICATE KEY UPDATE ${path_field} = '${homework.path}'`;
    db.query(sql, [homework.std_id, homework.path])
        .then(result => {
            let sql = `
                ALTER TABLE ` + homework.course_code + homework.course_id + `
                ADD ` + result.insertId + `_hw TEXT;
                ALTER TABLE ` + homework.course_code + homework.course_id + `
                ADD ` + result.insertId + `_score DOUBLE;
              `;
            db.query(sql);
            res.send({id: result.insertId});
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let homework = req.body;
    let sql = `UPDATE homework SET code=?, name=?, period_id=?, teacher_id=?, credits=? WHERE id=?`;
    db.query(sql, [homework.code, homework.name, homework.period_id, homework.teacher_id, homework.credits, homework.id])
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

let deleteItem = (req, res, next) => {
    let homeworkId = req.params.id;
    db.query('DELETE FROM homework WHERE id=?', [homeworkId], true)
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

exports.findAll = findAll;
exports.findByHomework = findByHomework;
exports.findById = findById;
exports.createItem = createItem;
exports.updateItem = updateItem;
exports.deleteItem = deleteItem;