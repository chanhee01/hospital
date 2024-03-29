import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();

router.get('/', (req, res) => {
    res.render('login');
});

router.post('/', async (req, res) => {
    const vars = req.body;
    const users = await selectSql.getUser();

    users.map((user) => {
        if (vars.id == user.ID && vars.Password == user.Password) {
            console.log('login success!');
            req.session.user = { id: user.User_ID, role: user.Role, checkLogin: true };
        }
    });

    if (req.session.user == undefined) {
        console.log('login failed!');
        res.send(`<script>
                    alert('login failed!');
                    location.href='/';
                </script>`);
    } else {
    
        switch (req.session.user.role) {
            case 'admin':
                res.redirect('/admin');
                break;
            case 'doctor':
                res.redirect('/updateExamination');
                break;
            case 'nurse':
                res.redirect('/updateTreatment');
                break;
            case 'patient':
                res.redirect('/addReservation');
                break;
            default:
                res.redirect('/');
        }
    }
});

module.exports = router;