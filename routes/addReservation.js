import express from 'express';
import { insertSql, selectSql } from '../database/sql';

const router = express.Router();

router.get('/', (_req, res) => {
  if (_req.session.user == undefined || _req.session.user.role !== 'patient') {
      res.redirect('/');
  } else {
      res.render('addReservation', {
          main_title: "예약 추가",
      });
  }
});

router.post('/', async (req, res) => {
    const currentUser = req.session.user;
    
    const patient = await selectSql.getPatientId(currentUser.id);

    const patientID = patient[0].Patient_ID;

    const { Reservation_Date_Time, Department_ID } = req.body;

    const reservationData = {
      Reservation_Date_Time,
      Department_ID,
      Patient_ID: patientID,    
    }

    await insertSql.setReservation(reservationData);

    res.redirect('/');
});

module.exports = router;