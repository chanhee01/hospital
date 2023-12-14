import express from 'express';
import { selectSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (!req.session.user || req.session.user.role !== 'patient') {
        res.redirect('/');
    } else {
        const userId = req.session.user.id;
        const patientId = (await selectSql.getPatientId(userId))[0].Patient_ID;
        const reservations = await selectSql.getReservation(patientId);

        res.render('deleteReservation', {
            main_title: '예약 취소',
            reservations,
        });
    }
});

router.post('/delete', async (req, res) => {
    const { Reservation_Number } = req.body;

    await deleteSql.deleteReservation({ Reservation_Number });

    res.redirect('/deleteReservation');
});

module.exports = router;