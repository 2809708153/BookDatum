--�������ݿ�jiaoxuedb��
create database jiaoxuedb
on
(name=jiaoxuedb_dat,filename='d:\jiaoxuedb_dat.mdf')
log on
(name=jiaoxuedb_log,filename='d:\jiaoxuedb_log.ldf')
go

--����jiaoxuedb�еı�
use jiaoxuedb
create table student(
	sno char(10) not null,
	sname char(10) not null,
	sex char(2) null,
	age tinyint null,
	dept char(10) null)
create table teacher(
	tno char(10) not null,
	tname char(10) not null,
	sex char(2) null,
	age tinyint null,
	prof char(10) null,
	sal smallint null,
	comm smallint null,
	dept char(10) null)
create table course(
	cno char(10) not null,
	cname char(10) not null,
	chour tinyint null,
	ccredit tinyint null)
create table sc(
	sno char(10) not null,
	cno char(10) not null,
	score tinyint null)
create table tc(
	tno char(10) not null,
	cno char(10) not null)

--����jiaoxuedb���и���ֵ��
use jiaoxuedb

/*insert values to student table*/
insert into student values('001101','�δ�','��',19,'�����')
insert into student values('002102','����','��',20,'��Ϣ')
insert into student values('991101','�ű�','��',18,'�����')
insert into student values('991102','����','Ů',19,'�����')
insert into student values('991103','�Ž���','��',18,'�����')
insert into student values('991104','��ƽ��','��',18,'�����')
insert into student values('991201','�¶���','��',19,'�����')
insert into student values('991202','����','��',21,'�����')
insert into student values('991203','����֥','Ů',19,'�����')
insert into student values('991204','Ҧһ��','��',18,'�����')
insert into student values('001102','���','Ů',22,'�����')
insert into student values('001201','��һɽ','��',20,'�����')
insert into student values('001202','ţ��','Ů',19,'�����')
insert into student values('002101','������','Ů',19,'��Ϣ')

/*insert values to teacher table*/
insert into teacher values('000006','���ϼ','Ů',39,'��ʦ',1100,1200,'�����')
insert into teacher values('000007','������','��',57,'����',2000,3000,'�����')
insert into teacher values('000008','�����','Ů',65,'����',2000,3000,'�����')
insert into teacher values('000009','��һ��','Ů',43,'��ʦ',1200,1200,'�����')
insert into teacher values('000010','���','��',33,'����',500,800,'��Ϣ')
insert into teacher values('000001','��Ӣ','Ů',39,'������',1500,2000,'��Ϣ')
insert into teacher values('000002','��ѩ','Ů',51,'����',1900,3000,'��Ϣ')
insert into teacher values('000003','����','��',30,'��ʦ',1000,1200,'�����')
insert into teacher values('000004','��ƽ','Ů',28,'��ʦ',850,1200,'��Ϣ')
insert into teacher values('000005','����','��',47,'����',1800,3000,'�����')

/*insert values to course table*/
insert into course values('01001','���������',60,3)
insert into course values('01002','�������',80,5)
insert into course values('02003','���ݽṹ',60,6)
insert into course values('02001','���ݿ�',80,6)
insert into course values('02002','���������',60,6)
insert into course values('01003','΢��ԭ��',60,8)
insert into course values('02004','����ϵͳ',60,6)
insert into course values('03001','�������',60,3)
insert into course values('03002','�������ݿ�',48,2)
insert into course values('03003','ͼ����',48,2)

/*insert values to sc table*/
insert into sc values('991101','01001',88)
insert into sc values('991102','01001',93)
insert into sc values('991103','01001',90)
insert into sc values('991101','01002',90)
insert into sc values('991102','01002',98)
insert into sc values('991103','01002',74)
insert into sc values('991104','01002',85)
insert into sc values('001201','01002',64)
insert into sc values('991104','02001',33)
insert into sc values('991104','01001',35)
insert into sc values('991201','01001',76)

/*insert values to tc table*/
insert into tc values('000001','02001')
insert into tc values('000008','02002')
insert into tc values('000003','02001')
insert into tc values('000011','02003')
insert into tc values('000001','01001')
insert into tc values('000002','01002')
insert into tc values('000002','01003')
insert into tc values('000004','02002')
insert into tc values('000005','01001')
insert into tc values('000006','01002')
insert into tc values('000003','01003')

--1���Ը�����ʵ�������ԣ�
use jiaoxuedb

alter table student
	add constraint pk_sno primary key(sno)

alter table teacher 
	add constraint pk_tno primary key(tno)

alter table course
	add constraint pk_cno primary key(cno)

alter table student
	add constraint unique_s unique(sno)

alter table teacher
	add constraint unique_t unique(tno)

alter table course
	add constraint unique_c unique(cno)

--2��������֮��Ĳ��������ԡ�
use jiaoxuedb
alter table sc with nocheck
	add constraint fk_s_sc foreign key(sno) references student(sno)
	on delete cascade

alter table sc with nocheck
	add constraint fk_c_sc foreign key(cno) references course(cno)
	on delete cascade

alter table tc with nocheck
	add constraint fk_t_tc foreign key(tno) references teacher(tno)
	on delete cascade

alter table tc with nocheck
	add constraint fk_c_tc foreign key(cno) references course(cno)
	on delete cascade

--��1�����������ֶ�ȡΨһֵ��
use jiaoxuedb
alter table student
	add constraint unique_sna unique(sname)
alter table teacher
	add constraint unique_tna unique(tname)

--(2) ���Ա��ֶ�ȡֵΪ�����С���Ů����Ĭ��ֵ�����С���
use jiaoxuedb

alter table teacher with check
	add constraint check_t_sex check(sex='��' or sex='Ů')
alter table teacher
	add constraint df_t_sex default '��' for sex

alter table student with check
	add constraint check_s_sex check(sex='��' or sex='Ů')
alter table student
	add constraint df_s_sex default '��' for sex

--��3�������䡱�͡��������ֶ�ȡֵ�޶�Ϊ��0~100֮�䡣
use jiaoxuedb

alter table student with check
	add constraint check_s_age check(age>0 and age<100)
alter table teacher with check
	add constraint check_t_age check(age>0 and age<100)