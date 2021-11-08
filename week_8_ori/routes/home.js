import express from "express";
import { insertSql, selectSql } from "../database/sql";

const router = express.Router();
//views폴더의 home.hbs파일과 연동
router.get('/', (req,res) => {
    res.render('home');
});

router.post('/', (req, res) => {
    const vars = req.body;
    const var_lenth = Object.keys(req.body).length;
// 삽입 될 Employee 데이터의 형식 지정
    if (var_lenth > 4) {
        const data = {
            Fname: vars.fname,
            Minit: vars.minit,
            Lname: vars.lname,
            Ssn: vars.ssn,
            Bdate: vars.bdate,
            Address: vars.address,
            Sex: vars.sex,
            Salary: vars.salary,
            Super_ssn: vars.super_ssn,
            Dno: vars.dno
        };
        //data를 insert문으로 저장
        insertSql.setEmployee(data);
    } 
    //삽입될 Department 데이터 형식 지정
    else {
        const data = {
            Dname: vars.dname,
            Dnumber: vars.dnumber,
            Mgr_ssn: vars.mgr_ssn,
            Mgr_start_date: vars.mgr_start_date
        };
        insertSql.setDepartment(data);
    }

    res.redirect('/');
})
module.exports = router;
