import express from 'express';
import { selectSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (!req.session.user || req.session.user.role !== 'patient') {
        res.redirect('/');
    } else {
        const userId = req.session.user.id;
        const patientId = (await selectSql.getPatientId(userId))[0].Patient_ID;
        const inpatients = await selectSql.getInpatient(patientId);

        res.render('deleteInpatient', {
            main_title: '입원 취소',
            inpatients,
        });
    }
});

router.post('/delete', async (req, res) => {
    const { Inpatient_Number } = req.body;

    await deleteSql.deleteInpatient({ Inpatient_Number });

    res.redirect('/deleteInpatient');
});

module.exports = router;