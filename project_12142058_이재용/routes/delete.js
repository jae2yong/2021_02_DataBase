import express from "express";
//selectSql와 deleteSql을 불러옴
import { selectSql, deleteSql } from "../database/sql";

const router = express.Router();
// 기존의 입력 값 불러오기
router.get('/', async (req, res) => {
    const user = await selectSql.getuser();
    //view폴더의 delete.hbs와 연동
    res.render('deleteuser', {
        //제목을 삭제 기능이라 표시하고 dept_locations의 테이블 값을 가져옴
        title: "예약 취소",
        user
    })
});

router.post('/', async (req, res) => {
    //console.log을 통하여 전달 받은 값 표시
    console.log('delete router:', req.body.delBtn);
    //data는 dlocation을 나타냄
    const data = {
        UserID: req.body.delBtn,
    };

    await deleteSql.deleteuser(data);
// 삭제 버튼 이후 delete페이지로 재이동
    res.redirect('/delete');
});

router.get('/admin', async (req, res) => {
    const airport = await selectSql.getairport();
    const airplane = await selectSql.getairplane();
    const flight = await selectSql.getflight();
    //view폴더의 delete.hbs와 연동
    res.render('deleteadmin', {
        //제목을 삭제 기능이라 표시하고 dept_locations의 테이블 값을 가져옴
        title: "공항 정보 삭제",
        airport,airplane,flight
    })
});


router.post('/admin', async (req, res) => {
    //console.log을 통하여 전달 받은 값 표시
    console.log('delete router:', req.body.delBtn);
    //data는 dlocation을 나타냄
    const data = {
        Dlocation: req.body.delBtn,
    };

    await deleteSql.deleteadmin(data);
// 삭제 버튼 이후 delete페이지로 재이동
    res.redirect('/deleteadmin');
});

module.exports = router;