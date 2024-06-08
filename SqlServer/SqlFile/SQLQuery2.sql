

--创建Course表
CREATE TABLE Course(Cno CHAR(10),
 Cname VARCHAR(10),
 Chour TINYINT,
 Ccredit TINYINT )


 --创建SC表
CREATE TABLE SC(Sno CHAR(10),
 Cno CHAR(10),
 Score TINYINT )



 --创建TC表
CREATE TABLE TC(Tno CHAR(10),
 Cno CHAR(10) )



--Student表添加字段
ALTER TABLE Student
 ADD Rename TEXT NULL;

 ALTER TABLE Student
 ADD Native char(20) NULL;


 --修改Student表中Native字段
 ALTER TABLE Student
 ALTER COLUMN NATIVE CHAR(40) NULL


 --删除Student简历字段
alter table Student drop column Rename

--删除TC表
USE School
DROP TABLE TC
 GO

 use School
 insert into Course values('0007','计算机',80,60)