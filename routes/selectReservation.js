import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (!req.session.user || req.session.user.role !== 'patient') {
      res.redirect('/');
    } else {
      
    const userId = req.session.user.id;

    const patientId = (await selectSql.getPatientId(userId))[0].Patient_ID;
      
    const reservations = await selectSql.getReservation(patientId);

    console.log(reservations);
      
    res.render('selectReservation', {
        main_title: '진료 예약 조회',
        reservations,
    });

    }
});

module.exports = router;