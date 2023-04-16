/*���� ���̺�*/
CREATE TABLE theater (
  t_no   NUMBER PRIMARY KEY,
  t_name VARCHAR2(40),
  t_loc  VARCHAR2(40)
);

/*�󿵰� ���̺�*/
CREATE TABLE cinema (
  t_no   NUMBER,
  c_no    NUMBER CHECK(c_no >= 1 AND c_no <= 10),
  c_movie VARCHAR2(80),
  c_price NUMBER CHECK(c_price > 0 AND c_price < 20000),
  c_seat  NUMBER,
  PRIMARY KEY(t_no, c_no)
);

/*���� ���̺�*/
CREATE TABLE reserve (
  t_no   NUMBER,
  c_no   NUMBER,
  cl_no  NUMBER,
  r_sn   NUMBER, /*sn = seat NUMBER*/
  r_date date,
  PRIMARY KEY(t_no, c_no, cl_no),
  unique (cl_no, r_sn)
);

/*�� ���̺�*/
CREATE TABLE client(
  cl_no NUMBER PRIMARY KEY,
  cl_name VARCHAR2(40),
  cl_address VARCHAR2(100)
);

INSERT INTO theater
VALUES (1, '�Ե�', '���');

INSERT INTO theater
VALUES (2, '�ް�', '����');

INSERT INTO theater
VALUES (3, '����', '���');

INSERT INTO cinema
VALUES (1, 1, '����� ��ȭ', 15000, 48);

INSERT INTO cinema
VALUES (3, 1, '���� ��ȭ', 7500, 120);

INSERT INTO cinema
VALUES (3, 2, '��մ� ��ȭ', 8000, 110);

INSERT INTO reserve
VALUES (3, 2, 3, 15, '2020-09-01');

INSERT INTO reserve
VALUES (3, 1, 4, 16, '2020-09-01');

INSERT INTO reserve
VALUES (1, 1, 9, 48, '2020-09-01');

INSERT INTO client
VALUES (3, 'ȫ�浿', '����');

INSERT INTO client
VALUES (4, '��ö��', '���');

INSERT INTO client
VALUES (9, '�ڿ���', '����');

SELECT * FROM theater;
SELECT * FROM cinema;
SELECT * FROM reserve;
SELECT * FROM client;

/*��� ������ �̸��� ��ġ�� ���̽ÿ�.*/
SELECT t_name, t_loc
FROM   theater;

/*'���'�� �ִ� ������ ���̽ÿ�.*/
SELECT t_name
FROM   theater
WHERE  t_loc = '���';

/*'���'�� ��� ���� �̸��� ������������ ���̽ÿ�.*/
SELECT cl_name
FROM   client
WHERE  cl_address = '���'
ORDER  BY cl_name;

/*������ 8,000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.*/
SELECT t_no, c_no, c_movie
FROM   cinema
WHERE  c_price <= 8000;

/*���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�.*/
SELECT c.cl_name
FROM   client c, theater t
WHERE  t.t_loc = c.cl_address;

/*������ ���� �� ���ΰ�?*/
SELECT COUNT(t_name)
FROM   theater;

/*�󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?*/
SELECT avg(c_price)
FROM   cinema;

/*2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?*/
SELECT COUNT(cl_no)
FROM   reserve
WHERE  r_date = '2020-09-01';

/*'����'���忡�� �󿵵� ��ȭ������ ���̽ÿ�.*/
SELECT c_movie
FROM   cinema
WHERE  t_no like (
                  SELECT t_no
                  FROM   theater
                  WHERE  t_name = '����'
                 );

/*'����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.*/
SELECT cl_name
FROM   client c, theater t, reserve r
WHERE  c.cl_no  = r.cl_no
AND    r.t_no   = t.t_no
AND    t.t_name = '����';

/*'����'������ ��ü ������ ���̽ÿ�.*/
SELECT SUM(c.c_price)
FROM   cinema c, theater t, reserve r
WHERE  c.t_no = t.t_no
AND    r.c_no = c.c_no
AND    r.t_no = t.t_no
AND    t.t_name = '����';

/*���庰 �󿵰� ���� ���̽ÿ�.*/
SELECT COUNT(c_no)
FROM   cinema
GROUP  BY t_no;

/*'���'�� �ִ� ������ �󿵰��� ���̽ÿ�.*/
SELECT c.c_no
FROM   theater t, cinema c
WHERE  t.t_no  = c.t_no
AND    t.t_loc = '���';

/*2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�.*/
SELECT COUNT(cl.cl_name)/COUNT(c.c_movie)
FROM   cinema c, client cl, reserve r
WHERE  c.t_no = r.t_no
AND    c.c_no = r.c_no
AND    r.cl_no = cl.cl_no;

/*2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.*/
SELECT c.c_movie
FROM   cinema c, reserve r
WHERE  c.t_no = r.t_no
AND    c.c_no = r.c_no
AND    r.r_date = '2020-09-01'
GROUP  BY c.c_movie;