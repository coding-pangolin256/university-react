var express = require('express'),
    bodyParser = require('body-parser'),
    compression = require('compression'),
    students = require('./server/students'),
    courses = require('./server/courses'),
    homeworks = require('./server/homeworks'),
    results = require('./server/results'),
    enrollments = require('./server/enrollments'),
    teachers = require('./server/teachers'),
    periods = require('./server/periods'),
    multer = require('multer'),
    // sqlinit = require('./server/sqlinit'),
    app = express();

var busboy = require('connect-busboy');
var fs = require('fs-extra'); 

app.set('port', process.env.PORT || 5000);

app.use(bodyParser.json());
app.use(compression());
app.use(busboy());

app.use('/', express.static(__dirname + '/www'));

app.route('/upload')
.post(function (req, res, next) {
    var fstream;
    req.pipe(req.busboy);
    req.busboy.on('file', function (fieldname, file, filename) {
        console.log("Uploading: " + filename);

        //Path where image will be uploaded
        fstream = fs.createWriteStream(__dirname + '/upload/' + filename);
        file.pipe(fstream);
        fstream.on('close', function () {    
            console.log("Upload Finished of " + filename);              
            res.redirect('back');           //where to go next
        });
    });
});
app.get('/students', students.findAll);
app.get('/students/:id', students.findById);
app.get('/students/:id/enrollments', enrollments.findByStudent);
app.post('/students', students.createItem);
app.post('/student', students.findByData);
app.put('/students', students.updateItem);
app.delete('/students/:id', students.deleteItem);

app.get('/results', results.findAll);
app.get('/results/:id', results.findById);
app.post('/results', results.createItem);
app.post('/result', results.findByHomework);
app.put('/results', results.updateItem);
app.delete('/results/:id', results.deleteItem);

app.get('/courses', courses.findAll);
app.get('/courses/:id', courses.findById);
app.get('/courses/:id/enrollments', enrollments.findByCourse);
app.post('/courses', courses.createItem);
app.put('/courses', courses.updateItem);
app.delete('/courses/:id', courses.deleteItem);

app.get('/homeworks', homeworks.findAll);
app.get('/homeworks/:id', homeworks.findById);
app.get('/homeworks/:id/results', homeworks.findByHomework);
app.post('/homeworks', homeworks.createItem);
app.put('/homeworks', homeworks.updateItem);
app.delete('/homeworks/:id', homeworks.deleteItem);

app.get('/teachers', teachers.findAll);
app.get('/teachers/:id', teachers.findById);
app.get('/teachers/:id/courses', courses.findByTeacher);
app.post('/teachers', teachers.createItem);
app.post('/teacher', teachers.findByData);
app.put('/teachers', teachers.updateItem);
app.delete('/teachers/:id', teachers.deleteItem);

app.post('/enrollments', enrollments.createItem);
app.delete('/enrollments/:id', enrollments.deleteItem);

app.get('/periods', periods.findAll);
app.post('/periods', periods.currentPeriod);

// app.post('/upload', function(req, res) {
//     var file = req.files.file;
//     console.log(file);
//     fs.unlink(file.path, function(err) {
//         res.json({
//             success: !err,
//             file: file
//         });
//     });
// });

app.use(function(err, req, res, next) {
    console.error(err.stack);
    res.status(500).send(err);
});

app.listen(app.get('port'), function () {
    console.log('Express server listening on port ' + app.get('port'));
});