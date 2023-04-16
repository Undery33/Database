/*극장 테이블*/
CREATE TABLE theater (
  t_no   NUMBER PRIMARY KEY,
  t_name VARCHAR2(40),
  t_loc  VARCHAR2(40)
);

/*상영관 테이블*/
CREATE TABLE cinema (
  t_no   NUMBER,
  c_no    NUMBER CHECK(c_no >= 1 AND c_no <= 10),
  c_movie VARCHAR2(80),
  c_price NUMBER CHECK(c_price > 0 AND c_price < 20000),
  c_seat  NUMBER,
  PRIMARY KEY(t_no, c_no)
);

/*예약 테이블*/
CREATE TABLE reserve (
  t_no   NUMBER,
  c_no   NUMBER,
  cl_no  NUMBER,
  r_sn   NUMBER, /*sn = seat NUMBER*/
  r_date date,
  PRIMARY KEY(t_no, c_no, cl_no),
  unique (cl_no, r_sn)
);

/*고객 테이블*/
CREATE TABLE client(
  cl_no NUMBER PRIMARY KEY,
  cl_name VARCHAR2(40),
  cl_address VARCHAR2(100)
);

INSERT INTO theater
VALUES (1, '롯데', '잠실');

INSERT INTO theater
VALUES (2, '메가', '강남');

INSERT INTO theater
VALUES (3, '대한', '잠실');

INSERT INTO cinema
VALUES (1, 1, '어려운 영화', 15000, 48);

INSERT INTO cinema
VALUES (3, 1, '멋진 영화', 7500, 120);

INSERT INTO cinema
VALUES (3, 2, '재밌는 영화', 8000, 110);

INSERT INTO reserve
VALUES (3, 2, 3, 15, '2020-09-01');

INSERT INTO reserve
VALUES (3, 1, 4, 16, '2020-09-01');

INSERT INTO reserve
VALUES (1, 1, 9, 48, '2020-09-01');

INSERT INTO client
VALUES (3, '홍길동', '강남');

INSERT INTO client
VALUES (4, '김철수', '잠실');

INSERT INTO client
VALUES (9, '박영희', '강남');

SELECT * FROM theater;
SELECT * FROM cinema;
SELECT * FROM reserve;
SELECT * FROM client;

/*모든 극장의 이름과 위치를 보이시오.*/
SELECT t_name, t_loc
FROM   theater;

/*'잠실'에 있는 극장을 보이시오.*/
SELECT t_name
FROM   theater
WHERE  t_loc = '잠실';

/*'잠실'에 사는 고객의 이름을 오름차순으로 보이시오.*/
SELECT cl_name
FROM   client
WHERE  cl_address = '잠실'
ORDER  BY cl_name;

/*가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.*/
SELECT t_no, c_no, c_movie
FROM   cinema
WHERE  c_price <= 8000;

/*극장 위치와 고객의 주소가 같은 고객을 보이시오.*/
SELECT c.cl_name
FROM   client c, theater t
WHERE  t.t_loc = c.cl_address;

/*극장의 수는 몇 개인가?*/
SELECT COUNT(t_name)
FROM   theater;

/*상영되는 영화의 평균 가격은 얼마인가?*/
SELECT avg(c_price)
FROM   cinema;

/*2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?*/
SELECT COUNT(cl_no)
FROM   reserve
WHERE  r_date = '2020-09-01';

/*'대한'극장에서 상영된 영화제목을 보이시오.*/
SELECT c_movie
FROM   cinema
WHERE  t_no like (
                  SELECT t_no
                  FROM   theater
                  WHERE  t_name = '대한'
                 );

/*'대한'극장에서 영화를 본 고객의 이름을 보이시오.*/
SELECT cl_name
FROM   client c, theater t, reserve r
WHERE  c.cl_no  = r.cl_no
AND    r.t_no   = t.t_no
AND    t.t_name = '대한';

/*'대한'극장의 전체 수입을 보이시오.*/
SELECT SUM(c.c_price)
FROM   cinema c, theater t, reserve r
WHERE  c.t_no = t.t_no
AND    r.c_no = c.c_no
AND    r.t_no = t.t_no
AND    t.t_name = '대한';

/*극장별 상영관 수를 보이시오.*/
SELECT COUNT(c_no)
FROM   cinema
GROUP  BY t_no;

/*'잠실'에 있는 극장의 상영관을 보이시오.*/
SELECT c.c_no
FROM   theater t, cinema c
WHERE  t.t_no  = c.t_no
AND    t.t_loc = '잠실';

/*2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.*/
SELECT COUNT(cl.cl_name)/COUNT(c.c_movie)
FROM   cinema c, client cl, reserve r
WHERE  c.t_no = r.t_no
AND    c.c_no = r.c_no
AND    r.cl_no = cl.cl_no;

/*2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.*/
SELECT c.c_movie
FROM   cinema c, reserve r
WHERE  c.t_no = r.t_no
AND    c.c_no = r.c_no
AND    r.r_date = '2020-09-01'
GROUP  BY c.c_movie;