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

/*주문하지 않은 고객의 이름(부속질의 사용)*/
SELECT name
FROM   Customer
WHERE  name NOT IN (SELECT name
                    FROM   Customer, orders
                    WHERE  customer.custid = orders.custid);

/*주문 금액의 총액과 주문의 평균 금액*/
SELECT SUM(saleprice), AVG(saleprice)
FROM   Orders;

/*고객의 이름과 고객별 구매액*/
SELECT name, SUM(saleprice) AS total
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY name;

/*고객의 이름과 고객이 구매한 도서 목록*/
SELECT name, book.bookname
FROM customer, orders, book
WHERE customer.custid = orders.custid
AND orders.bookid = book.bookid;

/*도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
SELECT *
FROM book, orders
WHERE book.bookid = orders.bookid AND price-saleprice = (SELECT MAX(price - saleprice)
                                                         FROM book, orders
                                                         WHERE book.bookid = orders.bookid);

/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
SELECT name, AVG(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY name
HAVING AVG(orders.saleprice) > (SELECT AVG(saleprice)
                                FROM orders);
