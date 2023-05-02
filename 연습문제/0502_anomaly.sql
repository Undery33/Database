/*7장 Summer table*/
DROP TABLE Summer;

CREATE TABLE Summer(
    sid NUMBER,
    class VARCHAR2(20),
    price NUMBER
);

INSERT INTO Summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
INSERT INTO Summer VALUES (250, 'FORTRAN', 20000);

SELECT * FROM Summer;

/*계절학기를 듣는 학생의 학번과 수강하는 과목*/
SELECT sid, class FROM Summer;

/*C 강좌의 수걍료*/
SELECT price FROM Summer WHERE class='C';

/*수강료가 가장 비싼 과목*/
SELECT DISTINCT class
FROM Summer
WHERE price=(SELECT MAX(price)
             FROM Summer);

/*계절학기를 듣는 학생 수와 수강료 총액*/
SELECT COUNT(*), SUM(price)
FROM Summer;

/*삭제 이상*/
DELETE FROM Summer WHERE sid=200;

/*C 강좌 수강료 다시 조회*/
SELECT price FROM Summer WHERE class='C';

/*자바 강좌 삽입*/
INSERT INTO Summer VALUES (NULL, 'JAVA', 25000);

/*총 수강 인원*/
SELECT COUNT(*) AS "수강인원" FROM Summer;
SELECT COUNT(sid) AS "수강인원" FROM Summer;
SELECT COUNT(*) AS "수강인원" FROM Summer WHERE sid IS NOT NULL;

/*FORTRAN 강좌 수강료 수정*/
UPDATE Summer SET price=15000 WHERE class='FORTRAN';

SELECT * FROM Summer;

SELECT DISTINCT price "FORTRAN 수강료"
FROM Summer
WHERE class='FORTRAN';

/*다음 실습을 위해 복구*/
UPDATE Summer SET price=20000 WHERE class='FORTRAN';
/*만약 UPDATE 문을 다음과 같이 작성하면 데이터 불일치*/
UPDATE Summer SET price=15000 WHERE class='FORTRAN' AND sid=100;
/*Summer 테이블 조회 시 FORTRAN 강좌의 수강료가 한 건만 수정됨*/
SELECT * FROM Summer;
/*FORTRAN 수강료를 조회 시 두 건이 나옴(데이터 불일치)*/
SELECT price "FORTRAN 수강료" FROM Summer WHERE class='FORTRAN';
/*다음 실습을 위해 복구*/
UPDATE Summer SET price=20000 WHERE class='FORTRAN';
/*다음 실습을 위해 sid가 NULL인 투플 삭제*/
DELETE FROM Summer WHERE sid IS NULL;

DROP TABLE SummerPrice;
DROP TABLE SummerEnroll;

CREATE TABLE SummerPrice(
    class VARCHAR2(20),
    price INTEGER
);

INSERT INTO SummerPrice VALUES('FORTRAN', 20000);
INSERT INTO SummerPrice VALUES('PASCAL', 15000);
INSERT INTO SummerPrice VALUES('C', 10000);

SELECT * FROM SummerPrice;

CREATE TABLE SummerEnroll(
    sid INTEGER,
    class VARCHAR2(20)
);

INSERT INTO SummerEnroll VALUES (100, 'FORTRAN');
INSERT INTO SummerEnroll VALUES (150, 'PASCAL');
INSERT INTO SummerEnroll VALUES (200, 'C');
INSERT INTO SummerEnroll VALUES (250, 'FORTRAN');

SELECT * FROM SummerEnroll;

/*계절학기를 듣는 학생의 학번과 수강하는 과목*/
SELECT sid, class FROM SummerEnroll;

/*C 강좌의 수강료*/
SELECT price FROM SummerPrice WHERE class='C';

/*수강료가 가장 비싼 과목*/
SELECT DISTINCT class FROM SummerPrice WHERE price=(SELECT MAX(price) FROM SummerPrice);

/*계절학기를 듣는 학생 수와 수강료 총 액*/
SELECT COUNT(*), SUM(price) FROM SummerPrice, SummerEnroll
WHERE SummerPrice.class=SummerEnroll.class;

/*삭제이상 없음*/
SELECT price "C 수강료" FROM SummerPrice WHERE class='C';

DELETE FROM SummerEnroll WHERE sid=200;

SELECT * FROM SummerEnroll;

/*C 강좌의 수강료가 존재하는지 확인*/
SELECT price "C 수강료" FROM SummerPrice WHERE class='C';

/*삽입이상 없음*/
INSERT INTO SummerPrice VALUES('JAVA', 25000);

SELECT * FROM SummerPrice;

SELECT * FROM SummerEnroll;

/*수정이상 없음*/
UPDATE SummerPrice SET price=15000 WHERE class='FORTRAN';

SELECT price"FORTRAN 수강료" FROM SummerPrice WHERE class='FORTRAN';