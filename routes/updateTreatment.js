import express from 'express';
import { selectSql, updateSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user == undefined || req.session.user.role !== 'nurse') {
        res.redirect('/');
    } else {
        const treatment_res = await selectSql.getTreatment();
        console.log(treatment_res)
        res.render('updateTreatment', {
            main_title: "치료기록 수정",
            treatment_res,
        });
    }
});

router.post('/', async (req, res) => {
    const vars = req.body;
    console.log(vars)
    const data = {
        Treatment_number: vars.treatment_number,
        Treatment_Date_Time: vars.treatment_date_time,
        Treatment_Details: vars.details,
        Nurse_ID: vars.nurse_ID,
        Patient_ID: vars.patient_ID,
    }

    await updateSql.updateTreatment(data);

    res.redirect('/updateTreatment');
})

router.post('/deleteTreatment', async (req, res) => {
    const { treatment_number } = req.body;
    await deleteSql.deleteTreatment({ Treatment_number: treatment_number });

    res.redirect('/updateTreatment');
});

module.exports = router;