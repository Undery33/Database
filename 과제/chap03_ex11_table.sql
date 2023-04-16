/* 극장 테이블 */
 CREATE TABLE theater (
  t_no   NUMBER PRIMARY KEY,
  t_name VARCHAR2(40),
  t_loc  VARCHAR2(40)
);

/* 상영관 테이블 */
CREATE TABLE cinema (
  t_no    NUMBER,
  c_no    NUMBER CHECK(c_no >= 1 AND c_no <= 10),
  c_movie VARCHAR2(80),
  c_price NUMBER CHECK(c_price > 0 AND c_price < 20000),
  c_seat  NUMBER,
  PRIMARY KEY(t_no, c_no)
);

/* 예약 테이블 */
CREATE TABLE reserve (
  t_no   NUMBER,
  c_no   NUMBER,
  cl_no  NUMBER,
  r_sn   NUMBER, /*sn = seat NUMBER*/
  r_date date,
  PRIMARY KEY(t_no, c_no, cl_no),
  UNIQUE (cl_no, r_sn)
);

/* 고객 테이블 */
CREATE TABLE client(
  cl_no      NUMBER PRIMARY KEY,
  cl_name    VARCHAR2(40),
  cl_address VARCHAR2(100)
);
