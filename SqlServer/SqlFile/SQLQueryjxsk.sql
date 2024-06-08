--create database jxsk
--on
--(name=jxsk_dat,filename='d:\jxsk_dat.mdf')
--log on
--(name=jxsk_log,filename='d:\jxsk_log.ldf')
--go


--创建jxsk中的表：
use jxsk
create table s(
	sno char(2) not null,
	sn char(8) not null,
	sex char(2) null,
	age tinyint null,
	dept char(10) null)
create table t(
	tno char(2) not null,
	tn char(8) not null,
	sex char(2) null,
	age tinyint null,
	prof char(10) null,
	sal smallint null,
	comm smallint null,
	dept char(10) null)
create table c(
	cno char(2) not null,
	cn char(10) not null,
	ct tinyint null,
	id_tc tinyint null)
create table sc(
	sno char(2) not null,
	cno char(2) not null,
	score tinyint null)
create table tc(
	tno char(2) not null,
	cno char(2) not null)

--插入jxsk库中各表值：
use jxsk

insert into s values('s2','钱尔','男',18,'信息')
insert into s values('s3','孙姗','女',20,'信息')
insert into s values('s4','李思','男',21,'自动化')
insert into s values('s5','周武','男',19,'计算机')
insert into s values('s6','吴丽','女',20,'自动化')
insert into s values('s7','李奇','男',18,'外语')
insert into s values('s8','古明','男',null,'计算机')
insert into s values('s9','赵亦','女',17,'计算机')

insert into t values('t5','张兰','女',39,'副教授',1300,2000,'信息')
insert into t values('t4','张雪','女',51,'教授',1600,3000,'自动化')
insert into t values('t3','刘伟','男',30,'讲师',900,1200,'计算机')
insert into t values('t2','王平','女',28,'讲师',800,1200,'信息')
insert into t values('t1','李力','男',47,'教授',1500,3000,'计算机')

insert into c values('c1','程序设计',60,1)
insert into c values('c2','微机原理',80,2)
insert into c values('c3','数字逻辑',60,3)
insert into c values('c4','数据结构',80,4)
insert into c values('c5','数据库',60,5)
insert into c values('c6','编译原理',60,6)
insert into c values('c7','操作系统',60,7)

insert into sc values('s2','c5',57)
insert into sc values('s2','c6',80)
insert into sc values('s2','c7',null)
insert into sc values('s3','c1',75)
insert into sc values('s3','c2',70)
insert into sc values('s3','c4',85)
insert into sc values('s4','c1',93)
insert into sc values('s4','c2',85)
insert into sc values('s4','c3',83)
insert into sc values('s5','c2',89)
insert into sc values('s9','c1',90)
insert into sc values('s9','c2',85)

insert into tc values('t2','c5')
insert into tc values('t3','c1')
insert into tc values('t3','c5')
insert into tc values('t4','c2')
insert into tc values('t4','c3')
insert into tc values('t5','c5')
insert into tc values('t5','c7')
insert into tc values('t1','c1')
insert into tc values('t1','c4')

--①对教师表t中的教师号tno创建聚族索引，并按降序排列。
use jxsk
create clustered index index_tno
	on t(tno desc)
--②对学生选课表sc，先按课号cno升序排列，再按成绩score降序排列。
create clustered 
	index index_sc_cno on sc(cno asc,score desc) 
--③对表student中的学号sno创建唯一索引，并按升序排列。
create unique index index_s_sno on s(sno asc)



use jiaoxuedb
--1、创建成绩视图score_view,包含学号sno,姓名sn，课程名cn，成绩score。
go
create view score_view
	as select student.sno,sname,cname,score
	   from student,course,sc
	   where student.sno=sc.sno and sc.cno=course.cno
go

--2、创建一个计算机系学生名单视图s_view，包含学号sno，姓名sn，性别sex。
go
create view s_view
	as select sno,sname,sex
	   from student
	   where dept='计算机'
go

--3、通过上面的视图score_view，修改学号为991102，课号为01001的成绩记录。
update score_view set score=90
where sno='991102' and cname in 
	(select cname from course where cno='01001')
go

--4、通过上面的视图s_view，把计算机系“王蕾”的性别修改为男。
update s_view set sex='男'
where sname='王蕾' and sno =
	(select sno from student where dept='计算机' and sname='王蕾')
go

--5、创建一个视图，计算机系学生的成绩单score_view_cdept,版含学号sno，姓名sn，课程名cn，成绩score。
go
create view score_view_cdept
	as select student.sno,sname,cname,score
	   from student,sc
	   join course on sc.cno=course.cno
       where student.dept='计算机' and student.sno=sc.sno
go

--6、给视图s_view增加一个年龄age字段。
go
alter view s_view
	as select sno,sname,sex,age
	   from student
	   where dept='计算机'
go

--7、创建一个教师工资表视图sal_view，版含字段教师名tname，性别sex，职称prof，工资总和salsum，系别dept。
go
create view sal_view
	as select tname,sex,prof,sal+comm as salsum
	   from teacher
go

--8、通过视图查询教师“张明”的工资收入。
select 
	tname as 姓名,salsum as 工资收入
from sal_view
where tname='张朋'
go