show user;

show serveroutput
set serveroutput on

declare
  x number;
begin
  x := 100;
  dbms_output.put('�� = ');
  dbms_output.put_line(x);
end;

-------------------------

declare
  x number;
  y number;
  z number;
begin
  x := 100;
  y := 30;
  z := x + y;
  dbms_output.put_line('���� ' || z || '�Դϴ�.');
end;


--username = �迬��
--address = ����
--�̸�:�迬��
--�ּ�:����

declare
  username varchar2(10) := '�迬��';
  address varchar2(10) := '����';

begin
--  username := '�迬��';
--  address := '����';
  dbms_output.put_line('�̸�:' || username);
  dbms_output.put_line('�ּ�:' || address);
end;

declare
begin
  DBMS_OUTPUT.PUT_LINE('3*1=' || 3*1);
  DBMS_OUTPUT.PUT_LINE('3*2=' || 3*2);
  DBMS_OUTPUT.PUT_LINE('3*3=' || 3*3);
  DBMS_OUTPUT.PUT_LINE('3*4=' || 3*4);
  DBMS_OUTPUT.PUT_LINE('3*5=' || 3*5);
  DBMS_OUTPUT.PUT_LINE('3*6=' || 3*6);
  DBMS_OUTPUT.PUT_LINE('3*7=' || 3*7);
  DBMS_OUTPUT.PUT_LINE('3*8=' || 3*8);
  DBMS_OUTPUT.PUT_LINE('3*9=' || (3*9));
  DBMS_OUTPUT.PUT_LINE('��:' || (1+2) );
  DBMS_OUTPUT.PUT_LINE('����:' || (1-2) );
  DBMS_OUTPUT.PUT_LINE('������:' || 13/5 );
  DBMS_OUTPUT.PUT_LINE('������:' || mod(13,5) );
end;
/

drop table departments;
create table departments(
  department_id number primary key,
  department_name varchar2(10)
);

insert into departments values(10,'������');
insert into departments values(20,'ȫ����');
select * from departments;

drop table emp;
create table emp(
  empno number primary key,
  deptno number,
  ename varchar2(10),
  sal number
);
insert into emp values(8000,10,'������',330);
insert into emp values(8001,30,'�ں���',220);

select * from emp;
commit;

select ename,sal from emp
where empno=8000;

--select ~ into
declare
  vename varchar2(10);
  vsal number;
begin
  select ename,sal
  into vename, vsal
  from emp
  where empno=8000;
  
  dbms_output.put_line(vename ||'�� �޿��� '|| vsal || '�Դϴ�.');

end;


--departments ���̺��� �μ���ȣ 10���� ���ڵ� ��������
--10���� ������ �Դϴ�.
declare
 vdepartment_id number;
 vdepartment_name varchar2(10);

begin
 select department_id, department_name
 into vdepartment_id, vdepartment_name
 from departments
 where department_id=10;
 dbms_output.put_line(vdepartment_id||'���� '|| vdepartment_name || ' �Դϴ�.');

end;



select empno,ename,em.deptno,department_name
from departments de, emp em
where de.department_id = em.deptno;

select empno, ename, deptno, department_name
from emp inner join departments
on deptno = department_id;

declare
vempno EMP.EMPNO%type;
vename EMP.ENAME%type;
vdeptno EMP.DEPTNO%type;
vdepartment_name DEPARTMENTS.DEPARTMENT_NAME%type;

begin
  select empno, ename, deptno, department_name
  into vempno, vename, vdeptno, vdepartment_name
  from emp inner join departments
  on deptno = department_id;  
  dbms_output.put_line(vempno||','||vename||','||vdeptno||','||vdepartment_name);
end;
--8000,������,10,������





select * from members;
select max(salary) from members;
--�ְ�޿��� 4000�Դϴ�.

declare
  vmax MEMBERS.SALARY%TYPE;  
begin
  select max(salary) 
  into vmax
  from members;
  dbms_output.put_line('�ְ�޿��� '|| vmax || '�Դϴ�.');
end;

--�μ��� �޿� ���
--���ߺ� 123.456
--ȫ���� 1703.3333
--������ 435.234

select did, avg(salary) 
from members 
group by did;

--�޿� ����� 1000�̻��� ���ڵ� ��ȸ
--ȫ���� 1703.3333

select did, avg(salary) 
from members 
group by did
having avg(salary) >= 1000;

