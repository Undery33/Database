/*��ø����(nested subquery) - where �� - �� ������*/
select orderid, custid, saleprice
from orders md
where saleprice > (select avg(saleprice)
                   from orders so
                   where md.custid = so. custid);

select avg(saleprice)
from orders
where custid = 1;

/*��ø����(nested subquery)- in, not in ������*/
select sum(saleprice) "total"
from orders
where custid in(select custid
                from customer
                where address like '%���ѹα�%');

select custid
from customer
where address like '%���ѹα�%';

/*��ø����(nested subquery) - all, some(any)CS ������*/
select 
from 
where 