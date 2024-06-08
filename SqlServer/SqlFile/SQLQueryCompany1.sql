use  Company

go
 create table employee
 (
 emp_no char(5) primary key, --员工编号
emp_name char(10) not null, --员工姓名
sex char(1) not null, -- 性别
dept char(4) not null, --部门
title char(6) not null, --职称
date_hired datetime not null,--上任日期
birthday datetime null, --生日
salary int not null, --工资
addr char(50) null, -- 住址
modifier char(5) default (user_name(null)), --操作人
mod_date datetime default (getdate()) -- 操作日期

)

go

create table customer
 (
 cus_id char(5) primary key , --客户编号
cus_name char(20) not null, --客户姓名
addr char(40) not null, --客户住址
tel_no char(10) not null, --客户电话
zip char(6) null --邮递区号

)

go

create table sales
 (
 order_no int identity(1000,1) not null,--定单编号
cus_id char(5) not null, --客户编号
sale_id char(5) not null, --业务员编号
toa_amt numeric (9,2) not null, --定单金额
order_date datetime default(getdate()),--定货日期0
 ship_date datetime not null,--出货日期
invoice_no char(10) not null,--发票号码
o_static char(2) not null,--定单处理状况
constraint UQ_invoice unique nonclustered (invoice_no)
 )

go

create table sale_item
 (
 order_no int not null, --定单编号
prod_id char(5) not null,--产品编号
sup_id char(5) not null, --供应商编号
qty int not null, --销售数量
unit_price numeric (7,2) not null, --单价
order_date datetime null,--定单日期
constraint pk_sale_item primary key clustered(order_no,prod_id,sup_id)
 )

go

create table stock
 (
 prod_id char(5) not null, --产品编号
sup_id char(5) not null, --供应商编号
stk_qty int not null, --库存数量
constraint pk_stock primary key clustered(prod_id,sup_id)
 )

go

create table pur_item
 (
 pur_no int not null, --采购定单
prod_id char(5) not null,--产品编号
sup_id char(5) not null,--供应商编号
qty int not null, --采购数量
unit_price numeric(7,2) not null, --单价
pur_date datetime not null, --采购日期
constraint pk_pur_item primary key clustered(pur_no,prod_id,sup_id)
 )

go

create table product
 (
 prod_id char (5) primary key, --产品编号
prod_name char(20) not null --产品名称
)

go

create table supply
 (
 sup_id char(5) not null, --供应商编号
sup_name char(20) null --供应商名称
)
go

insert into employee values('E0001','王大华','M','业务','经理','1976/10/13','1951/08/01',80000,'上海市',default,default)
 insert into employee values('E0003','陈自强','M','会计','科长','1986/09/15','1963/06/09',48000,'南京市',default,default)
 insert into employee values('E0014','周小梅','F','业务','职员','1996/03/01','1970/03/28',32000,'上海市',default,default)
 insert into employee values('E0009','陈建国','M','管理','科长','1987/04/15','1967/09/01',45000,'天津市',default,default)
 insert into employee values('E0017','林光华','M','业务','职员','1995/10/13','1973/08/17',30000,'上海市',default,default)
 insert into employee values('E0006','李珠珠','F','管理','经理','1988/01/01','1961/07/12',60000,'北京市',default,default)
 insert into employee values('E0002','李庄敬','M','人事','科长','1980/09/15','1958/05/03',80000,'广州市',default,default)
 insert into employee values('E0010','王成功','M','信息','职员','1993/02/15','1969/04/15',45000,'北京市',default,default)
 insert into employee values('E0013','陈中华','M','业务','职员','1993/02/15','1966/07/01',43000,'天津市',default,default)
 insert into employee values('E0008','刘刚', 'M','业务','职员','1994/11/01','1968/08/01',40000,'上海市',default,default)
 insert into employee values('E0005','李珊珊','F','会计','职员','1990/03/20','1967/04/25',38000,'上海市',default,default)
 insert into employee values('E0011','李小蓉','F','人事','职员','1994/11/01','1971/11/18',30000,'重庆市',default,default)
 insert into employee values('E0012','蔡文钦','M','制造','厂长','1984/08/15','1960/07/21',50000,'上海市',default,default)
 insert into employee values('E0015','张大山','M','制造','职员','1993/12/15','1968/09/23',35000,'上海市',default,default)
 insert into employee values('E0007','吴铁雄','M','信息','科长','1989/10/01','1965/04/18',50000,'武汉市',default,default)
 insert into employee values('E0016','方美美','F','业务','职员','1992/05/20','1966/06/23',40000,'上海市',default,default)
 insert into employee values('E0004','刘中星','M','制造','经理','1984/05/01','1960/05/23',60000,'上海市',default,default)
 insert into employee values('E0019','王仁华','M','信息','经理','1985/09/15','1959/03/24',60000,'上海市',default,default)
 insert into employee values('E0020','陈火旺','M','业务','职员','1992/08/01','1964/05/12',43000,'天津市',default,default)
 insert into employee values('E0018','林中正','M','管理','总经理','1974/10/01','1953/05/04',100000,'上海市',default,default)

