import express from 'express';
import { insertSql, selectSql } from '../database/sql';

const router = express.Router();

router.get('/', (_req, res) => {
  if (_req.session.user == undefined || _req.session.user.role !== 'admin') {
      res.redirect('/');
  } else {
      res.render('addNurse', {
          main_title: "Add Nurse",
      });
  }
});  

router.post('/', async (req, res) => {
  const { name, address, phone, department_id, login_id, login_password } = req.body;

  const userData = {
    ID: login_id,
    Password: login_password,
    Role: 'Nurse',
  };
  await insertSql.setUser(userData);

  const maxUserIdResult = await selectSql.getMaxUserId();
  const maxUserId = maxUserIdResult;

  const nurseData = {
    Name: name,
    Address: address,
    Phone_number: phone,
    Department_ID: department_id,
    User_ID: maxUserId,
  };
  await insertSql.setNurse(nurseData);

  res.redirect('/');
});

module.exports = router;