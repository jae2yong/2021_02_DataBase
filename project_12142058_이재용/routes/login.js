import express from "express";
//selectSql을 가져옴
import { selectSql } from "../database/sql";

const router = express.Router();
//get을 통하여 req.query를 메소드로 받음
router.get('/', async (req,res) => {
    res.render('login');
});
//req.body를 메소드로 받음
router.post('/', async (req, res) => {
    const vars = req.body;
    const users = await selectSql.getuser();
    let whoAmI = '';
    let checkLogin = false;
//user의 id와 password가 일치할 시 login success!을 나타냄
users.map((user)=> {
    console.log(user.Id);
    if (vars.id === user.Id && vars.password === user.Password){
        console.log('login success!');
        checkLogin = true;
        if (vars.id === 'admin'){
            whoAmI = 'admin';
        } else {
            whoAmI = 'user';
        }
    }
})

if (checkLogin && whoAmI === 'admin'){
    //admin일 시 delete로 이동
    res.redirect('/delete');
} else if (checkLogin && whoAmI ==='user'){
    //user일 시 select로 이동
    res.redirect('/select');
} else {
    //user의 id와 password가 불치할 시 로그인에 실패했습니다를 나타냄
    console.log('login failed');
    res.send("<script>alert('로그인에 실패했습니다.'); location.href='/';</script>");
}
})

module.exports = router;