go

insert into customer values('C0001','ABC股份有限公司','上海市','64284881','116011')
insert into customer values('C0002','康师傅 ','天津市','54685212','116025')
insert into customer values('C0003','联想','北京市','66544654','456131')
insert into customer values('C0004','HP','上海市','46466996','012365')
insert into customer values('C0005','华为','北京市','87434647','789258')
insert into customer values('C0006','海尔','上海市','01554689','741852')
insert into customer values('C0007','华信','上海市','36985214','132798')

go
 set identity_insert sales on
 GO
 insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10002','C0002','E0013',22700.00,'1996/11/10','1996/11/17','I000000002','00')
insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10003','C0003','E0014',13960.00,'1996/10/15','1996/10/17','I000000003','00')
insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10004','C0003','E0014',33000.00,'1996/12/10','1996/12/17','I000000004','00')
insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10001','C0001','E0008',60000.00,'1996/10/22','1996/10/24','I000000001','00')
insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10007','C0008','E0008',20000.00,'1996/10/15','1996/10/17','I000000008','00')
GO
 SET IDENTITY_INSERT SALES OFF
 GO
 INSERT INTO SALE_ITEM VALUES(10001,'P0001','S0001',5,2500.00,'1996/10/22')
INSERT INTO SALE_ITEM VALUES(10001,'P0002','S0001',3,6500.00,'1996/10/22')
INSERT INTO SALE_ITEM VALUES(10001,'P0003','S0001',2,5300.00,'1996/10/22')
INSERT INTO SALE_ITEM VALUES(10001,'P0004','S0001',2,1600.00,'1996/10/22')
INSERT INTO SALE_ITEM VALUES(10002,'P0001','S0002',3,2600.00,'1996/11/10')
INSERT INTO SALE_ITEM VALUES(10002,'P0003','S0001',1,5300.00,'1996/11/10')
INSERT INTO SALE_ITEM VALUES(10002,'P0008','S0004',2,4800.00,'1996/11/10')
INSERT INTO SALE_ITEM VALUES(10003,'P0001','S0002',4,2700.00,'1996/10/15')
INSERT INTO SALE_ITEM VALUES(10003,'P0004','S0003',2,1580.00,'1996/10/15')
GO
 INSERT INTO STOCK VALUES('P0001','S0001',200)
 INSERT INTO STOCK VALUES('P0001','S0002',120)
 INSERT INTO STOCK VALUES('P0001','S0004',150)
 INSERT INTO STOCK VALUES('P0002','S0001',20)
 INSERT INTO STOCK VALUES('P0002','S0002',10)
 INSERT INTO STOCK VALUES('P0003','S0001',15)
 INSERT INTO STOCK VALUES('P0008','S0002',120)
 INSERT INTO STOCK VALUES('P0012','S0007',20)
 INSERT INTO STOCK VALUES('P0013','S0003',30)
 INSERT INTO STOCK VALUES('P0013','S0005',20)
 GO
 INSERT INTO PUR_ITEM VALUES(50001,'P0001','S0001',20,2000.00,'1996/10/25')
INSERT INTO PUR_ITEM VALUES(50001,'P0008','S0002',25,5000.00,'1996/10/25')
INSERT INTO PUR_ITEM VALUES(50003,'P0001','S0001',10,2150.00,'1996/07/15')
INSERT INTO PUR_ITEM VALUES(50005,'P0008','S0004',30,4500.00,'1996/08/10')
GO
 INSERT INTO PRODUCT VALUES('P0001','16M DRAM')
