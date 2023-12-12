import express from 'express';
import { insertSql, selectSql } from '../database/sql';

const router = express.Router();

router.get('/', (_req, res) => {
  if (_req.session.user == undefined || _req.session.user.role !== 'nurse') {
      res.redirect('/');
  } else {
      res.render('addTreatment', {
          main_title: "Add Treatment",
      });
  }
});

router.post('/', async (req, res) => {
    console.log(req.body);
    const { Treatment_Date_Time, Treatment_Details, Nurse_ID, Patient_ID } = req.body;

    const treatmentData = {
        Treatment_Date_Time,
        Treatment_Details,
        Nurse_ID,
        Patient_ID,
    };

    await insertSql.setTreatment(treatmentData);

    res.redirect('/');
});

module.exports = router;