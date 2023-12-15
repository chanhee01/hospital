import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user == undefined) {
        res.redirect('/');
    } else if (req.session.user.role === 'admin') {
        const doctor = await selectSql.getDoctorView();
        res.render('viewDoctor', {
            title: "의사 이름 및 부서 번호만 조회",
            doctor,
        });
    } else {
        res.redirect('/');
    }
});

module.exports = router;