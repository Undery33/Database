/* 마당 서점 도서의 총 수 */
SELECT count(*)
FROM book;

/* 마당 서점에 도서를 출고하는 출판사의 총 수 */
SELECT count(publisher)
FROM book;

/* 모든 고객의 이름, 주소 */
SELECT name, address
FROM customer;

/* 2020년 07/04 ~ 07/07 사이에 주문받은 도서의 주문 번호*/
SELECT orderid
FROM orders
where orderdate BETWEEN '2020-07-04' AND '2020-07-07';

/* 2020년 07/04 ~ 07/09 사이에 주문 받은 도서를 제외한 도서의 주문 번호*/
SELECT orderid
FROM orders
where orderdate NOT BETWEEN '2020-07-04' AND '2020-07-07';

/* 성이 '김'씨인 고객의 이름과 주소*/
SELECT name, address
FROM customer
WHERE name like '김%';

/* 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소 */
SELECT name, address
FROM customer
WHERE name like '김%아';