import express from 'express';
import { insertSql, selectSql } from '../database/sql';

const router = express.Router();

router.get('/', (_req, res) => {
  if (_req.session.user == undefined || _req.session.user.role !== 'doctor') {
      res.redirect('/');
  } else {
      res.render('addExamination', {
          main_title: "진료기록 추가",
      });
  }
});

router.post('/', async (req, res) => {
    console.log(req.body);
    const { Examination_Date_Time, Examination_Details, Doctor_ID, Patient_ID } = req.body;

    const examinationData = {
        Examination_Date_Time,
        Examination_Details,
        Doctor_ID,
        Patient_ID,
    };

    await insertSql.setExamination(examinationData);

    res.redirect('/');
});

module.exports = router;