declare
vdid MEMBERS.DID%type;
vavg MEMBERS.SALARY%TYPE;
begin
  select did, avg(salary) 
  into vdid, vavg
  from members 
  group by did
  having avg(salary) >= 1000;
  
  dbms_output.put_line(vdid || '�� ��� �޿��� ' || vavg || '�Դϴ�.');
end;

-- empno number primary key,
--  deptno number,
--  ename varchar2(10),
--  sal number
--insert into emp 
--values(8003,20,'����',100);

--ġȯ���� : �ܺο��� �Է��� �ϵ��� �䱸�� �� ����ϴ� ����
--���� : &ġȯ������
declare
  vno number := '&no';
  vdeptno number := '&deptno';
  vname varchar2(10) := '&name';
  vsal number := '&sal';

begin
  insert into emp 
  values(vno,vdeptno,vname,vsal);
  
  dbms_output.put_line(vno ||','|| vdeptno||','|| vname||','|| vsal);
end;

select * from emp;

--empno��ȣ �ϳ� �Է� : 8003
declare
  vno number := '&no';
begin
  delete from emp where empno=vno;
end;

select * from emp;

--�̸� �Է�
--sal �Է�
--�Է��� �̸��� sal�� ����

declare
vname EMP.ENAME%type := '&�����ȣ';
vsal EMP.SAL%type := '&vsal';
begin
update emp set sal=vsal where Ename=vname;
end;

select * from emp;
commit;

-- 
declare
  vmax number;
begin
  select max(empno) 
  into vmax
  from emp;
--  dbms_output.put_line(vmax);
  
  insert into emp
  values(vmax+1,20,'���',333);
end;

select * from emp;

----------------------- if �� -----------------------------
declare
  x number := 2;
  result varchar2(20);
begin
   if x = 1 then
    result := 'one';
  elsif x = 2 then
    result := 'two';
  elsif x = 3 then
    result := 'three';
  else
    result := '�� ���� ��';
  end if;
  
  dbms_output.put_line(result);
end;

select * from emp;
--dname(�μ���) Į�� �߰�
alter table emp add(dname varchar2(10));

--10:�ѹ���
--20:�λ��
--�� ���� ��ȣ : ȫ����

--�μ���ȣ �Է�:20 40
declare
  vno number := '&�μ���ȣ';
  vdname varchar2(10);
begin
  if vno = 10 then
    vdname := '�ѹ���';
  elsif vno = 20 then
    vdname := '�λ��';
  else 
    vdname := 'ȫ����';
  end if;
  dbms_output.put_line(vdname);
  update emp set dname = vdname where deptno = vno;
end;
select * from emp;

select * from members;

--��ȣ �Է��ؼ� �Է��� ��ȣ�� salary�� ��������
--salary>=500 tax:salary �� 10%
--300<=salary<500 tax:salary �� 5%
--salary<300 tax:salary �� 3%
--1�� �Է� : salary:100 tax:3
--9�� �Է� : salary:4000 tax:400

declare
  vno members.no%type := '&no';
  vsalary MEMBERS.SALARY%TYPE;
  vname MEMBERS.NAME%type;
  tax number;
begin
  select name, salary
  into vname, vsalary
  from members
  where no = vno;
    
  if vsalary >= 500 then 
    tax :=  vsalary* 0.1; 
  elsif vsalary>=300 and vsalary<500 then
    tax :=  vsalary* 0.05; 
  else
    tax :=  vsalary* 0.01; 
  end if;
   
  dbms_output.put_line(vname || ',' || vsalary || ',' || tax);
end;


--case~end
declare
  vno number := '&no'; 
  vdname varchar2(20);
begin
  vdname :=
    case(vno)
      when 10 then '�ѹ���'
      when 20 then '�λ��'
      when 30 then '������'
      else '�߸��Է���'
    end; -- case�� ��
  dbms_output.put_line(vdname);
end;



declare
  vno number := '&no'; 
  vdname varchar2(20);
begin
    case(vno)
      when 10 then vdname := '�ѹ���2';
      when 20 then vdname := '�λ��2';
      when 30 then vdname := '������2';
      else vdname := '�߸��Է���2';
    end case; -- case�� �� 
  dbms_output.put_line(vdname);
end;

--12.16 ����
--1.
select * from book;
--��ȣ �Է�: 3
--�Ⱓ���� 80����̸� ���� 20% ���� ����(1000->800)
--�Ⱓ���� 90����̸� ���� 10% ���� ����(1000->900)
--�� ���� ��� ���� 5% ���� ����(1000->950)
--select * from book;���� Ȯ��

