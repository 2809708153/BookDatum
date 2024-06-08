use jiaoxuedb

if exists  (select name from sysobjects where name='pro_sname' and type='p')
drop procedure pro_sname
go
--1������ѧ������ѯ����ѡ�޵Ŀγ������ɼ����ον�ʦ����
--�����洢����
create procedure pro_sname
	@sname_in char(10)
as select student.sname ѧ��,cname ѡ�޿γ�,score ����,tname ��ʦ
from student,sc,teacher,course,tc
where student.sname=@sname_in
	and sc.sno=student.sno 
	and sc.cno=course.cno 
	and sc.cno=tc.cno 
	and tc.cno=course.cno
	and tc.tno=teacher.tno
go
--ִ�д洢����
declare
	@sname_input char(10)
select @sname_input = '�ű�'
exec pro_sname @sname_input

if exists (select name from sysobjects where name='pro_age_max_min' and type='p')
drop procedure pro_age_max_min
go
--2����ѯĳϵ��ѧ��������������С���䡣
--�����洢����
create procedure pro_age_max_min
	@sdept_input char(10)
as select dept Ժϵ,max(age) as �������,min(age) as ��С����
from student where dept=@sdept_input group by dept
go
--ִ�д洢����
declare
	@sdept_in char(10)
select @sdept_in='�����'
exec pro_age_max_min @sdept_in

if exists (select name from sysobjects where name='pro_scorebysncn' and type='p')
drop procedure pro_scorebysncn
go
--3������ѧ�������Ϳγ������������γ̵ĳɼ���
--�����洢����
create procedure pro_scorebysncn  
    @sname_input char(10), @scname_input char(10)  
as 
select   
    s.sname ����, c.cname �γ���, sc.score ����  
from 
    student s  
join sc on s.sno = sc.sno  
join course c on sc.cno = c.cno  
where   
    s.sname = @sname_input and c.cname = @scname_input 
go
--ִ�д洢����
declare
	@sname_in char(10),
	@scname_in char(10)
select @sname_in='��ƽ��'
select @scname_in='�������'
exec pro_scorebysncn @sname_in,@scname_in

if exists (select name from sysobjects where name='pro_prof_count' and type='p')
drop procedure pro_prof_count
go
--4������ְ�Ʋ�ѯ�������������������ڡ���������
--�����洢����
create procedure pro_prof_count
	@prof_input char(10)
as select prof ְ��,count(prof) ����
from teacher
where prof=@prof_input
group by prof
go
--ִ�д洢����
declare
	@prof_in char(10)
select @prof_in='����'
exec pro_prof_count @prof_in  

if exists (select name from sysobjects where name='pro_dept_analyze' and type='p')
drop procedure pro_dept_analyze
go
--5��ͳ��ĳϵĳְ�Ƶ�����ƽ�����䡢ƽ��������߹��ʡ�
--�����洢����
create procedure pro_dept_analyze
	@dept_input char(10),
	@prof_input char(10)
as select dept Ժϵ,prof ְ��,
		count(*) ����,avg(age) ƽ������,avg(sal) ƽ������,max(sal) ��߹���
from teacher
where dept=@dept_input and prof=@prof_input
group by dept,prof
go
--ִ�д洢����
declare
	@dept_input char(10),
	@prof_input char(10)
select @dept_input='�����'
select @prof_input='����'
exec pro_dept_analyze @dept_input,@prof_input

if exists (select name from sysobjects where name='pro_dept_count' and type='p')
drop procedure pro_dept_count
go
--6����ѯĳϵ�Ľ�ʦ������ƽ�������ѧ��������
--�����洢����
create procedure pro_dept_count
	@dept_in char(10)
as 
select dept Ժϵ,count(teacher.dept) ��ʦ����,avg(age) ��ʦƽ������ 
into #t1
from teacher
where teacher.dept=@dept_in
group by dept
select dept Ժϵ,count(student.dept) ѧ������
into #t2
from student
where dept=@dept_in
group by dept
select #t1.Ժϵ Ժϵ,��ʦ����,��ʦƽ������,ѧ������
from #t1,#t2
where #t1.Ժϵ=#t2.Ժϵ
go
--ִ�д洢����
declare
	@dept_in char(10)
select @dept_in='�����'
exec pro_dept_count @dept_in

if exists (select name from sysobjects where name='pro_cname' and type='p')
drop procedure pro_cname
go
--7�����ÿγ�����ѯѡ�޸ÿγ̵�ѧ��������ϵ�𡢳ɼ�����������������ơ��γ̵ĸò�ѯ��Ϣ��
--�����洢����
create procedure pro_cname
	@cname char(10)
as select sname ѧ������,dept ϵ��,cname �γ���,score �ɼ�
from student,sc,course
where cname=@cname and sc.cno=course.cno and sc.sno=student.sno
go
--ִ�д洢����
declare
	@cname char(10)
select @cname='�������'
exec pro_cname @cname

if exists (select name from sysobjects where name='pro_tname_cname' and type='p')
drop procedure pro_tname_cname
go
--8�����ý�ʦ�����Ϳγ��������ý�ʦ���οεĿγ�������ʱ����ѡ��������ƽ���ɼ�����߳ɼ�������ѯ��ʦ����ѩ���ġ�΢��ԭ���γ̵������¼��
--�����洢����
create procedure pro_tname_cname  
    @tname char(10), @cname char(10)  
as 
select 
    t.tname ��ʦ����,c.cname �γ�����,c.chour ��ʱ��,  
    COUNT(DISTINCT sc.sno) ѡ������,isnull(AVG(sc.score),0) ƽ���ɼ�  
from teacher t  
join tc ON t.tno = tc.tno -- ����tc��teacher_course�ı���  
join course c on tc.cno = c.cno  
left join sc on c.cno = sc.cno -- ʹ��LEFT JOIN������û��ѡ�μ�¼�Ŀγ�  
where t.tname = @tname AND c.cname = @cname  
group by t.tname, c.cname , c.chour
go
--ִ�д洢����
declare
	@tname char(10),
	@cname char(10)
select @tname='��ѩ'
select @cname='΢��ԭ��'
exec pro_tname_cname @tname,@cname
go
declare
	@tname char(10),
	@cname char(10)
select @tname='��ѩ'
select @cname='�������'
exec pro_tname_cname @tname,@cname

--9��ɾ�������1�ⴴ���Ĵ洢���̡�
drop procedure pro_sname

--10��ɾ�������3��4�ⴴ���Ĵ洢���̡�
drop procedure pro_scorebysncn 
drop procedure pro_prof_count


select 
    t.tname ��ʦ����,c.cname �γ�����,c.chour ��ʱ��,  
    COUNT(DISTINCT sc.sno) ѡ������, isnull(AVG(sc.score),0) ƽ���ɼ�  
from teacher t  
join tc ON t.tno = tc.tno -- ����tc��teacher_course�ı���  
join course c on tc.cno = c.cno  
left join sc on c.cno = sc.cno -- ʹ��LEFT JOIN������û��ѡ�μ�¼�Ŀγ�  
group by t.tname, c.cname , c.chour