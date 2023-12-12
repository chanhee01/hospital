import express from 'express';
import { selectSql, updateSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user == undefined || req.session.user.role !== 'admin') {
        res.redirect('/');
    } else {
        const doctor_res = await selectSql.getDoctor();
        console.log(doctor_res)
        res.render('updateDoctor', {
            main_title: "UPDATE table",
            doctor_res,
        });
    }
});

router.post('/', async (req, res) => {
    const vars = req.body;
    console.log(vars)
    const data = {
        Doctor_ID: vars.doctor_id,
        Name: vars.name,
        Address: vars.address,
        Phone_number: vars.phonenumber,
        Department_ID: vars.department_id
    }
    await updateSql.updateDoctor(data);

    res.redirect('/updateDoctor');
})

router.post('/deleteDoctor', async (req, res) => {
    const { doctor_id } = req.body;
    await deleteSql.deleteDoctor({ Doctor_ID: doctor_id });

    res.redirect('/updateDoctor');
});

module.exports = router;