import express from 'express';
import { insertSql, selectSql, beginTransaction, commit, rollback } from '../database/sql';

const router = express.Router();

router.get('/', (_req, res) => {
  if (_req.session.user == undefined || _req.session.user.role !== 'admin') {
      res.redirect('/');
  } else {
      res.render('addNurse', {
          main_title: "간호사 추가",
      });
  }
});  

router.post('/', async (req, res) => {
  const { name, address, phone, department_id, login_id, login_password } = req.body;

  try {
    await beginTransaction();

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

    await commit();

    res.redirect('/');
  } catch (error) {
    await rollback();
  }
});

module.exports = router;