declare 
  vinput book.no%type := '&no';
  vday book.day%type;
  vprice book.price%type;
  vimsi number;
begin
  select day,price
  into vday, vprice
  from book
  where no = vinput;
  
  if vday>='80-1-1' and vday<='89-12-31' then
    vimsi := vprice * 0.8;
  elsif vday between '90-1-1' and '99-12-31' then
    vimsi := vprice * 0.9;
  else
    vimsi := vprice * 0.95;
  end if;
  
  update book set price = vimsi where no = vinput;
  
end;
commit;

---
select * from book;


declare 
  vinput book.no%type := '&no';
  vday book.day%type;
  vprice book.price%type;
  vimsi number;
begin
  select day,price
  into vday, vprice
  from book
  where no = vinput;
  
  case 
    when vday>='80-1-1' and vday<='89-12-31' then vimsi := vprice*0.8;
    when vday>='90-1-1' and vday<='99-12-31' then vimsi := vprice*0.9;
    else vimsi := vprice*0.95;
  end case;
  update book set price = vimsi where no = vinput;
  
end;





--2.
--hobby Į�� ����
select * from company;
--�ְ�޿�(salary)�� ���ڵ� ��ü �����ͼ� ���

select max(salary)
from company; -- 9000

select * 
from company
where salary = (select max(salary)from company);

declare
  vSABUN company.sabun%type;
  vNAME company.NAME%type;
  vIBSAIL company.iBSAIL%type;
  vPOSITIon company.pOSITIon%type;
  vSALARY company.SALARY%type;
  vGENDER company.GENDER%type;
  vHobby company.Hobby%type;
  vANNUAL_SALARY company.ANNUAL_SALARY%type;
begin

  select *
  into vsabun,vname,vibsail, vposition, vsalary, vgender,vhobby, vannual_salary
  from company
  where salary = (select max(salary) from company);
  
  dbms_output.put_line(vsabun ||','|| vname||','||vibsail||','|| vposition||','|| vsalary||','|| vgender||','||vhobby||','|| vannual_salary);
end;


declare
  vcom company%rowtype;
begin

  select *
  into vcom.sabun,vcom.name, vcom.ibsail, vcom.position, vcom.salary, vcom.gender,vcom.hobby, vcom.annual_salary
  from company
  where salary = (select max(salary) from company);
  
  dbms_output.put_line(vcom.sabun ||','|| vcom.name||','||vcom.ibsail||','|| vcom.position||','|| vcom.salary||','|| vcom.gender||','||vcom.hobby||','|| vcom.annual_salary);
end;




------------------- �ݺ��� -------------------------

declare
  i number;
begin
  i := 1;
  loop
    dbms_output.put_line('i:' || i);
    exit when i>=10;
    i := i+1;
  end loop;  
  dbms_output.put_line('loop ��������');
end;

--1~10 �հ豸�ϱ�

declare
  i number := 1;
  vsum number := 0;
begin
  loop
    dbms_output.put_line('i:' || i);
    vsum := vsum + i; -- 1 3 6
    exit when i>=10;
    i := i+1; -- 2 3 4
  end loop;
  dbms_output.put_line('vsum:' || vsum);
end;

--------------------------
--for(i=1;i<=10;i++){
--
--}
declare
  i number;
  vsum number := 0;
begin
  for i in 1..10 loop
    vsum := vsum + i;
  end loop;
  dbms_output.put_line('vsum:' || vsum);
end;

--1~100������ �� 5�� ����̸鼭 7�� ����� �� : 35, 70
declare
  i number;
begin
  for i in 1..100 loop
    if mod(i,5)=0 and mod(i,7)=0 then
      dbms_output.put_line(i);
    end if;
  end loop;  
end;

--3�� ���
--loop, for~loop
--19��

declare
  i number := 1;
begin
  loop
   dbms_output.put_line('3 * ' || i || '=' || 3*i);
   i := i+1; 
   exit when i = 10;
  end loop;
  dbms_output.put_line('��');
end;

declare
-- i number :=1;
begin
  for i in reverse 1..9 loop
    dbms_output.put_line('3 * ' || i || '=' || 3*i);
  end loop;
  
  dbms_output.put_line('��');
end;


declare
  i number := 1;
begin
  while i <= 9 loop
    dbms_output.put_line('3 * ' || i || '=' || 3*i);
    i:= i+1;  
  end loop;
  dbms_output.put_line('��');          
end;

--loop~
--for loop~
--while loop~

