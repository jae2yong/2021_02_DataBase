import express from "express";
import logger from "morgan";
import path from "path";

import homeRouter from "../routes/home";
import updateRouter from "../routes/update";
import selectRouter from "../routes/select";
// 서버 실행 코드
const PORT = 3000;
const app = express();

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.set('views', path.join(__dirname, '../views'))
app.set('view engine', 'hbs')

app.use(logger("dev"));
//라우터 선언 코드
app.use('/', homeRouter);
app.use('/update', updateRouter);
app.use('/select', selectRouter);

    app.listen(PORT, () => {
        console.log(`Example app listening at http://localhost:${PORT}`)
    })