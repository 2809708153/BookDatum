

--����Course��
CREATE TABLE Course(Cno CHAR(10),
 Cname VARCHAR(10),
 Chour TINYINT,
 Ccredit TINYINT )


 --����SC��
CREATE TABLE SC(Sno CHAR(10),
 Cno CHAR(10),
 Score TINYINT )



 --����TC��
CREATE TABLE TC(Tno CHAR(10),
 Cno CHAR(10) )



--Student������ֶ�
ALTER TABLE Student
 ADD Rename TEXT NULL;

 ALTER TABLE Student
 ADD Native char(20) NULL;


 --�޸�Student����Native�ֶ�
 ALTER TABLE Student
 ALTER COLUMN NATIVE CHAR(40) NULL


 --ɾ��Student�����ֶ�
alter table Student drop column Rename

--ɾ��TC��
USE School
DROP TABLE TC
 GO

 use School
 insert into Course values('0007','�����',80,60)