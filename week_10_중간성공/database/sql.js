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
    getdept_locations : async() => {
        const [rows] = await promisePool.query(`select * from dept_locations`);
        
        return rows
    },
 }
 // delete query
export const deleteSql = {
    // data라는 객체 타입의 파라미터에 입력할 정보를 받아서 query문 생성
    deletedept_locations : async (data) => {
        console.log('deleteSql.deletedept_locations:', data.Dlocation);
        //where문을 통하여 delete문 실행 
        const sql = `delete from dept_locations where Dlocation="${data.Dlocation}"`;
    
        await promisePool.query(sql);
     },
 }
 export const updateSql = {
    updateUser : async (data) => {
        // where 조건을 만족하는 행에 대해서 salary 수정
        const sql = `update user = "${data.UserId}" where UserID = 1`;
        await promisePool.query(sql);
    },// where 조건을 만족하는 행에 대해서 Dname 수정
    // updateAirport : async (data) => {
    //     const sql = `update user = "${data.Dname}" where Dnumber =0`;
    //     await promisePool.query(sql);
    // },
}