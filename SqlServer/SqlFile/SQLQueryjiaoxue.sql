use jiaoxuedb

--1����ѯѡ��4�����Ͽγ̵�ѧ���ܳɼ�(��ͳ�Ʋ�����Ŀγ�)����Ҫ���ܳɼ��Ľ������г�����
select
	sname as ����,sum(score) as �ܷ�,count(cno) as ��Ŀ��
from sc
full outer join
	student on student.sno = sc.sno
where
	score >= 60
group by
	sc.sno,sname
having 
	count(cno) >= 2
--2��ͳ��ѡ����������3�˵Ŀγ̵�ѧ��ѡ��������Ҫ������γ̺ź�ѡ����������ѯ����������������У�����	����ͬ�����γ̺��������С�
select
	course.cname as �γ���,count(sno) as ѡ������
from sc
join
	course on course.cno = sc.cno
group by
	sc.cno,course.cname
having 
	count(sno) > 3
--3����ѯ����ѧ���Լ����пγ̵�ѡ�������
select
	student.*,sc.*,course.*
from student
full outer join
	sc on student.sno = sc.sno
full outer join
	course on sc.cno = course.cno
--4�����ѯѡ����1�ſγ�������Ϊ6��10��ͬѧ��ѧ�š�
select
	top 3 sname as ����,cname as �γ���,score as ����
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


--������ʱ�ɼ���������
select rank() over(partition by ���� order by �ɼ� desc) as ���,
	����,�κ�,�ɼ�
from temp

--�����洢�������Ӧ���
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
    all_ids.pno AS ��Ʒ���,      
    COALESCE(b.pnumber, 0) AS �ڳ�����,      
    COALESCE(SUM(i.pnumber), 0) AS �������,      
    COALESCE(SUM(o.pnumber), 0) AS ��������,      
    (COALESCE(b.pnumber, 0) + COALESCE(SUM(i.pnumber), 0) - COALESCE(SUM(o.pnumber), 0)) AS �������      
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


SELECT no as ��Ʒ���,
       SUM(s1) AS �ڳ�����,
       SUM(s2) AS �������,
       SUM(s3) AS ��������,
       SUM(s1 + s2 - s3) AS �������
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