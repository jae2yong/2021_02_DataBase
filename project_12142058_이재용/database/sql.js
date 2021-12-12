import mysql from "mysql2";

//데이터베이스 연결
const pool = mysql.createPool(
    process.env.JAWSDB_URL ?? {
        host: 'localhost',
        user: 'root',
        database: 'database_project',
        password: 'wodyd272895',
        waitForConnections: true,
        connectionLimit: 10,
        queueLimitL: 0
    }
);
// async / await 사용
const promisePool = pool.promise();

// select query
// user테이블을 select
export const selectSql = {
    getuser : async () => {
        const [rows] = await promisePool.query(`select * from user`);
        return rows
    },
//dept_locations 테이블을 select
    getairport : async() => {
        const [rows] = await promisePool.query(`select * from airport`);
        
        return rows
    },
     getairplane : async() => {
       const [rows] = await promisePool.query(`select * from airplane`);
    
       return rows
    },
    getflight : async() => {
        const [rows] = await promisePool.query(`select * from flight`);
     
        return rows
     },
}
// export const insertSql = {
//     setuser : async () => {
//         const sql = `insert into user values (
//             "${data.UserID}","${data.Flight_number}", "${data.Date}","${data.Seat_number}","${data.Customer_name}","${data.Customer_phone}")`;
//         await promisePool.query(sql);
//     },
// }
 // delete query

//  export const updateSql = {
//     updateairport: async (data) => {
//         // where 조건을 만족하는 행에 대해서 salary 수정
//         const sql = `update airport = "${data.Airport_code}" where Airport_code = 1`;
//         await promisePool.query(sql);
//     },
//  }
//  export const updateSql = {
//     updateairplane : async (data) => {
//         // where 조건을 만족하는 행에 대해서 salary 수정
//         const sql = `update airplane = "${data.Airplane_id}" where Airplane_id = 1`;
//         await promisePool.query(sql);
//     },
// }
// export const updateSql = {
//     updateflight : async (data) => {
//         // where 조건을 만족하는 행에 대해서 salary 수정
//         const sql = `update flight = "${data.flight}" where Flight_number = 1`;
//         await promisePool.query(sql);
//     },
// }