//node_modules에서 사용할 module을 load
import express from "express";
import logger from "morgan";
import path from "path";
//routes로부터 사용할 router load
import adminRouter from "../routes/admin";
import loginRouter from "../routes/login";
import selectRouter from "../routes/select";
import deleteRouter from "../routes/delete";
import updateRouter from "../routes/update";
import res_userRouter from "../routes/res_user";

// 서버 실행 코드
const PORT = 3000;

const app = express();

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.set('views', path.join(__dirname, '../views'))
app.set('view engine', 'hbs')

app.use(logger("dev"));
//select,delete 라우터 선언 코드
app.use('/', loginRouter);
app.use('/admin', adminRouter);
app.use('/select', selectRouter);
app.use('/delete/user', deleteRouter);
app.use('/update',updateRouter);
app.use('/res_user',res_userRouter);

    app.listen(PORT, () => {
        console.log(`Example app listening at http://localhost:${PORT}`)
    })