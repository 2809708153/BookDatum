--¼��SC��
USE School
INSERT INTO SC VALUES('S3','C2',70)
INSERT INTO SC VALUES('S3','C4',85)
INSERT INTO SC VALUES('S4','C2',85)
INSERT INTO SC VALUES('S4','C3',83)
INSERT INTO SC VALUES('S5','C2',89)

--�����ϵ����+1
select * from Student

UPDATE Student SET Age=Age+1 WHERE Dept='�����'
select * from Student

--�������makeup_s
 SELECT Sno,Cno,Score INTO makeup_s FROM SC where Score<60
 GO

 --ɾ��makeup_s��ѧ��
 delete from makeup_s where Score<50
 select * from makeup_s