INSERT INTO PRODUCT VALUES('P0002','14寸显示器')
INSERT INTO PRODUCT VALUES('P0003','1.2GB硬盘')
INSERT INTO PRODUCT VALUES('P0004','3.5寸软驱')
INSERT INTO PRODUCT VALUES('P0005','键盘')
INSERT INTO PRODUCT VALUES('P0006','VGA 显示卡')
INSERT INTO PRODUCT VALUES('P0007','网卡')
INSERT INTO PRODUCT VALUES('P0008','PENTIUM 100 CPU')
INSERT INTO PRODUCT VALUES('P0009','激光打印机')
INSERT INTO PRODUCT VALUES('P0010','8倍光驱')
INSERT INTO PRODUCT VALUES('P0011','计算机字典')
INSERT INTO PRODUCT VALUES('P0012','9600 bit/s MODEM')
INSERT INTO PRODUCT VALUES('P0013','pentium 主板')

GO
 INSERT INTO SUPPLY VALUES('S0001','联强国际')
INSERT INTO SUPPLY VALUES('S0002','宏基科技')
INSERT INTO SUPPLY VALUES('S0003','大众计算机')
INSERT INTO SUPPLY VALUES('S0005','华硕计算机')
INSERT INTO SUPPLY VALUES('S0006','英业计算机')
INSERT INTO SUPPLY VALUES('S0007','华夏电子')
INSERT INTO SUPPLY VALUES('S0004','联华电子')

use Company
--1.  查询公司目前的员工数量
select count(emp_no) from employee
--2.  查询公司中女性员工的数量
select count(emp_no) from employee where sex = 'F'
--3.  查询在公司工作超过20年的员工姓名，职务，工资
select emp_name,title,salary from employee where year(mod_date)-year(date_hired) > 20
--4.  统计公司不同年份入职员工的平均工资，最高工资以及人数
select year(date_hired), 
       AVG(salary) AS average_salary, 
	   MAX(salary) AS max_salary, 
	   COUNT(*) AS number_of_employees
FROM employee
GROUP BY year(date_hired)
--5.  查询所有电话为6开头的客户信息。
select * from customer where tel_no like '6%'
--6.  按每个女性员工55岁男性员工60岁计算查询每个员工的姓名，生日，入职时间以及他（她）的退休时间。
select emp_name, birthday ,date_hired ,
	   CASE   
        WHEN sex = 'F' THEN DATEADD(year, 55, birthday)  
        WHEN sex = 'M' THEN DATEADD(year, 60, birthday)  
	   END AS retire_date    
	   from employee
--7.  查询公司中男性员工所占比率
select  
    ROUND((SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS male_percentage  
from employee;
--8.  查询上海客户的数量
select count(*) as '上海客户' from customer where addr = '上海市'
--9.  统计公司在不同城市的客户数量
select addr,count(*) as '不同城市客户数' from customer group by addr
--10. 查询1996年10月订货的平均金额、最高金额、最低金额
select avg(unit_price * qty) as '平均金额',
	   max(unit_price * qty) as '最高金额',
	   min(unit_price * qty) as '最低金额' from pur_item
where year(pur_date) = 1996 and month(pur_date) = 10
--11. 查询员工信息，并按上任日期升序排列
select * from employee order by date_hired ASC
--12. 查询公司96年11月的销售记录
select * from sale_item where year(order_date) = 1996 and month(order_date) = 11
--13.统计公司里所有干部的 姓名，职务，年龄并按照年龄降序排序
select emp_name AS '姓名', title AS '职务', year(mod_date) - year(birthday) AS '年龄'
from employee where title != '职员'
order by year(mod_date) - year(birthday) DESC
--14.查询每个月公司的销售额
select sum(toa_amt) from sales group by month(order_date) 
--15.查询公司中王姓员工的信息
select * from employee where emp_name like '王%'
--16.查询公司中所有姓名有三个字的员工信息
select * from employee where len(emp_name) = 3
--17.查询公司员工的平均年龄
select avg(year(mod_date)-year(birthday)) from employee
--18.查询所有产品信息，并按产品编号升序排列
select * from product order by prod_id ASC
--19.查询所供应商信息，并供应商名称降序排列
select * from supply order by sup_name DESC
--20.查询1996年10的采购总金额
select sum(unit_price * qty) from pur_item where year(pur_date) = 1996 and month(pur_date) = 10