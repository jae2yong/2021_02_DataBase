import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();
//employee, Department 테이블의 데이터 값 제시
router.get('/', async function(req, res) {
  const employee = await selectSql.getEmployee();
  const department = await selectSql.getDepartment();
//views 폴더의 select.hbs 파일과 연동
  res.render('select', {
    title: '직원 테이블',
    title2: '부서 테이블',
    employee,
    department
  });
});
module.exports = router;