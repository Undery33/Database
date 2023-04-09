/* 박지성이 구매한 도서의 출판사 수 */
SELECT COUNT(publisher)
FROM book, customer, orders
WHERE book.bookid = orders.bookid 
AND customer.custid = orders.custid 
AND customer.name LIKE '박지성';

/* 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이 */
SELECT bookname, price, saleprice, book.price-orders.saleprice AS GAP
FROM Book, Customer, Orders
WHERE book.bookid = orders.bookid 
AND customer.custid = orders.custid 
AND customer.name LIKE '박지성';

/* 박지성이 구매하지 않은 도서의 이름 */
SELECT bookname
FROM book, customer, orders
WHERE book.bookid = orders.bookid   /*북 아이디와 주문한 아이디가 같아야 하며*/ 
AND customer.custid = orders.custid /*고객의 아이디와 주문한 고객의 아이디가 같고*/
AND customer.name LIKE '박지성';

/*주문하지 않은 고객의 이름(부속질의 사용)*/
SELECT name
FROM   Customer
WHERE  name IN (SELECT name
               FROM   Customer
               WHERE  custid = 5);

/*주문 금액의 총액과 주문의 평균 금액*/
SELECT SUM(saleprice), AVG(saleprice)
FROM   Orders;

/*고객의 이름과 고객별 구매액*/
SELECT c.name, o.saleprice
FROM   Customer c, Orders o
WHERE  c.custid = o.custid
GROUP  BY c.name, o.saleprice;

/*고객의 이름과 고객이 구매한 도서 목록*/
SELECT c.name, b.bookname
FROM   Book b, Customer c, Orders o
WHERE  b.bookid = o.bookid
AND    c.custid = o.custid;

/*도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
SELECT MAX(b.price - o.saleprice)
FROM   Book b, Orders o
WHERE  b.bookid = o.bookid;

/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
SELECT name
FROM   Customer
WHERE  custid IN (SELECT o1.custid
                  FROM   Orders o1, Orders o2
                  GROUP BY o1.custid
                  HAVING AVG(o1.saleprice) > AVG(o2.saleprice));

/*박지성이 구매하지 않은 도서의 이름*/
SELECT bookname
FROM book
WHERE bookid NOT IN ( SELECT o.bookid
                      FROM customer c, orders o
                      WHERE c.custid = o.custid AND c.name = '박지성');