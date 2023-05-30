/*중첩질의(nested subquery) - where 절 - 비교 연산자*/
select orderid, custid, saleprice
from orders md
where saleprice > (select avg(saleprice)
                   from orders so
                   where md.custid = so. custid);

select avg(saleprice)
from orders
where custid = 1;

/*중첩질의(nested subquery)- in, not in 연산자*/
select sum(saleprice) "total"
from orders
where custid in(select custid
                from customer
                where address like '%대한민국%');

select custid
from customer
where address like '%대한민국%';

/*중첩질의(nested subquery) - all, some(any)CS 연산자*/
select 
from 
where 