use jiaoxuedb

if exists  (select name from sysobjects where name='pro_sname' and type='p')
drop procedure pro_sname
go
--1、利用学生名查询该生选修的课程名、成绩、任课教师名。
--创建存储过程
create procedure pro_sname
	@sname_in char(10)
as select student.sname 学生,cname 选修课程,score 分数,tname 教师
from student,sc,teacher,course,tc
where student.sname=@sname_in
	and sc.sno=student.sno 
	and sc.cno=course.cno 
	and sc.cno=tc.cno 
	and tc.cno=course.cno
	and tc.tno=teacher.tno
go
--执行存储过程
declare
	@sname_input char(10)
select @sname_input = '张彬'
exec pro_sname @sname_input

if exists (select name from sysobjects where name='pro_age_max_min' and type='p')
drop procedure pro_age_max_min
go
--2、查询某系的学生的最大年龄和最小年龄。
--创建存储过程
create procedure pro_age_max_min
	@sdept_input char(10)
as select dept 院系,max(age) as 最大年龄,min(age) as 最小年龄
from student where dept=@sdept_input group by dept
go
--执行存储过程
declare
	@sdept_in char(10)
select @sdept_in='计算机'
exec pro_age_max_min @sdept_in

if exists (select name from sysobjects where name='pro_scorebysncn' and type='p')
drop procedure pro_scorebysncn
go
--3、利用学生姓名和课程名检索该生课程的成绩。
--创建存储过程
create procedure pro_scorebysncn  
    @sname_input char(10), @scname_input char(10)  
as 
select   
    s.sname 姓名, c.cname 课程名, sc.score 分数  
from 
    student s  
join sc on s.sno = sc.sno  
join course c on sc.cno = c.cno  
where   
    s.sname = @sname_input and c.cname = @scname_input 
go
--执行存储过程
declare
	@sname_in char(10),
	@scname_in char(10)
select @sname_in='李平方'
select @scname_in='程序设计'
exec pro_scorebysncn @sname_in,@scname_in

if exists (select name from sysobjects where name='pro_prof_count' and type='p')
drop procedure pro_prof_count
go
--4、根据职称查询人数，并给出“副教授”的人数。
--创建存储过程
create procedure pro_prof_count
	@prof_input char(10)
as select prof 职称,count(prof) 人数
from teacher
where prof=@prof_input
group by prof
go
--执行存储过程
declare
	@prof_in char(10)
select @prof_in='教授'
exec pro_prof_count @prof_in  

if exists (select name from sysobjects where name='pro_dept_analyze' and type='p')
drop procedure pro_dept_analyze
go
--5、统计某系某职称的人数平均年龄、平均工资最高工资。
--创建存储过程
create procedure pro_dept_analyze
	@dept_input char(10),
	@prof_input char(10)
as select dept 院系,prof 职称,
		count(*) 人数,avg(age) 平均年龄,avg(sal) 平均工资,max(sal) 最高工资
from teacher
where dept=@dept_input and prof=@prof_input
group by dept,prof
go
--执行存储过程
declare
	@dept_input char(10),
	@prof_input char(10)
select @dept_input='计算机'
select @prof_input='教授'
exec pro_dept_analyze @dept_input,@prof_input

if exists (select name from sysobjects where name='pro_dept_count' and type='p')
drop procedure pro_dept_count
go
--6、查询某系的教师人数、平均年龄和学生人数。
--创建存储过程
create procedure pro_dept_count
	@dept_in char(10)
as 
select dept 院系,count(teacher.dept) 教师人数,avg(age) 教师平均年龄 
into #t1
from teacher
where teacher.dept=@dept_in
group by dept
select dept 院系,count(student.dept) 学生人数
into #t2
from student
where dept=@dept_in
group by dept
select #t1.院系 院系,教师人数,教师平均年龄,学生人数
from #t1,#t2
where #t1.院系=#t2.院系
go
--执行存储过程
declare
	@dept_in char(10)
select @dept_in='计算机'
exec pro_dept_count @dept_in

if exists (select name from sysobjects where name='pro_cname' and type='p')
drop procedure pro_cname
go
--7、利用课程名查询选修该课程的学生姓名、系别、成绩，并给出“程序设计”课程的该查询信息。
--创建存储过程
create procedure pro_cname
	@cname char(10)
as select sname 学生姓名,dept 系别,cname 课程名,score 成绩
from student,sc,course
where cname=@cname and sc.cno=course.cno and sc.sno=student.sno
go
--执行存储过程
declare
	@cname char(10)
select @cname='程序设计'
exec pro_cname @cname

if exists (select name from sysobjects where name='pro_tname_cname' and type='p')
drop procedure pro_tname_cname
go
--8、利用教师姓名和课程名检索该教师该任课的课程名、课时数、选课人数、平均成绩、最高成绩，并查询教师“张雪”的“微机原理”课程的情况记录。
--创建存储过程
create procedure pro_tname_cname  
    @tname char(10), @cname char(10)  
as 
select 
    t.tname 教师姓名,c.cname 课程名称,c.chour 课时数,  
    COUNT(DISTINCT sc.sno) 选课人数,isnull(AVG(sc.score),0) 平均成绩  
from teacher t  
join tc ON t.tno = tc.tno -- 假设tc是teacher_course的别名  
join course c on tc.cno = c.cno  
left join sc on c.cno = sc.cno -- 使用LEFT JOIN来包含没有选课记录的课程  
where t.tname = @tname AND c.cname = @cname  
group by t.tname, c.cname , c.chour
go
--执行存储过程
declare
	@tname char(10),
	@cname char(10)
select @tname='张雪'
select @cname='微机原理'
exec pro_tname_cname @tname,@cname
go
declare
	@tname char(10),
	@cname char(10)
select @tname='张雪'
select @cname='程序设计'
exec pro_tname_cname @tname,@cname

--9、删除上面第1题创建的存储过程。
drop procedure pro_sname

--10、删除上面第3、4题创建的存储过程。
drop procedure pro_scorebysncn 
drop procedure pro_prof_count


select 
    t.tname 教师姓名,c.cname 课程名称,c.chour 课时数,  
    COUNT(DISTINCT sc.sno) 选课人数, isnull(AVG(sc.score),0) 平均成绩  
from teacher t  
join tc ON t.tno = tc.tno -- 假设tc是teacher_course的别名  
join course c on tc.cno = c.cno  
left join sc on c.cno = sc.cno -- 使用LEFT JOIN来包含没有选课记录的课程  
group by t.tname, c.cname , c.chour