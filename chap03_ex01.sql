/* ���� ��ȣ�� 1�� ������ �̸� */
SELECT bookname
FROM book
WHERE bookid = 1;

/* ������ 20,000�� �̻��� ������ �̸� */
SELECT bookname
FROM book
WHERE price >= 20000;

/* �������� �� ���ž� */
SELECT SUM(saleprice)
FROM orders
WHERE custid = 1;

/* �������� �� ���ž�(2)*/
SELECT SUM(saleprice)
FROM Customer, orders
WHERE Customer.custid = Orders.custid AND Customer.name LIKE '������' ;

/* �������� ������ ������ �� */
SELECT COUNT(*)
FROM customer, orders
WHERE customer.custid = orders.custid AND customer.name LIKE '������';

/* �������� ������ ������ ���ǻ� �� */
SELECT COUNT(publisher)
FROM book, customer, orders
WHERE book.bookid = orders.bookid AND customer.custid = orders.custid AND customer.name LIKE '������';

/* �������� ������ ������ �̸�, ����, ������ �Ǹ� ������ ���� */


/* �������� �������� ���� ������ �̸� */
