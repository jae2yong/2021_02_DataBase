import express from "express";
import { selectSql, deleteSql } from "../database/sql";

const router = express.Router();
// 기존의 입력 값 불러오기
router.get('/', async (req, res) => {
    const department = await selectSql.getDepartment();
    
    res.render('delete', {
        title: "삭제 기능",
        department
    })
});
// 기존의 입력 값 불러오기
router.post('/', async (req, res) => {
    console.log('delete router:', req.body.delBtn);
    
    const data = {
        Dnumber: req.body.delBtn,
    };

    await deleteSql.deleteDepartment(data);

    res.redirect('/delete');
});

module.exports = router;