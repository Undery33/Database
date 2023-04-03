/* ���� ���� ������ �� �� */
SELECT count(*)
FROM book;

/* ���� ������ ������ ����ϴ� ���ǻ��� �� �� */
SELECT count(publisher)
FROM book;

/* ��� ���� �̸�, �ּ� */
SELECT name, address
FROM customer;

/* 2020�� 07/04 ~ 07/07 ���̿� �ֹ����� ������ �ֹ� ��ȣ*/
SELECT orderid
FROM orders
where orderdate BETWEEN '2020-07-04' AND '2020-07-07';

/* 2020�� 07/04 ~ 07/09 ���̿� �ֹ� ���� ������ ������ ������ �ֹ� ��ȣ*/
SELECT orderid
FROM orders
where orderdate NOT BETWEEN '2020-07-04' AND '2020-07-07';

/* ���� '��'���� ���� �̸��� �ּ�*/
SELECT name, address
FROM customer
WHERE name like '��%';

/* ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ� */
SELECT name, address
FROM customer
WHERE name like '��%��';