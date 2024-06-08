--��֪��ѡ�α�sc�Ϳγ̱�course�����пγ̱�����ѡ�������ֶΣ�xkrs��
--���д�������������ֱ�ʵ��
--�Ƚ�����ṹ
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
insert into c values('c1','�������',60,1,3)
insert into c values('c2','΢��ԭ��',80,2,3)
insert into c values('c3','�����߼�',60,3,1)
insert into c values('c4','���ݽṹ',80,4,1)
insert into c values('c5','���ݿ�',60,5,1)
insert into c values('c6','����ԭ��',60,6,1)
insert into c values('c7','����ϵͳ',60,7,1)

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
--�ٵ���sc������¼ʱ���ѿγ̱��ж�Ӧ�γ̵�ѡ�������ֶμ�1��
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




--�ڵ���sc��ɾ��һ����¼ʱ���ѿγ̱��ж�Ӧ�γ̵�ѡ�������ֶμ�1��
go
create trigger tri_delsc1
on sc for delete
as
declare @cno_pre char(10)
select @cno_pre=cno from deleted
update c set xkrs = xkrs - 1 where cno=@cno_pre
go 
--�۵��޸�sc����һ����¼�Ŀκţ�cno��ʱ���ѿγ̱��ж�Ӧ�γ̵�ѡ�������ֶμ�1����Ӧ�γ̵�ѡ�������ֶμ�1��
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
--���Ѵ�����ɾ��
if exists (select name from sysobjects where name='tri_sc_score' and type='tr')
drop trigger tri_sc_score
--1��Ϊ��sc����һ����������������޸�һ����¼ʱ��ȷ���˼�¼�ĳɼ���0~100֮�䡣
go
create trigger tri_sc_score
on sc for insert,update
as
declare @score_input tinyint
select @score_input=score from inserted
if @score_input < 0 or @score_input > 100
begin
	print '�ɼ�����0~100�����������룡'
	rollback transaction  --����ع�
end
go
--���Ѵ�����ɾ��
go
if exists (select name from sysobjects where name='tri_teacher_age' and type='tr')
drop trigger tri_teacher_age
--2��Ϊ��ʦ��t����һ����������ְ�����䲻�ܳ���60���꣬Ůְ��ְ���ǡ����ڡ������䲻�ܳ���60�꣬����Ůְ�����䲻�ܳ���55�ꡣ
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

if ( @sex_input = '��' and @age_input > 60 ) 
	or (@sex_input = 'Ů' and @prof_input = '����' and @age_input > 60)
	or (@sex_input = 'Ů' and @prof_input != '����' and @age_input > 55)
begin
	print '���䲻�Ϸ���'
	rollback transaction
end
go
--���Ѵ�����ɾ��
go
if exists (select name from sysobjects where name='del_course_sc_tc' and type='tr')
drop trigger del_course_sc_tc
go
if exists (select name from sysobjects where name='up_course_sc_tc' and type='tr')
drop trigger up_course_sc_tc
--3��Ϊ��c����tc�ͱ�sc�������������ԣ�����ɾ���ͼ����޸Ĵ�������
--����ɾ��
go
create trigger del_course_sc_tc
on course for delete
as
declare @cno_del char(10)
select @cno_del=cno from deleted
delete from sc where cno=@cno_del
delete from tc where cno=@cno_del
go
--��������
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
--��֤����ɾ��
delete from course where cno='c2'
go
--��֤��������
update course set cno='c0' where cno='c1'
go

--���Ѵ�����ɾ��
go
if exists (select name from sysobjects where name='up_teacher' and type='tr')
drop trigger up_teacher
--4��Ϊ��t����һ������������ְ�ƴӡ���ʦ������Ϊ�������ڡ�ʱ����λ�����Զ�����500Ԫ���ӡ������ڡ�����Ϊ�����ڡ�ʱ����λ�����Զ�����8900Ԫ��
go
create trigger up_teacher
on teacher for update
as
declare @prof_pre char(10) , @prof_p char(10) , @tno char(10)
select @prof_pre=prof from deleted
select @prof_p=prof from inserted
select @tno=tno from deleted
if @prof_pre='��ʦ' and @prof_p='������'
begin
	update teacher set comm = comm + 500 where tno=@tno
end
if @prof_pre='������' and @prof_p='����'
begin
	update teacher set comm = comm + 8900 where tno=@tno
end
go

--���Ѵ�����ɾ��
go
if exists (select name from sysobjects where name='update_sc_score_to_grade' and type='tr')
drop trigger update_sc_score_to_grade
--5��Ϊ��sc����һ�����������ɼ������ж�Ӧ��ϵ�ɷ���ת���ɵȼ�
go
ALTER TABLE sc ADD grade CHAR(10)
----1.С��60��������  2.60~70������ 3.70~80����  4.80~90����  5.90~100����
go
create trigger update_sc_score_to_grade
on sc for update,insert
as
declare @sno char(10), @score tinyint
select @sno=sno from inserted
select @score=score from inserted
if @score < 60 begin update sc set score='������' where sno=@sno end
if @score >= 60 and @score < 70 begin update sc set grade='����' where sno=@sno end
if @score >= 70 and @score < 80 begin update sc set grade='��' where sno=@sno end
if @score >= 80 and @score < 90 begin update sc set grade='��' where sno=@sno end
if @score >= 90 and @score < 100 begin update sc set grade='��' where sno=@sno end
go

UPDATE sc  
SET grade = CASE  
    WHEN score < 60 THEN '������'  
    WHEN score BETWEEN 60 AND 69 THEN '����'  
    WHEN score BETWEEN 70 AND 79 THEN '��'  
    WHEN score BETWEEN 80 AND 89 THEN '��'  
    WHEN score BETWEEN 90 AND 100 THEN '��'  
    ELSE grade -- ���score����������Χ�ڣ�����ԭ��grade���䣨��ѡ��  
END