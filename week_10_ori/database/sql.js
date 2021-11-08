import mysql from "mysql2";

//데이터베이스 연결
const pool = mysql.createPool(
    process.env.JAWSDB_URL ?? {
        host: 'localhost',
        user: 'root',
        database: 'week10',
        password: 'wodyd272895',
        waitForConnections: true,
        connectionLimit: 10,
        queueLimitL: 0
    }
);
// async / await 사용
const promisePool = pool.promise();

// select query
export const selectSql = {
    getUsers : async () => {
        const [rows] = await promisePool.query(`select * from user`);
       
        return rows
    },
    getDepartment : async() => {
        const [rows] = await promisePool.query(`select * from department`);
        
        return rows
    },
    getdept_locations : async() => {
        const [rows] = await promisePool.query(`select * from dept_locations`);
        
        return rows
    },
 }
 // delete query
export const deleteSql = {
    // data라는 객체 타입의 파라미터에 입력할 정보를 받아서 query문 생성
    deleteDepartment : async (data) => {
        console.log('deleteSql.deleteDepartment:', data.Dnumber);
        const sql = `delete from department where Dnumber=${data.Dnumber}`;
    
        await promisePool.query(sql);
     },
 }
