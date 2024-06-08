use jiaoxuedb


--1.��T-SQL��䴴��һ�û��������������AgeType��Ҫ��:ϵͳ��������Ϊ
--tinyint,��Ϊ��,ȡֵ��ΧΪ0~100,����ѧ����ͽ�ʦ���е������ֶκ�ѡ�α��гɼ�
--�ֶε��������͡�
use jiaoxuedb
go
exec sp_addtype agetype,'tinyint','null'
go
create rule ru_agetype as @agetype between 0 and 100
go
exec sp_bindrule 'ru_agetype','agetype'
--2.����ʽ������������NameType��Ҫ��:ϵͳ��������Ϊvarchar,����Ϊ10��
--��,��Ϊ��,���ڽ�ʦ����ѧ������ְ���ֶε��������͡�
exec sp_addtype nametype,'varchar (10)','not null'
go
--3.����һ��������Ҫ��:����ѧ�������Ϳγ�����ѯ�����ÿγ̵ĳɼ���
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
set @atemp=dbo.score_fun('�ű�','���������')
print str(@atemp)
--4.����һ��������Ҫ��:���ݽ�ʦ������ѯ�ý�ʦ���̿γ�����ѧ��������ƽ����
--������߳ɼ�����ͳɼ���
go
create function t_sc_fun (@tname_input char(10))
returns  table
as 
	return (select cname as �γ���,count(sno) as ѧ������,avg(score) as ƽ���ɼ�,max(score)  as ��߳ɼ�,min(score) as ��ͳɼ�
			from teacher,tc,course,sc
			where @tname_input=teacher.tname and teacher.tno=tc.tno
					and course.cno=tc.cno and sc.cno=tc.cno
			group by cname)
go
declare @tname_in char(10)
select * from t_sc_fun ('��Ӣ')
go
--5.����һ��������Ҫ��:ͳ�Ƹ�ϵ��ְ�Ƶ�����������Ů������ƽ������
go
create function teacher_prof_fun (@prof_in char(10))
returns  table
as 
	return(
	select prof ְ��,count(tno) ������,
		   ������=(select count(*) as man from teacher where @prof_in=prof and sex='��' group by prof),
		   Ů����=(select count(*) as female from teacher where @prof_in=prof and sex='Ů' group by prof),
		   avg(age) as ƽ������
	from teacher
	where @prof_in=teacher.prof 
	group by prof
	)
go
select * from teacher_prof_fun ('��ʦ')
go