declare
  i number;
  j number;
begin
  for i in 1..3 loop
    for j in 5..7 loop
      dbms_output.put_line(i ||',' || j);
    end loop;
  end loop;
end;


--***2 �� ***
--2 * 1 = 2
--2 * 2 = 4
--2 * 3 = 6
--2 * 4 = 8
--2 * 5 = 10
--2 * 6 = 12
--2 * 7 = 14
--2 * 8 = 16
--2 * 9 = 18
-------------
--***3 �� ***
--3 * 1 = 3
--3 * 2 = 6
--3 * 3 = 9
--3 * 4 = 12
--3 * 5 = 15
--3 * 6 = 18
--3 * 7 = 21
--3 * 8 = 24
--3 * 9 = 27
-----------

declare

begin
  for i in 2..9 loop
  dbms_output.put_line('*** '|| i || '�� ***');
    for j in 1..9 loop
     dbms_output.put_line(i || '*' || j || '=' || i*j);
    end loop;
  dbms_output.put_line('-------------');
  end loop;
end;

--------------------------------------------------------------
select * from emp;

select empno,ename from emp
where empno=8005;

declare
  vempno emp.empno%type;
  vename emp.ename%type;
begin
  for i in (select empno, ename from emp) loop
    dbms_output.put_line(i.empno || ', ' ||i.ename);
  end loop;
end;

--�μ���ȣ 30�� ���ڵ��� empno,deptno,ename,sal ��������


begin
  for i in (select * from emp where deptno=30) loop
    dbms_output.put_line(i.empno ||','|| i.deptno||','|| i.ename||','|| i.sal );
  end loop;
end;


select * from emp;
--���� ū empno�� �����ͼ� +1
--insert (8008,10,����,100)
declare
  vmax emp.empno%type;
begin
  select max(empno)
  into vmax -- 8007
  from emp;
  
  for i in 1..3 loop
    vmax := vmax + 1;
    insert into emp(empno,deptno,ename,sal) values(vmax,10,'����',100);
  end loop;
end;

-------------------------- �Լ� ----------------------------------
drop table test;
drop function test;

create or replace function test -- ���� 
return number as -- is
--declare
  x number;
  y number;
begin
  x := 100;
  y := 200;
  dbms_output.put_line(x+y);
  return x+y;
end;

select test() from dual;

select * from emp;
select count(*) from emp;
--test2 : emp table�� ���ڵ� ���� �����ϴ� �Լ�

create or replace function test2
return number as
  vcount number;
begin
  select count(*)
  into vcount
  from emp;
  return vcount;
end;

select test2 from dual;



create or replace function test3(a number,b number) -- ���� 
return number as -- is
--declare
  x number;
  y number;
begin
  x := a;
  y := b;
  dbms_output.put_line(x+y);
  return x+y;
end;

select test3(111,222) from dual;



create or replace function tax(x number)
return number as
begin
return x*0.05;
end;

select tax(1000) from dual;

select no,name,salary, tax(salary) from members;

select * from emp;
--

create or replace function deptname(x number)
return varchar2 as
  deptname varchar2(9);
begin
--  case(x)
--  when 10 then deptname :='�λ��';
--  when 20 then deptname :='�ѹ���';
--  when 30 then deptname :='������';
--  end case;
--  return deptname;
  if x = 10 then
    deptname :='�λ��'; -- return '�λ��';
  elsif x = 20 then
    deptname :='�ѹ���';
  else 
    deptname :='������';
  end if;
  
  return deptname;
  
end;
select deptname(10) from dual;
select empno,deptno,deptname(deptno),ename from emp;

---------------------- ���ν��� --------------------------------
select * from members;
create or replace procedure raise_salary(id members.no%type)
is

begin
  update members set salary = salary*1.1 where no = id;
end ;

execute raise_salary(3); -- ȣ�� 
execute raise_salary(7);

select * from company;
--1.�Ի��Ϸ� ���� 10���� ���������� ������ ���
--�븮-����-����-�̻�-����


--2.�Ի��� 5�� �̻� 5% �λ� ,10�� �̻� 10%�λ�, 15�� 15%�λ� update 
create or replace procedure upsal(id company.sabun%type)
as
ib company.ibsail%type;
y number;
up number;
begin
select ibsail
into ib
from company where sabun=id;
y:= to_char(sysdate, 'yyyy')-to_char(ib,'yyyy');
if y<5 then up:=1;
elsif y>=5 and y<10 then up:=1.05;
elsif y>=10 and y<15 then up:=1.1;
else up:=1.15;
end if;
update company set salary = salary*up where sabun=id;

