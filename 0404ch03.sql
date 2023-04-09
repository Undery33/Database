/* ���� 3-23 */
SELECT name, saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

/* ���� 3-27 */
SELECT name, saleprice
FROM customer LEFT OUTER JOIN orders
ON customer.custid=orders.custid;

/* (+)�� �̿��� ���� �ܺ� ���� */
SELECT customer.name, saleprice
FROM customer, orders
WHERE customer.custid = orders.custid(+);

/* ���� 3-28 */
SELECT bookname
FROM book
WHERE price=(SELECT MAX(price) FROM book);

/* ���� 3-29 */
SELECT name
FROM customer
WHERE custid IN(SELECT custid
                FROM orders);
                
/* ���� 3-31 */
SELECT b1.bookname
FROM book b1
WHERE b1.price>(select avg(b2.price)
                from book b2
                WHERE b2.publisher=b1.publisher);