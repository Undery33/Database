/*7�� Summer table*/
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

/*�����б⸦ ��� �л��� �й��� �����ϴ� ����*/
SELECT sid, class FROM Summer;

/*C ������ ������*/
SELECT price FROM Summer WHERE class='C';

/*�����ᰡ ���� ��� ����*/
SELECT DISTINCT class
FROM Summer
WHERE price=(SELECT MAX(price)
             FROM Summer);

/*�����б⸦ ��� �л� ���� ������ �Ѿ�*/
SELECT COUNT(*), SUM(price)
FROM Summer;

/*���� �̻�*/
DELETE FROM Summer WHERE sid=200;

/*C ���� ������ �ٽ� ��ȸ*/
SELECT price FROM Summer WHERE class='C';

/*�ڹ� ���� ����*/
INSERT INTO Summer VALUES (NULL, 'JAVA', 25000);

/*�� ���� �ο�*/
SELECT COUNT(*) AS "�����ο�" FROM Summer;
SELECT COUNT(sid) AS "�����ο�" FROM Summer;
SELECT COUNT(*) AS "�����ο�" FROM Summer WHERE sid IS NOT NULL;

/*FORTRAN ���� ������ ����*/
UPDATE Summer SET price=15000 WHERE class='FORTRAN';

SELECT * FROM Summer;

SELECT DISTINCT price "FORTRAN ������"
FROM Summer
WHERE class='FORTRAN';

/*���� �ǽ��� ���� ����*/
UPDATE Summer SET price=20000 WHERE class='FORTRAN';
/*���� UPDATE ���� ������ ���� �ۼ��ϸ� ������ ����ġ*/
UPDATE Summer SET price=15000 WHERE class='FORTRAN' AND sid=100;
/*Summer ���̺� ��ȸ �� FORTRAN ������ �����ᰡ �� �Ǹ� ������*/
SELECT * FROM Summer;
/*FORTRAN �����Ḧ ��ȸ �� �� ���� ����(������ ����ġ)*/
SELECT price "FORTRAN ������" FROM Summer WHERE class='FORTRAN';
/*���� �ǽ��� ���� ����*/
UPDATE Summer SET price=20000 WHERE class='FORTRAN';
/*���� �ǽ��� ���� sid�� NULL�� ���� ����*/
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

/*�����б⸦ ��� �л��� �й��� �����ϴ� ����*/
SELECT sid, class FROM SummerEnroll;

/*C ������ ������*/
SELECT price FROM SummerPrice WHERE class='C';

/*�����ᰡ ���� ��� ����*/
SELECT DISTINCT class FROM SummerPrice WHERE price=(SELECT MAX(price) FROM SummerPrice);

/*�����б⸦ ��� �л� ���� ������ �� ��*/
SELECT COUNT(*), SUM(price) FROM SummerPrice, SummerEnroll
WHERE SummerPrice.class=SummerEnroll.class;

/*�����̻� ����*/
SELECT price "C ������" FROM SummerPrice WHERE class='C';

DELETE FROM SummerEnroll WHERE sid=200;

SELECT * FROM SummerEnroll;

/*C ������ �����ᰡ �����ϴ��� Ȯ��*/
SELECT price "C ������" FROM SummerPrice WHERE class='C';

/*�����̻� ����*/
INSERT INTO SummerPrice VALUES('JAVA', 25000);

SELECT * FROM SummerPrice;

SELECT * FROM SummerEnroll;

/*�����̻� ����*/
UPDATE SummerPrice SET price=15000 WHERE class='FORTRAN';

SELECT price"FORTRAN ������" FROM SummerPrice WHERE class='FORTRAN';