end;

execute upsal(6);
rollback;
update company set salary=1000 where sabun=1;
update company set salary=9000 where sabun=2;
update company set salary=3000 where sabun=3;
update company set salary=4000 where sabun=4;
update company set salary=8000 where sabun=5;
update company set salary=2000 where sabun=6;

commit;
------------------------------------------
select * from company;

create or replace procedure salary_update
as
--���� ����
begin
  for i in (select sabun, to_char(sysdate,'yyyy')-to_char(ibsail,'yyyy') as period from company)  loop
    if i.period >=15 then 
      update company set salary = salary + salary*0.15 where sabun = i.sabun;
    elsif i.period >=10 then
      update company set salary = salary + salary*0.1 where sabun = i.sabun;
    else
      update company set salary = salary + salary*0.05  where sabun = i.sabun;
    end if;
  end loop;
end;

execute salary_update();

rollback;

select * from members;

---------------------------------------------------------------------
select * from members;

select did,addr,gender,count(*)
from members
where did='������' and addr='����' and gender='����'
group by did,addr,gender;

declare
vdid varchar2(10);
vaddr members.addr%type ;
vgender members.gender%type ;
vcount number;
begin
  select did,addr,gender,count(*)
  into vdid,vaddr, vgender,vcount
from members
where did='������' and addr='����' and gender='����'
group by did,addr,gender;
dbms_output.put_line(vdid||','||vaddr||','|| vgender||','||vcount);
end;

select * from members;
--1,����ī,90/12/25

declare

begin
  for i in (select * from members where birth>='90-1-1' and birth<='99-12-31') loop
    dbms_output.put_line(i.no ||','|| i.name ||','|| i.birth);
  end loop;
  
end;

select * from book;
--no�� �Է¹ް�, no�� �ش��ϴ� ���ڵ��� 
--�Ⱓ���� 80����̸� ���� 20%���� ���� (1000->800)
--�Ⱓ���� 90����̸� ���� 10%���� ���� (1000->900)
--�� ���� ����̸� 5%���� ���� (1000->950)
-- 3�� �Է� : '82/01/24' 3000=>2400

declare
  vinput number := '&no';
  vday book.day%type;
  vprice book.price%type; 
  vimsi number;
begin
  select day,price
  into vday, vprice
  from book
  where no = vinput;
  
--  dbms_output.put_line(vday || ','|| vprice);
  if vday >= '80-1-1' and vday<='89-12-31' then
    vimsi := vprice * 0.8;
  elsif vday >= '90-1-1' and vday<='99-12-31' then
    vimsi := vprice * 0.9;
  else
    vimsi := vprice * 0.95;
  end if;
--  if
  update book set price = vimsi where no = vinput;  
end;

select * from book;


-- book ���̺��� ��ȣ �ϳ��� �Ѱܼ� �� ��ȣ�� ���ǻ簡 
--���е����̸� ����+100
--â�۰� �����̸� ����+200
--���а� �����̸� ����+300 ���� �����ϴ� procedure����� 
select * from book;

create or replace procedure update_price(vno number)
as
-- ���� ����
vpublisher varchar2(20);
begin
  select publisher
  into vpublisher
  from book
  where no = vno;
  
  if vpublisher='���е���' then
    update book set price = price + 100 where no = vno;
  elsif  vpublisher='â�۰� ����' then
    update book set price = price + 200 where no = vno;
  elsif  vpublisher='���а� ����' then
    update book set price = price + 300 where no = vno;  
  end if;  
end;

execute update_price(3);
select * from book;

--*
--**
--***
--****
--*****
declare

begin
  for i in 1..5 loop
    for j in 1..i loop
     dbms_output.put('*');
    end loop;
    dbms_output.put_line('');
  end loop;  
end;


select min(birth) from members;
create or replace function old_birth
return date as
--���� ����
vmin date;
begin
  select min(birth) 
  into vmin
  from members;
  
  return vmin;
end;

select old_birth from dual;



------------------------------------------------------

select * from emp;

--8000 ������
declare
  vemp number;
  vename varchar2(10);
begin
  select empno,ename
  into vemp,vename
  from emp
  where empno=8000;
  dbms_output.put_line(vemp||','||vename);
end;



begin
  for i in (select empno, ename from emp) loop
    dbms_output.put_line(i.empno||','||i.ename);
  end loop;
end;

