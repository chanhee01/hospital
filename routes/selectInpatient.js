import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (!req.session.user || req.session.user.role !== 'patient') {
      res.redirect('/');
    } else {
      
    const userId = req.session.user.id;

    const patientId = (await selectSql.getPatientId(userId))[0].Patient_ID;
      
    const inpatients = await selectSql.getInpatient(patientId);

    console.log(inpatients);
      
    res.render('selectInpatient', {
        main_title: '입원 조회',
        inpatients,
    });

    }
});

module.exports = router;