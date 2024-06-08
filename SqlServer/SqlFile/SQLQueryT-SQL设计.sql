use jiaoxuedb


--1.求1+2+3十…+100的总和。
declare @sum int,@i int
set @i=1 set @sum=0
while(@i<=100)
	begin
		set @sum=@sum+@i
		set @i=@i+1
	end
print str(@sum)
--2.根据输入的整数n，求n！
declare @fab int,@k int,@n int
set @k=1 set @fab=1 set @n=8   --用户输入
while(@k<=@n)
	begin
		set @fab=@fab*@k
		set @k=@k+1
	end
print str(@fab)
--3.查询各系的教师人数、学生人数,并按学生人数和教师人数升序排列。
select s.dept,count(distinct tno) "教师数",count(distinct sno) "学生数"
from teacher t 
full join student s on s.dept=t.dept
group by s.dept
order by "教师数","学生数"
--4.查询王姓学生的总数、在各系的人数分布以及每个人的姓名、性别、年龄
select count(sno) as 王姓学生总数 from student where sname like '王%'
select sname 姓名,sex 性别,age 年龄 from student where sname like '王%'
select dept as 院系名称,count(sno) as 人数 from  student 
where  sname like '王%'  
group  by  Dept
--5.查询学生中重名的名字、人数和所分布的系,并按重名人数降序排列。 
select  
    sname 重名名字,duplicate_count 人数,STRING_AGG(dept, ', ') 所分布的系   
FROM   
    (select  
        sname,dept,count(*) over (partition by sname) duplicate_count  
		from student) t
where duplicate_count > 1   
group by sname, duplicate_count  
order by duplicate_count desc
--6.查询学号、姓名、课程名称、考试成绩、平均分、最高分、最低分
select student.sno 学号,sname 姓名,cname 课程名称,score 考试成绩,t.平均成绩,t.最高成绩,t.最低成绩
from student,course,sc,
(select sno,avg(score) 平均成绩,max(score) 最高成绩,min(score) 最低成绩 
from sc group by sno) t
where student.sno=sc.sno and student.sno=t.sno and course.cno=sc.cno