--Ŀ��(cursor) : ��� ������ ����Ű�� ������
--����:
--declare
--  ���� ����
--cursor Ŀ���� is
--  ������ ������(select~~)
--begin
--  open Ŀ����;
--  loop
--    fetch Ŀ���� into ������, , ;
--    exit when ����;
--  end loop;
--  close Ŀ����;
--end;

declare
vempno emp.empno%type;
vename emp.ename%type;

cursor sel_cursor is
  select empno, ename
  from emp;
begin
  open sel_cursor; 
  loop
    fetch sel_cursor into vempno, vename;
    exit when sel_cursor%NOTFOUND;
    dbms_output.put_line(vempno ||','|| vename);
  end loop;
  close sel_cursor;
end;


declare
  vemp emp%rowtype;
cursor sel_cursor is
  select *
  from emp;
begin
  open sel_cursor; 
  loop
    fetch sel_cursor into vemp;
    exit when sel_cursor%NOTFOUND;
    dbms_output.put_line(vemp.empno ||','|| vemp.ename);
  end loop;
  close sel_cursor;
end;


declare
--  vemp emp%rowtype;
cursor sel_cursor is
  select *
  from emp;
begin
--  open sel_cursor; 
--  loop
--    fetch sel_cursor into vemp;
--    exit when sel_cursor%NOTFOUND;
--    dbms_output.put_line(vemp.empno ||','|| vemp.ename);
--  end loop;
--  close sel_cursor;

  for vemp in sel_cursor loop
    dbms_output.put_line(vemp.empno ||','|| vemp.ename);
  end loop;

end;


select * from members;
--�����̸鼭 �������� ���ڵ��� no,name,gender,did ��������
--3���� ������� 

declare
  -- ����
cursor gd_print2 is
  select *
  from members
  where gender='����' and did='������';
begin
  dbms_output.put_line('for loop ���');
  for vm in gd_print2 loop
    dbms_output.put_line(vm.no || ', ' || vm.name || ', ' || vm.gender || ', ' || vm.did);
  end loop;
end;


------

declare
mem members%rowtype;
cursor cmem is
select *
from members
where gender = '����' and did = '������';
begin
  open cmem;
    loop
    FETCH cmem into mem;
      exit when cmem%notfound;
      DBMS_OUTPUT.PUT_LINE(mem.no||','||mem.name||','||mem.gender||','||mem.did);
    end loop;
  close cmem;
end;


begin 
  for mem in (select * from members where gender='����' and did='������') loop
    dbms_output.put_line(mem.no||','||mem.name||','||mem.gender||mem.did);
  end loop;
end;


----------
create or replace procedure select_emp
is
--declare
vemp emp%rowtype;
cursor sel_cursor is
  select * from emp;
begin
  open sel_cursor;
    loop
      fetch sel_cursor into vemp;
      exit when sel_cursor%NOTFOUND;
      dbms_output.put_line(vemp.empno ||','||vemp.ename);
    end loop;
  close sel_cursor;
end;

execute select_emp;


--------------------- ����ó�� ------------------------------
--try{
-- FileReader fr = new FileReader('a.txt');
--}catch(FilenotFoundException e){
--}catch(Exception e){
--}finally{
--}
--throws

declare
  i number default 0;
begin
  i := 10/0;
  dbms_output.put_line(i);
  dbms_output.put_line('success');
exception when ZERO_DIVIDE then -- others 
  dbms_output.put_line('���� �߻�');
end;

select * from emp;
declare
  vempno emp.empno%type;
  vename emp.ename%type;
begin
  select empno, ename
  into vempno, vename
  from emp
  where ename = '������';
  dbms_output.put_line(vempno || ',' || vename);
exception 
  when no_data_found then
    dbms_output.put_line('�ش� ����� �����ϴ�.');
  when too_many_rows then
    dbms_output.put_line('�ش� ����� 2�� �̻� �ֽ��ϴ�.');
  when others then
    dbms_output.put_line('�� ���� �����Դϴ�.');
end;

---------------------
create or replace procedure emp_proc(vdeptno emp.deptno%type)
is
  INVALID_NUMBER EXCEPTION;
begin
  if vdeptno < 0 then
    raise INVALID_NUMBER;
  else
    dbms_output.put_line('�μ���ȣ ��� �Էµ�');
  end if;
  
exception 
  when INVALID_NUMBER then
    dbms_output.put_line('�μ���ȣ ���� �Էµ�');
end;

exec emp_proc(30);
exec emp_proc(-10);













