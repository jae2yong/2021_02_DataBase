//node_modules에서 사용할 module을 load
import express from "express";
import logger from "morgan";
import path from "path";
//routes로부터 사용할 router load
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
//select,delete 라우터 선언 코드
app.use('/', loginRouter);
app.use('/select', selectRouter);
app.use('/delete', deleteRouter);

    app.listen(PORT, () => {
        console.log(`Example app listening at http://localhost:${PORT}`)
    })