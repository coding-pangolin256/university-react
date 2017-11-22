"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let universityId = req.query.universityId;
    let table_name = universityId + `_course`;
    let sql = `
        SELECT c.id, c.code, c.name, c.teacher_id, c.university_id, t.name as teacher_name,
            c.period_id, p.name as period_name,
            count(e.student_id) as student_count
        FROM ${table_name} as c
        INNER JOIN teacher as t ON c.teacher_id=t.id
        INNER JOIN period as p ON c.period_id=p.id
        LEFT OUTER JOIN enrollment as e ON c.id=e.course_id
        GROUP BY c.id, t.name, p.name
        ORDER BY period_id DESC, code`;
    db.query(sql, universityId ? [universityId] : [])
        .then(result => res.json(result))
        .catch(next);
};

let findByTeacher = (req, res, next) => {
    let teacherId = req.body.teacher_id;
    let universityId = req.body.university_id;
    let sql = `
        SELECT c.course_code AS code, c.title AS name, t.phone AS teacher_id, t.univ_code AS university_id, t.teacher_name,
            count(r.student_id) as student_count
        FROM course as c
        LEFT JOIN teaching as e ON c.course_code=e.course_code
        INNER JOIN teacher as t ON e.phone=t.phone
        LEFT OUTER JOIN ${universityId}_enrolling as r ON c.course_code=r.course_code
        WHERE t.phone = ?
        GROUP BY c.course_code, t.teacher_name
        ORDER BY c.course_code`;
    db.query(sql, [parseInt(teacherId)])
        .then(courses =>  res.json(courses))
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    let sql = `
        SELECT c.course_code AS code, c.title AS name, t.phone AS teacher_id, t.teacher_name
        FROM course as c
        INNER JOIN teaching as e ON e.course_code=c.course_code
        INNER JOIN teacher as t ON e.phone=t.phone
        WHERE c.course_code = ?`;
    db.query(sql, [id])
        .then(courses =>  res.json(courses[0]))
        .catch(next);
};

let createItem = (req, res, next) => {
    let course = req.body;
    let table_name = 'course';
    let sql = `INSERT INTO ${table_name} (title,course_code)
			   VALUES (?,'')`;
    db.query(sql, [course.name])
        .then(result => {
            var d = new Date();
            var year = d.getFullYear()%100;
            let secret_code = course.university_id + year + course.period_id + result.insertId;
            let sql = `UPDATE ${table_name} SET course_code=? WHERE id=?`;
            db.query(sql, [secret_code,result.insertId]);
            sql = `INSERT INTO teaching (course_code, phone) VALUES (?, ?)`;
            db.query(sql, [secret_code,course.teacher_id]);
            res.send({id: secret_code});
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let course = req.body;
    let table_name = course.university_id + '_course';
    let sql = `UPDATE ${table_name} SET code=?, name=?, period_id=?, teacher_id=? WHERE id=?`;
    db.query(sql, [course.code, course.name, course.period_id, course.teacher_id, course.id])
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

let deleteItem = (req, res, next) => {
    let courseId = req.params.id;
    var search = courseId.search(/\d/);
    var university_id = courseId.slice(0,search);
    var course_id = courseId.slice(search+6);
    db.query(`DELETE FROM ${university_id}_course WHERE id=?`, [course_id], true)
        .then(() => {
            let sql = `DROP TABLE IF EXISTS ` + courseId +`_students`;
            db.query(sql);
            sql = `DROP TABLE IF EXISTS ` + courseId + `_homework`;
            db.query(sql);
            sql = `DROP TABLE IF EXISTS ` + courseId + `_material`;
            db.query(sql);
            sql = `DROP TABLE IF EXISTS ` + courseId + `_chat`;
            db.query(sql);
            res.send({result: 'ok'});
        })
        .catch(next);
};

exports.findAll = findAll;
exports.findByTeacher = findByTeacher;
exports.findById = findById;
exports.createItem = createItem;
exports.updateItem = updateItem;
exports.deleteItem = deleteItem;