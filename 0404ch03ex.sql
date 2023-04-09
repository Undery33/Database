/* �������� ������ ������ ���ǻ� �� */
SELECT COUNT(publisher)
FROM book, customer, orders
WHERE book.bookid = orders.bookid 
AND customer.custid = orders.custid 
AND customer.name LIKE '������';

/* �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ���� */
SELECT bookname, price, saleprice, book.price-orders.saleprice AS GAP
FROM Book, Customer, Orders
WHERE book.bookid = orders.bookid 
AND customer.custid = orders.custid 
AND customer.name LIKE '������';

/* �������� �������� ���� ������ �̸� */
SELECT bookname
FROM book, customer, orders
WHERE book.bookid = orders.bookid   /*�� ���̵�� �ֹ��� ���̵� ���ƾ� �ϸ�*/ 
AND customer.custid = orders.custid /*���� ���̵�� �ֹ��� ���� ���̵� ����*/
AND customer.name LIKE '������';

/*�ֹ����� ���� ���� �̸�(�μ����� ���)*/
SELECT name
FROM   Customer
WHERE  name IN (SELECT name
               FROM   Customer
               WHERE  custid = 5);

/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT SUM(saleprice), AVG(saleprice)
FROM   Orders;

/*���� �̸��� ���� ���ž�*/
SELECT c.name, o.saleprice
FROM   Customer c, Orders o
WHERE  c.custid = o.custid
GROUP  BY c.name, o.saleprice;

/*���� �̸��� ���� ������ ���� ���*/
SELECT c.name, b.bookname
FROM   Book b, Customer c, Orders o
WHERE  b.bookid = o.bookid
AND    c.custid = o.custid;

/*������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
SELECT MAX(b.price - o.saleprice)
FROM   Book b, Orders o
WHERE  b.bookid = o.bookid;

/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
SELECT name
FROM   Customer
WHERE  custid IN (SELECT o1.custid
                  FROM   Orders o1, Orders o2
                  GROUP BY o1.custid
                  HAVING AVG(o1.saleprice) > AVG(o2.saleprice));

/*�������� �������� ���� ������ �̸�*/
SELECT bookname
FROM book
WHERE bookid NOT IN ( SELECT o.bookid
                      FROM customer c, orders o
                      WHERE c.custid = o.custid AND c.name = '������');