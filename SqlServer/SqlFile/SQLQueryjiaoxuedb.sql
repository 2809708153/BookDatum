--创建数据库jiaoxuedb：
create database jiaoxuedb
on
(name=jiaoxuedb_dat,filename='d:\jiaoxuedb_dat.mdf')
log on
(name=jiaoxuedb_log,filename='d:\jiaoxuedb_log.ldf')
go

--创建jiaoxuedb中的表：
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

--插入jiaoxuedb库中各表值：
use jiaoxuedb

/*insert values to student table*/
insert into student values('001101','宋大方','男',19,'计算机')
insert into student values('002102','李王','男',20,'信息')
insert into student values('991101','张彬','男',18,'计算机')
insert into student values('991102','王蕾','女',19,'计算机')
insert into student values('991103','张建国','男',18,'计算机')
insert into student values('991104','李平方','男',18,'计算机')
insert into student values('991201','陈东辉','男',19,'计算机')
insert into student values('991202','葛鹏','男',21,'计算机')
insert into student values('991203','潘桃芝','女',19,'计算机')
insert into student values('991204','姚一峰','男',18,'计算机')
insert into student values('001102','许辉','女',22,'计算机')
insert into student values('001201','王一山','男',20,'计算机')
insert into student values('001202','牛莉','女',19,'计算机')
insert into student values('002101','李丽丽','女',19,'信息')

/*insert values to teacher table*/
insert into teacher values('000006','许红霞','女',39,'讲师',1100,1200,'计算机')
insert into teacher values('000007','许永军','男',57,'教授',2000,3000,'计算机')
insert into teacher values('000008','李贵青','女',65,'教授',2000,3000,'计算机')
insert into teacher values('000009','王一凡','女',43,'讲师',1200,1200,'计算机')
insert into teacher values('000010','田峰','男',33,'助教',500,800,'信息')
insert into teacher values('000001','李英','女',39,'副教授',1500,2000,'信息')
insert into teacher values('000002','张雪','女',51,'教授',1900,3000,'信息')
insert into teacher values('000003','张朋','男',30,'讲师',1000,1200,'计算机')
insert into teacher values('000004','王平','女',28,'讲师',850,1200,'信息')
insert into teacher values('000005','李力','男',47,'教授',1800,3000,'计算机')

/*insert values to course table*/
insert into course values('01001','计算机基础',60,3)
insert into course values('01002','程序设计',80,5)
insert into course values('02003','数据结构',60,6)
insert into course values('02001','数据库',80,6)
insert into course values('02002','计算机网络',60,6)
insert into course values('01003','微机原理',60,8)
insert into course values('02004','操作系统',60,6)
insert into course values('03001','软件工程',60,3)
insert into course values('03002','大型数据库',48,2)
insert into course values('03003','图像处理',48,2)

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

--1、对个表创建实体完整性；
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

--2、创建表之间的参照完整性。
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

--（1）“姓名”字段取唯一值：
use jiaoxuedb
alter table student
	add constraint unique_sna unique(sname)
alter table teacher
	add constraint unique_tna unique(tname)

--(2) “性别”字段取值为：‘男’或‘女’；默认值：‘男’；
use jiaoxuedb

alter table teacher with check
	add constraint check_t_sex check(sex='男' or sex='女')
alter table teacher
	add constraint df_t_sex default '男' for sex

alter table student with check
	add constraint check_s_sex check(sex='男' or sex='女')
alter table student
	add constraint df_s_sex default '男' for sex

--（3）“年龄”和“分数”字段取值限定为：0~100之间。
use jiaoxuedb

alter table student with check
	add constraint check_s_age check(age>0 and age<100)
alter table teacher with check
	add constraint check_t_age check(age>0 and age<100)