import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user == undefined) {
        res.redirect('/');
    } else if (req.session.user.role === 'admin') {
        const doctor = await selectSql.getDoctor();
        const nurse = await selectSql.getNurse();
        res.render('admin', {
            title: "Admin page",
            doctor,
            nurse
        });
    } else {
        res.redirect('/');
    }
});

module.exports = router;