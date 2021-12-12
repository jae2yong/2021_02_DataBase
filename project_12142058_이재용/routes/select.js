import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();
//employee, dept_locations 테이블의 데이터 값 제시
router.get('/', async function(req, res) {
  const user = await selectSql.getuser();
  const airport = await selectSql.getairport();
  const airplane = await selectSql.getairplane();
  const flight = await selectSql.getflight();
//views 폴더의 select.hbs 파일과 연동
  res.render('select', {
      title: '예약 조회',
      user,airport,airplane,flight
  });
});
module.exports = router;