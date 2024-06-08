--已知有选课表sc和课程表course，其中课程表中有选课人数字段（xkrs）
--请编写三个触发器，分别实现
--先建立表结构
use test
create table c(
	cno char(2) not null,
	cn char(10) not null,
	ct tinyint null,
	id_tc tinyint null,
	xkrs int null)
create table sc(
	sno char(2) not null,
	cno char(2) not null,
	score tinyint null)
insert into c values('c1','程序设计',60,1,3)
insert into c values('c2','微机原理',80,2,3)
insert into c values('c3','数字逻辑',60,3,1)
insert into c values('c4','数据结构',80,4,1)
insert into c values('c5','数据库',60,5,1)
insert into c values('c6','编译原理',60,6,1)
insert into c values('c7','操作系统',60,7,1)

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

delete from sc where sno = 's8' and cno = 'c1'
go
update sc set cno = 'c1' where sno='s2' and cno = 'c2'
--①当向sc表插入记录时，把课程表中对应课程的选课人数字段加1；
go
create trigger tri_upsc1
on sc for insert
as
declare @cno_p char(10)
select @cno_p=cno from inserted
update c set xkrs = xkrs + 1 where cno=@cno_p
go 


UPDATE c  
SET c.xkrs = (  
    SELECT COUNT(DISTINCT sno)  
    FROM sc  
    WHERE sc.cno = c.cno  
)  
FROM c




--②当从sc表删除一条记录时，把课程表中对应课程的选课人数字段减1；
go
create trigger tri_delsc1
on sc for delete
as
declare @cno_pre char(10)
select @cno_pre=cno from deleted
update c set xkrs = xkrs - 1 where cno=@cno_pre
go 
--③当修改sc表中一条记录的课号（cno）时，把课程表中对应课程的选课人数字段加1，对应课程的选课人数字段减1。
go
create trigger tri_upsc2
on sc for update
as
declare @cno_pre char(10),@cno_p char(10)
select @cno_pre=cno from deleted
select @cno_p=cno from inserted
update c set xkrs = xkrs - 1 where cno=@cno_pre
update c set xkrs = xkrs + 1 where cno=@cno_p
go 





use jiaoxuedb

go
--①已存在则删除
if exists (select name from sysobjects where name='tri_sc_score' and type='tr')
drop trigger tri_sc_score
--1、为表sc创建一触发器：当插入或修改一个记录时，确保此记录的成绩在0~100之间。
go
create trigger tri_sc_score
on sc for insert,update
as
declare @score_input tinyint
select @score_input=score from inserted
if @score_input < 0 or @score_input > 100
begin
	print '成绩超出0~100，请重新输入！'
	rollback transaction  --事务回滚
end
go
--②已存在则删除
go
if exists (select name from sysobjects where name='tri_teacher_age' and type='tr')
drop trigger tri_teacher_age
--2、为教师表t创建一触发器：男职工年龄不能超过60周岁，女职工职称是“教授”的年龄不能超过60岁，其他女职工年龄不能超过55岁。
go
create trigger tri_teacher_age
on teacher for insert,update
as
declare @sex_input char(2)
declare @age_input tinyint
declare @prof_input char(10)

select @sex_input=sex from inserted
select @age_input=age from inserted
select @prof_input=prof from inserted

if ( @sex_input = '男' and @age_input > 60 ) 
	or (@sex_input = '女' and @prof_input = '教授' and @age_input > 60)
	or (@sex_input = '女' and @prof_input != '教授' and @age_input > 55)
begin
	print '年龄不合法。'
	rollback transaction
end
go
--③已存在则删除
go
if exists (select name from sysobjects where name='del_course_sc_tc' and type='tr')
drop trigger del_course_sc_tc
go
if exists (select name from sysobjects where name='up_course_sc_tc' and type='tr')
drop trigger up_course_sc_tc
--3、为表c、表tc和表sc创建参照完整性：级联删除和级联修改触发器。
--级联删除
go
create trigger del_course_sc_tc
on course for delete
as
declare @cno_del char(10)
select @cno_del=cno from deleted
delete from sc where cno=@cno_del
delete from tc where cno=@cno_del
go
--级联更新
go
create trigger up_course_sc_tc
on course for update
as
declare @cno_pre char(10)
declare @cno_p char(10)
select @cno_pre=cno from deleted
select @cno_p=cno from inserted
update sc set cno=@cno_p where cno=@cno_pre
update tc set cno=@cno_p where cno=@cno_pre
go
--验证级联删除
delete from course where cno='c2'
go
--验证级联更新
update course set cno='c0' where cno='c1'
go

--④已存在则删除
go
if exists (select name from sysobjects where name='up_teacher' and type='tr')
drop trigger up_teacher
--4、为表t创建一个触发器：当职称从“讲师”晋升为“副教授”时，岗位津贴自动增加500元；从“副教授”晋升为“教授”时，岗位津贴自动增加8900元。
go
create trigger up_teacher
on teacher for update
as
declare @prof_pre char(10) , @prof_p char(10) , @tno char(10)
select @prof_pre=prof from deleted
select @prof_p=prof from inserted
select @tno=tno from deleted
if @prof_pre='讲师' and @prof_p='副教授'
begin
	update teacher set comm = comm + 500 where tno=@tno
end
if @prof_pre='副教授' and @prof_p='教授'
begin
	update teacher set comm = comm + 8900 where tno=@tno
end
go

--⑤已存在则删除
go
if exists (select name from sysobjects where name='update_sc_score_to_grade' and type='tr')
drop trigger update_sc_score_to_grade
--5、为表sc创建一触发器，将成绩按下列对应关系由分数转换成等级
go
ALTER TABLE sc ADD grade CHAR(10)
----1.小于60：不及格  2.60~70：及格 3.70~80：中  4.80~90：良  5.90~100：优
go
create trigger update_sc_score_to_grade
on sc for update,insert
as
declare @sno char(10), @score tinyint
select @sno=sno from inserted
select @score=score from inserted
if @score < 60 begin update sc set score='不及格' where sno=@sno end
if @score >= 60 and @score < 70 begin update sc set grade='及格' where sno=@sno end
if @score >= 70 and @score < 80 begin update sc set grade='中' where sno=@sno end
if @score >= 80 and @score < 90 begin update sc set grade='良' where sno=@sno end
if @score >= 90 and @score < 100 begin update sc set grade='优' where sno=@sno end
go

UPDATE sc  
SET grade = CASE  
    WHEN score < 60 THEN '不及格'  
    WHEN score BETWEEN 60 AND 69 THEN '及格'  
    WHEN score BETWEEN 70 AND 79 THEN '中'  
    WHEN score BETWEEN 80 AND 89 THEN '良'  
    WHEN score BETWEEN 90 AND 100 THEN '优'  
    ELSE grade -- 如果score不在上述范围内，保持原有grade不变（可选）  
END