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
            UserID: vars.userID,
            Flight_number: vars.flight_number,
            Date: vars.date,
            Seat_number: vars.seat_number,
            Customer_name: vars.customer_name,
            Customer_phone: vars.customer_phone,
        };
        //data를 insert문으로 저장
        insertSql.setuser(data);
    } 
    //삽입될 Department 데이터 형식 지정
    else {
        const data = {
            Airport_code: vars.airport_code,
            Name: vars.name,
            City: vars.city,
            State: vars.state
        };
        insertSql.setairport(data);
    }

    res.redirect('/');
})
module.exports = router;
