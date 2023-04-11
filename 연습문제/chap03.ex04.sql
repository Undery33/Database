select * from book;

/*���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���. 
    ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ�.*/

/*'�Ｚ��'���� ������ ������ �����Ͻÿ�.*/
delete from book
where publisher = '�Ｚ��';

/*'�̻�̵��'���� ������ ������ �����Ͻÿ�. ������ �� �Ǹ� ������ ������ ���ÿ�.*/
/*�ڽ��� �־ ������ �ȵȴ�.*/

/* ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲٽÿ�. */
update book
set publisher = '�������ǻ�'
where publisher = '���ѹ̵��';

/* (���̺� ����) ���ǻ翡 ���� ������ �����ϴ� ���̺��� �����ϰ��� �Ѵ�. 
    name �� �⺻ Ű�̸� varchar2(20), address�� varchar(20), begin�� date Ÿ������
    �����Ͽ� �����Ͻÿ�.*/
create table Bookcompany(
name varchar(20) primary key,
address varchar(20),
begin date
);

/* (���̺� ����) bookcompany ���̺� ���ͳ� �ּҸ� �����ϴ� webaddress �Ӽ���
    varchar(30)���� �߰��Ͻÿ�. */
alter table bookcompany add webaddress varchar2(30);

/* Bookcompany ���̺� ���Ƿ� ���� name=�Ѻ���ī����, address=����� ������, 
begin=1993-01-01, webaddress=http://hanbit.co.kr�� �����Ͻÿ�.*/
insert into bookcompany
values('�Ѻ���ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr/');
