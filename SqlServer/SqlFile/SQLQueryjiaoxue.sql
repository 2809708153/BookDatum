use jiaoxuedb

--1、查询选修4门以上课程的学生总成绩(不统计不及格的课程)，并要求按总成绩的降序排列出来。
select
	sname as 姓名,sum(score) as 总分,count(cno) as 科目数
from sc
full outer join
	student on student.sno = sc.sno
where
	score >= 60
group by
	sc.sno,sname
having 
	count(cno) >= 2
--2、统计选课人数超过3人的课程的学生选修人数，要求输出课程号和选修人数，查询结果按人数降序排列，若人	数相同，按课程号升序排列。
select
	course.cname as 课程名,count(sno) as 选课人数
from sc
join
	course on course.cno = sc.cno
group by
	sc.cno,course.cname
having 
	count(sno) > 3
--3、查询所有学生以及所有课程的选课情况。
select
	student.*,sc.*,course.*
from student
full outer join
	sc on student.sno = sc.sno
full outer join
	course on sc.cno = course.cno
--4、请查询选修了1号课程且名次为6到10的同学的学号。
select
	top 3 sname as 姓名,cname as 课程名,score as 分数
from (
	select top 4 *
	from sc where cno='01001'
	order by score desc
) temp
join
	student on student.sno = temp.sno
join 
	course on course.cno = temp.cno
order by 
	temp.score


--根据临时成绩表输出结果
select rank() over(partition by 姓名 order by 成绩 desc) as 序号,
	姓名,课号,成绩
from temp

--建立存储表并输出对应结果
create table t1 (
	pno char(10) not null,
	pnumber int not null)
create table t2 (
	pno char(10) not null,
	pnumber int not null)
create table t3 (
	pno char(10) not null,
	pnumber int not null)

insert into t1 values('1',100)
insert into t1 values('3',500)
insert into t1 values('4',800)
insert into t2 values('1',100)
insert into t2 values('1',80)
insert into t2 values('2',800)
insert into t3 values('2',100)
insert into t3 values('3',100)
insert into t3 values('3',200)




SELECT       
    all_ids.pno AS 产品编号,      
    COALESCE(b.pnumber, 0) AS 期初数量,      
    COALESCE(SUM(i.pnumber), 0) AS 入库数量,      
    COALESCE(SUM(o.pnumber), 0) AS 出库数量,      
    (COALESCE(b.pnumber, 0) + COALESCE(SUM(i.pnumber), 0) - COALESCE(SUM(o.pnumber), 0)) AS 结存数量      
FROM       
    (SELECT DISTINCT pno FROM t1    
     UNION  		     
     SELECT DISTINCT pno FROM t2    
     UNION  		     
     SELECT DISTINCT pno FROM t3) AS all_ids      
LEFT JOIN       
    t1 b ON all_ids.pno = b.pno      
LEFT JOIN       
    (SELECT pno, SUM(pnumber) AS pnumber FROM t2 GROUP BY pno) i ON all_ids.pno = i.pno      
LEFT JOIN       
    (SELECT pno, SUM(pnumber) AS pnumber FROM t3 GROUP BY pno) o ON all_ids.pno = o.pno      
GROUP BY       
    all_ids.pno, b.pnumber
order by
	all_ids.pno


SELECT no as 产品编号,
       SUM(s1) AS 期初数量,
       SUM(s2) AS 入库数量,
       SUM(s3) AS 出库数量,
       SUM(s1 + s2 - s3) AS 结存数量
FROM (
    SELECT pno AS no, pnumber AS s1, 0 AS s2, 0 AS s3
    FROM t1
    UNION ALL
    SELECT pno, 0, pnumber, 0
    FROM t2
    UNION ALL
    SELECT pno, 0, 0, pnumber
    FROM t3
) AS subquery
GROUP BY no
ORDER BY no