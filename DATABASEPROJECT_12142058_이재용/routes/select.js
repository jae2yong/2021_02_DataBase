import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();
//employee, dept_locations 테이블의 데이터 값 제시
router.get('/', async function(req, res) {
  const dept_locations = await selectSql.getdept_locations();
//views 폴더의 select.hbs 파일과 연동
  res.render('select', {
      title: 'IT 공대',
      dept_locations
  });
});
module.exports = router;