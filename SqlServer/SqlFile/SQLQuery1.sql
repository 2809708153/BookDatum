--录入SC表
USE School
INSERT INTO SC VALUES('S3','C2',70)
INSERT INTO SC VALUES('S3','C4',85)
INSERT INTO SC VALUES('S4','C2',85)
INSERT INTO SC VALUES('S4','C3',83)
INSERT INTO SC VALUES('S5','C2',89)

--计算机系年龄+1
select * from Student

UPDATE Student SET Age=Age+1 WHERE Dept='计算机'
select * from Student

--不及格表makeup_s
 SELECT Sno,Cno,Score INTO makeup_s FROM SC where Score<60
 GO

 --删除makeup_s表学生
 delete from makeup_s where Score<50
 select * from makeup_s