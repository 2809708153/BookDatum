use jiaoxuedb


--1.��1+2+3ʮ��+100���ܺ͡�
declare @sum int,@i int
set @i=1 set @sum=0
while(@i<=100)
	begin
		set @sum=@sum+@i
		set @i=@i+1
	end
print str(@sum)
--2.�������������n����n��
declare @fab int,@k int,@n int
set @k=1 set @fab=1 set @n=8   --�û�����
while(@k<=@n)
	begin
		set @fab=@fab*@k
		set @k=@k+1
	end
print str(@fab)
--3.��ѯ��ϵ�Ľ�ʦ������ѧ������,����ѧ�������ͽ�ʦ�����������С�
select s.dept,count(distinct tno) "��ʦ��",count(distinct sno) "ѧ����"
from teacher t 
full join student s on s.dept=t.dept
group by s.dept
order by "��ʦ��","ѧ����"
--4.��ѯ����ѧ�����������ڸ�ϵ�������ֲ��Լ�ÿ���˵��������Ա�����
select count(sno) as ����ѧ������ from student where sname like '��%'
select sname ����,sex �Ա�,age ���� from student where sname like '��%'
select dept as Ժϵ����,count(sno) as ���� from  student 
where  sname like '��%'  
group  by  Dept
--5.��ѯѧ�������������֡����������ֲ���ϵ,�������������������С� 
select  
    sname ��������,duplicate_count ����,STRING_AGG(dept, ', ') ���ֲ���ϵ   
FROM   
    (select  
        sname,dept,count(*) over (partition by sname) duplicate_count  
		from student) t
where duplicate_count > 1   
group by sname, duplicate_count  
order by duplicate_count desc
--6.��ѯѧ�š��������γ����ơ����Գɼ���ƽ���֡���߷֡���ͷ�
select student.sno ѧ��,sname ����,cname �γ�����,score ���Գɼ�,t.ƽ���ɼ�,t.��߳ɼ�,t.��ͳɼ�
from student,course,sc,
(select sno,avg(score) ƽ���ɼ�,max(score) ��߳ɼ�,min(score) ��ͳɼ� 
from sc group by sno) t
where student.sno=sc.sno and student.sno=t.sno and course.cno=sc.cno


