\

CREATE TABLE department (
depno INTEGER NOT NULL PRIMARY KEY,
deptname VARCHAR(20),
manager VARCHAR(20)
);

CREATE TABLE employee (
empno INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(20),
phoneno INTEGER,
address VARCHAR(20),
sex VARCHAR(20),
position VARCHAR(20),
deptno INTEGER,
FOREIGN KEY (deptno) REFERENCES department(depno)
);

CREATE TABLE project (
projno INTEGER NOT NULL PRIMARY KEY,
projname VARCHAR(20),
deptno INTEGER,
FOREIGN KEY (deptno) REFERENCES department(depno)
);

CREATE TABLE works (
projno INTEGER NOT NULL,
empno INTEGER NOT NULL,
hoursworked INTEGER,
PRIMARY KEY (projno, empno),
FOREIGN KEY (projno) REFERENCES project(projno),
FOREIGN KEY (empno) REFERENCES employee(empno)
);

INSERT INTO department VALUES (1,'IT', '고남순');
INSERT INTO department VALUES (2,'Marketing', '홍길동');

INSERT INTO employee VALUES (1, '김덕성', 01012341232, '서울','여','Programmer',1);
INSERT INTO employee VALUES (2, '이서울', 01012323122, '서울','남','Programmer',1);
INSERT INTO employee VALUES (3, '박연세', 01076851231, '대전','여','Salesperson',2);
INSERT INTO employee VALUES (4, '홍길동', 01012341546, '서울','남','Manager',2);
INSERT INTO employee VALUES (5, '고남순', 01012311112, '서울','여','Manager',1);

INSERT INTO project VALUES (1,'데이터베이스',1);
INSERT INTO project VALUES (2,'시장조사',2);

INSERT INTO works VALUES (1, 1, 3);
INSERT INTO works VALUES (1, 2, 1);
INSERT INTO works VALUES (2, 3, 1);
INSERT INTO works VALUES (2, 4, 5);
INSERT INTO works VALUES (1, 5, 1);