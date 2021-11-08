import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();
//employee, Department 테이블의 데이터 값 제시
router.get('/', async function(req, res) {
  const department = await selectSql.getDepartment();
//views 폴더의 select.hbs 파일과 연동
  res.render('select', {
      title: 'IT 공대',
      department
  });
});
module.exports = router;