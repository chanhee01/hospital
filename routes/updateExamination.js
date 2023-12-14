import express from 'express';
import { selectSql, updateSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user == undefined || req.session.user.role !== 'doctor') {
        res.redirect('/');
    } else {
        const examination_res = await selectSql.getExamination();
        console.log(examination_res)
        res.render('updateExamination', {
            main_title: "진료기록 수정",
            examination_res,
        });
    }
});

router.post('/', async (req, res) => {
    const vars = req.body;
    console.log(vars)
    const data = {
        Examination_number: vars.examination_number,
        Examination_Date_Time: vars.examination_date_time,
        Examination_Details: vars.details,
        Doctor_ID: vars.doctor_ID,
        Patient_ID: vars.patient_ID,
    }

    await updateSql.updateExamination(data);

    res.redirect('/updateExamination');
})

router.post('/deleteExamination', async (req, res) => {
    const { examination_number } = req.body;
    await deleteSql.deleteExamination({ Examination_number: examination_number });

    res.redirect('/updateExamination');
});

module.exports = router;