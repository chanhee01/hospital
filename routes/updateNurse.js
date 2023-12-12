import express from 'express';
import { selectSql, updateSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user == undefined || req.session.user.role !== 'admin') {
        res.redirect('/');
    } else {
        const nurse_res = await selectSql.getNurse();
        console.log(nurse_res)
        res.render('updateNurse', {
            main_title: "UPDATE table",
            nurse_res,
        });
    }
});

router.post('/', async (req, res) => {
    const vars = req.body;
    console.log(vars)
    const data = {
        Nurse_ID: vars.nurse_id,
        Name: vars.name,
        Address: vars.address,
        Phone_number: vars.phonenumber,
        Department_ID: vars.department_id
    }
    await updateSql.updateNurse(data);

    res.redirect('/updateNurse');
});

router.post('/deleteNurse', async (req, res) => {
    const { nurse_id } = req.body;
    await deleteSql.deleteNurse({ Nurse_ID: nurse_id });

    res.redirect('/updateNurse');
});

module.exports = router;