# 2021-02 database

## 3주차 실습 실행 방법
1. 레포지토리 복사(wsl 환경에서 명령어 입력)
    - (SSH 설정한 경우) git clone git@github.com:jae2yong/2021-02-database.git
    -(token을 사용하는 경우) git clone https://github.com/jae2yong/2021-02-database.git
2. week_3 폴더로 이동
    >cd week_3

3. 콘솔창(powershell)에서 npm package 설치
    >npm install

4. database/sql.js에서 본인의 데이터베이스 정보 입력(주석 부분)

<pre>
<code>
const pool = mysql.createPool(
    process.env.JAWSDB_URL ??{
        host: 'localhost'
        user: 'root', //본인의 mysql user id
        database: 'tutorial', //본인의 만든 데이터베이스 이름
        password: 'password', //본인의 mysql password
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0
    }
);
</code>
</pre>
<br>

## <span style="color:red"> 테이블 작성법</span>

 이름|과|전공|학번 ---|---|---|---|
 김영희|정보통신공학과|정보통신|12201111|
 홍길동|컴퓨터공학과|데이터베이스|12191111|
 이순신|인공지능공학과|인공지능|12181111|
 
## 텍스트 강조
_ **데이터베이스** 실습은 재미 ~~없어요~~있어요.

## 3주차 DB 테이블 내용
### 3주차 DB 테이블은 STUDENT, USERS 로 구성되어있다.
#### STUDENT 테이블 Field는 Name, STudentNUmber, Class, Major로 구성되어 있다.

<pre>
<code>
Name field의 Type은 varchar(30)이며 null 포함하지 않고 default로 NULL값을 가진다.
STudentNUmber field의 int형이며 null 포함하지 않고 default로 NULL값을 가지고 Primary key를 가진다.
Class field의 Type은 char(1)이며 null 포함하지 않고 default로 NULL값을 가진다.
Major field의 Type은 char(4)이며 null 포함하며 default로 NULL값을 가진다.
</code>
</pre>
#### USERS 테이블 Field는 userID, userPassword 로 구성되어 있다.
<pre>
<code>
userID field의 Type은 int이며 null 포함하지 않고 default로 NULL값을 가진다.
userPassword filed의 int형이며 null 포함하지 않고 default로 NULL값을 가진다.
</code>
</pre>

## 8주차 DB 테이블 내용
###8주차 DB 테이블은 DEPARTMENT, EMPLOYEE 로 구성되어있다.
#### DEPARTMENT 테이블의 Field는 Dname, Dnumber, Mgr_ssn, Mgr_start_date로 구성되어 있다.
<pre>
<code>
Dname field의 Type은 varchar(15)이며 null 포함하지 않고 default로 NULL값을 가지며 Unique Key를 가진다.
Dnumber field의 int 형이며 null 포함하지 않고 default로 NULL값을 가지고 Primary key를 가진다.
Mgr_ssn field의 Type은 char(9)이며 null 포함하지 않고 default로 NULL값을 가지며 Multiple Occurences Column key를 가진다.
Mgr_start_date 의 Type은 date 이며 null 포함하며 default로 NULL값을 가진다.
</code>
</pre>
#### USERS 테이블 Field는 Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno로 구성되어 있다.
<pre>
<code>
Fname field의 Type은 varchar(10)이며 null 포함하지 않고 default로 NULL값을 가진다.
Minit field의 Type은 char(1) 형이며 null 포함하며 default로 NULL값을 가진다.
Lname field의 Type은 varchar(20)이며 null 포함하지 않고 default로 NULL값을 가지며 Primary key를 가진다.
Ssn field의 Type은 char(9) 이며 null 포함하지 않고 default로 NULL값을 가진다.
Bdate field의 Type은 date 이며 null 포함하며 default로 NULL값을 가진다.
Address field의 Type은 varchar(30) 이며 null 포함하며 default로 NULL값을 가진다.
Sex field의 Type은 char(1) 이며 null 포함하며 default로 NULL값을 가진다.
Salary field의 Type은 decimal(5,0)이며 null 포함하며 default로 NULL값을 가진다.
Super_ssn field의 Type은 char(9) 이며 null 포함하며 default로 NULL값을 가진다.
Dno field의 Type은 int 이며 null 포함하지 않고 default로 NULL값을 가진다.
</code>
</pre>
