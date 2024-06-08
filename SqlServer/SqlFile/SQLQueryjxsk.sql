--create database jxsk
--on
--(name=jxsk_dat,filename='d:\jxsk_dat.mdf')
--log on
--(name=jxsk_log,filename='d:\jxsk_log.ldf')
--go


--����jxsk�еı�
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

--����jxsk���и���ֵ��
use jxsk

insert into s values('s2','Ǯ��','��',18,'��Ϣ')
insert into s values('s3','���','Ů',20,'��Ϣ')
insert into s values('s4','��˼','��',21,'�Զ���')
insert into s values('s5','����','��',19,'�����')
insert into s values('s6','����','Ů',20,'�Զ���')
insert into s values('s7','����','��',18,'����')
insert into s values('s8','����','��',null,'�����')
insert into s values('s9','����','Ů',17,'�����')

insert into t values('t5','����','Ů',39,'������',1300,2000,'��Ϣ')
insert into t values('t4','��ѩ','Ů',51,'����',1600,3000,'�Զ���')
insert into t values('t3','��ΰ','��',30,'��ʦ',900,1200,'�����')
insert into t values('t2','��ƽ','Ů',28,'��ʦ',800,1200,'��Ϣ')
insert into t values('t1','����','��',47,'����',1500,3000,'�����')

insert into c values('c1','�������',60,1)
insert into c values('c2','΢��ԭ��',80,2)
insert into c values('c3','�����߼�',60,3)
insert into c values('c4','���ݽṹ',80,4)
insert into c values('c5','���ݿ�',60,5)
insert into c values('c6','����ԭ��',60,6)
insert into c values('c7','����ϵͳ',60,7)

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

--�ٶԽ�ʦ��t�еĽ�ʦ��tno�������������������������С�
use jxsk
create clustered index index_tno
	on t(tno desc)
--�ڶ�ѧ��ѡ�α�sc���Ȱ��κ�cno�������У��ٰ��ɼ�score�������С�
create clustered 
	index index_sc_cno on sc(cno asc,score desc) 
--�۶Ա�student�е�ѧ��sno����Ψһ�����������������С�
create unique index index_s_sno on s(sno asc)



use jiaoxuedb
--1�������ɼ���ͼscore_view,����ѧ��sno,����sn���γ���cn���ɼ�score��
go
create view score_view
	as select student.sno,sname,cname,score
	   from student,course,sc
	   where student.sno=sc.sno and sc.cno=course.cno
go

--2������һ�������ϵѧ��������ͼs_view������ѧ��sno������sn���Ա�sex��
go
create view s_view
	as select sno,sname,sex
	   from student
	   where dept='�����'
go

--3��ͨ���������ͼscore_view���޸�ѧ��Ϊ991102���κ�Ϊ01001�ĳɼ���¼��
update score_view set score=90
where sno='991102' and cname in 
	(select cname from course where cno='01001')
go

--4��ͨ���������ͼs_view���Ѽ����ϵ�����١����Ա��޸�Ϊ�С�
update s_view set sex='��'
where sname='����' and sno =
	(select sno from student where dept='�����' and sname='����')
go

--5������һ����ͼ�������ϵѧ���ĳɼ���score_view_cdept,�溬ѧ��sno������sn���γ���cn���ɼ�score��
go
create view score_view_cdept
	as select student.sno,sname,cname,score
	   from student,sc
	   join course on sc.cno=course.cno
       where student.dept='�����' and student.sno=sc.sno
go

--6������ͼs_view����һ������age�ֶΡ�
go
alter view s_view
	as select sno,sname,sex,age
	   from student
	   where dept='�����'
go

--7������һ����ʦ���ʱ���ͼsal_view���溬�ֶν�ʦ��tname���Ա�sex��ְ��prof�������ܺ�salsum��ϵ��dept��
go
create view sal_view
	as select tname,sex,prof,sal+comm as salsum
	   from teacher
go

--8��ͨ����ͼ��ѯ��ʦ���������Ĺ������롣
select 
	tname as ����,salsum as ��������
from sal_view
where tname='����'
go