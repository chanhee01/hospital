import express from 'express';
import logger from 'morgan';
import path from 'path';
import expressSession from "express-session";

import loginRouter from '../routes/login';
import adminRouter from '../routes/admin';
import updateDoctorRouter from '../routes/updateDoctor';
import updateNurseRouter from '../routes/updateNurse';
import addDoctorRouter from '../routes/addDoctor';
import addNurseRouter from '../routes/addNurse';
import addExaminationRouter from '../routes/addExamination';
import updateExaminationRouter from '../routes/updateExamination';
import addTreatmentRouter from '../routes/addTreatment';
import updateTreatmentRouter from '../routes/updateTreatment';
import selectPatientRouter from '../routes/selectPatient'
import addReservationRouter from '../routes/addReservation'
import selectReservationRouter from '../routes/selectReservation'
import deleteReservationRouter from '../routes/deleteReservation'
import addInpatientRouter from '../routes/addInpatient'
import selectInpatientRouter from '../routes/selectInpatient'
import deleteInpatientRouter from '../routes/deleteInpatient'


const PORT = 3000;

const app = express();

app.use(express.static(path.join(__dirname, '/src')));
app.use(express.urlencoded({ extended: false }))
app.use(express.json());
app.use(
    expressSession({
        secret: "my key",
        resave: true,
        saveUninitialized: true,
    })
);

app.set('views', path.join(__dirname, '../views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));

app.use('/', loginRouter);
app.use('/admin', adminRouter);
app.use('/updateDoctor', updateDoctorRouter);
app.use('/updateNurse', updateNurseRouter);
app.use('/addDoctor', addDoctorRouter);
app.use('/addNurse', addNurseRouter);
app.use('/addExamination', addExaminationRouter);
app.use('/updateExamination', updateExaminationRouter);
app.use('/addTreatment', addTreatmentRouter);
app.use('/updateTreatment', updateTreatmentRouter);
app.use('/selectPatient', selectPatientRouter)
app.use('/addReservation', addReservationRouter)
app.use('/selectReservation', selectReservationRouter)
app.use('/deleteReservation', deleteReservationRouter)
app.use('/addInpatient', addInpatientRouter)
app.use('/selectInpatient', selectInpatientRouter)
app.use('/deleteInpatient', deleteInpatientRouter)


app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`)
});
