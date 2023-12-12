import express from 'express';
import { insertSql, selectSql } from '../database/sql';

const router = express.Router();

router.get('/', (_req, res) => {
  res.render('addDoctor', {
    main_title: "Add Doctor",
  });
});

router.post('/', async (req, res) => {
  const { name, address, phone, department_id, login_id, login_password } = req.body;

  const userData = {
    ID: login_id,
    Password: login_password,
    Role: 'Doctor',
  };
  await insertSql.setUser(userData);

  const maxUserIdResult = await selectSql.getMaxUserId();
  const maxUserId = maxUserIdResult;

  const doctorData = {
    Name: name,
    Address: address,
    Phone_number: phone,
    Department_ID: department_id,
    User_ID: maxUserId,
  };
  await insertSql.setDoctor(doctorData);

  res.redirect('/');
});

module.exports = router;