import express from 'express';
import { insertSql, selectSql } from '../database/sql';

const router = express.Router();

router.get('/', (_req, res) => {
  if (_req.session.user == undefined || _req.session.user.role !== 'patient') {
      res.redirect('/');
  } else {
      res.render('addInpatient', {
          main_title: "입원 신청",
      });
  }
});

router.post('/', async (req, res) => {
    const currentUser = req.session.user;
    
    const patient = await selectSql.getPatientId(currentUser.id);

    const patientID = patient[0].Patient_ID;

    const { Room_Info, Admission_Date, Discharge_Date_Time } = req.body;

    const inpatientData = {
        Room_Info,
        Admission_Date,
        Discharge_Date_Time,
        Patient_ID: patientID,    
    }

    await insertSql.setInpatient(inpatientData);

    res.redirect('/');
});

module.exports = router;