/*2023-05-30�Լ� ����*/
/*���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��ϱ�*/
select custid "����ȣ", round(sum(saleprice)/count(*), -2)"��ձݾ�"
from orders
group by custid;

/*��¥�� ���� ���� ���*/
select TO_DATE('2020-07-01', 'yyyy-mm-dd')+5 before,
to_date('2020-07-01','yyyy-mm-dd')-5 after
from dual;

/*�ֹ��Ϸκ��� 10�� �� ���� Ȯ��*/
select orderid "�ֹ���ȣ",orderdate "�ֹ���", orderdate+10 "Ȯ��"
from Orders;

/*dbms ������ ������ ���� ��¥�� �ð�, ���� Ȯ��*/
select sysdate,
TO_Char(sysdate, 'yyyy/mm/dd hh24:mi:ss')"sysdate_1"
from dual;

/*���缭�� �� �� ���� ���� ���� ����� �� ������ ���� �ο��� ���ϱ�*/
select substr(name,1,1)"��",count(*)"�ο�"
from customer
group by substr(name,1,1);

/*null���� �ٸ� ������ ��ġ�ϴ� nvl�Լ�*/
select name "�̸�",nvl(phone,'����ó ����')"��ȭ��ȣ"
from customer;

/*sql ��ȸ ����� �������� ��Ÿ���� rownum*/
select rownum"����",custid,name,phone 
from customer
where rownum <= 2;

/*���� 3��*/
/*(1)*/
select * from book;
/*(2)*/
select * from book where ROWNUM <= 5;
/*(3)*/
select * from book where rownum <= 5 order by price;
/*(4)*/
select * from (select * from book order by price) b
where rownum <= 5;
/*(5)*/
select * from (select * from book where rownum <= 5) b
order by price;
/*(6)*/
select *
from (select * from book where rownum <= 5 order by price) b;
