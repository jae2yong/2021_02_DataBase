import express from "express";
import logger from "morgan";
import path from "path";

import loginRouter from "../routes/login";
import selectRouter from "../routes/select";
import deleteRouter from "../routes/delete";
// 서버 실행 코드
const PORT = 3000;

const app = express();

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.set('views', path.join(__dirname, '../views'))
app.set('view engine', 'hbs')

app.use(logger("dev"));
//라우터 선언 코드
app.use('/', loginRouter);
app.use('/select', selectRouter);
app.use('/delete', deleteRouter);

    app.listen(PORT, () => {
        console.log(`Example app listening at http://localhost:${PORT}`)
    })