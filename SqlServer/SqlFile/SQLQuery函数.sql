use jiaoxuedb


--1.用T-SQL语句创建一用户定义的数据类型AgeType。要求:系统数据类型为
--tinyint,可为空,取值范围为0~100,用于学生表和教师表中的年龄字段和选课表中成绩
--字段的数据类型。
use jiaoxuedb
go
exec sp_addtype agetype,'tinyint','null'
go
create rule ru_agetype as @agetype between 0 and 100
go
exec sp_bindrule 'ru_agetype','agetype'
--2.交互式创建数据类型NameType。要求:系统数据类型为varchar,长度为10字
--节,不为空,用于教师名、学生名、职称字段的数据类型。
exec sp_addtype nametype,'varchar (10)','not null'
go
--3.创建一个函数。要求:根据学生姓名和课程名查询该生该课程的成绩。
create function score_fun (@sname_input char(10), @cname_input char(10))
returns tinyint
as 
begin
	declare @score_out tinyint
	select @score_out=score 
	from sc,student,course
	where student.sname=@sname_input and course.cname=@cname_input and student.sno=sc.sno and course.cno=sc.cno
	return (@score_out)
end
go
declare @atemp tinyint
set @atemp=dbo.score_fun('张彬','计算机基础')
print str(@atemp)
--4.创建一个函数。要求:根据教师姓名查询该教师所教课程名、学生人数、平均成
--绩、最高成绩、最低成绩。
go
create function t_sc_fun (@tname_input char(10))
returns  table
as 
	return (select cname as 课程名,count(sno) as 学生人数,avg(score) as 平均成绩,max(score)  as 最高成绩,min(score) as 最低成绩
			from teacher,tc,course,sc
			where @tname_input=teacher.tname and teacher.tno=tc.tno
					and course.cno=tc.cno and sc.cno=tc.cno
			group by cname)
go
declare @tname_in char(10)
select * from t_sc_fun ('李英')
go
--5.创建一个函数。要求:统计各系各职称的总人数、男女人数、平均年龄
go
create function teacher_prof_fun (@prof_in char(10))
returns  table
as 
	return(
	select prof 职称,count(tno) 总人数,
		   男人数=(select count(*) as man from teacher where @prof_in=prof and sex='男' group by prof),
		   女人数=(select count(*) as female from teacher where @prof_in=prof and sex='女' group by prof),
		   avg(age) as 平均年龄
	from teacher
	where @prof_in=teacher.prof 
	group by prof
	)
go
select * from teacher_prof_fun ('讲师')
go