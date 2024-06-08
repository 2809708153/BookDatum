use CarRepairSystem

DROP TABLE IF EXISTS admin_table
----######admin��
CREATE TABLE admin_table (   
  adminId int,
  name varchar(20),
  realName varchar(20),
  password varchar(20)
) 
insert into admin_table values(2024001,'admin','������','123456')
insert into admin_table values(2024002,'admin2','��Ůʿ','123456')
----



DROP TABLE IF EXISTS employee_table
----employee
CREATE TABLE employee_table (   
  empId int,
  name varchar(20),
  realName varchar(20),
  password varchar(20),
  sex tinyint,
  telephone char(11),
  profession varchar(10),
  birthday date,
  createTime datetime,
  updateTime datetime
) 

INSERT INTO employee_table  VALUES (2024001,'2024001' ,'С��', '123456',0, '13800138001','ά��Ա', '2003-07-01','2023-07-01 00:00:00','2023-07-01 00:00:00');   
INSERT INTO employee_table  VALUES (2024002,'2024002' ,'С��', '123456',1, '13912345678','ά��Ա', '2004-03-01','2023-12-14 00:00:00','2023-12-14 00:00:00');    
INSERT INTO employee_table  VALUES (2024003,'2024003' ,'С��', '123456',0, '15987654321','ά��Ա', '2003-12-13','2023-07-13 00:00:00','2023-07-13 00:00:00');   
INSERT INTO employee_table  VALUES (2024004,'2024004' ,'С��', '123456',1, '18612345678','�ɹ�Ա', '2000-07-01','2023-06-01 00:00:00','2023-06-01 00:00:00');    
INSERT INTO employee_table  VALUES (2024005,'2024005' ,'С��', '123456',0, '13798765432','�ɹ�Ա', '2004-10-01','2024-03-01 00:00:00','2024-03-01 00:00:00');



DROP TABLE IF EXISTS user_table
----user
CREATE TABLE user_table (   
  userId int,
  name varchar(20),
  realName varchar(20),
  password varchar(20),
  sex tinyint,
  telephone char(11),
  balance money,        --���
  birthday date,
  createTime datetime,
  updateTime datetime
) 

INSERT INTO user_table  VALUES (2024001,'2024001' ,'С��', '123456',0, '13800138001',1000, '2003-07-01','2023-07-01 00:00:00','2023-07-01 00:00:00');   
INSERT INTO user_table  VALUES (2024002,'2024002' ,'С��', '123456',1, '13912345678',2000, '2004-03-01','2023-12-14 00:00:00','2023-12-14 00:00:00');    
INSERT INTO user_table  VALUES (2024003,'2024003' ,'С��', '123456',0, '15987654321',3450, '2003-12-13','2023-07-13 00:00:00','2023-07-13 00:00:00');   
INSERT INTO user_table  VALUES (2024004,'2024004' ,'С��', '123456',1, '18612345678',1000, '2000-07-01','2023-06-01 00:00:00','2023-06-01 00:00:00');    
INSERT INTO user_table  VALUES (2024005,'2024005' ,'С��', '123456',0, '13798765432', 200, '2004-10-01','2024-03-01 00:00:00','2024-03-01 00:00:00');


DROP TABLE IF EXISTS carbrand_table
--car
create table  carbrand_table (
  brandId int,
  name varchar(20),
  content varchar(200),
  logo varchar(40),
  createTime datetime,
  updateTime datetime
)

INSERT INTO carbrand_table  VALUES (2024001, 'BMW', '�¹���������Ʒ��',                'bmw_logo.png', '2024-01-01 00:00:00', '2024-01-01 00:00:00');  
INSERT INTO carbrand_table  VALUES (2024002, 'Mercedes-Benz', '�¹���������Ʒ��', 'mercedes_logo.png', '2024-02-01 00:00:00', '2024-02-01 00:00:00');  
INSERT INTO carbrand_table  VALUES (2024003, 'Audi', '�¹�����������',                'audi_logo.png', '2024-03-01 00:00:00', '2024-03-01 00:00:00');  
INSERT INTO carbrand_table  VALUES (2024004, 'Toyota', '�ձ�����������',            'toyota_logo.png', '2024-04-01 00:00:00', '2024-04-01 00:00:00');  
INSERT INTO carbrand_table  VALUES (2024005, 'Honda', '�ձ�����������',              'honda_logo.png', '2024-05-01 00:00:00', '2024-05-01 00:00:00');  



DROP TABLE IF EXISTS carseries_table
create table carseries_table (
  seriesId int,
  brandId int,
  name varchar(20),
  content varchar(200),
  createTime datetime,
  updateTime datetime
)


INSERT INTO carseries_table  VALUES (2024001, 2024001, '3 Series',        'BMW 3ϵ�н���', '2024-01-01 00:00:00', '2024-01-01 00:00:00');   
INSERT INTO carseries_table  VALUES (2024002, 2024001, '5 Series',        'BMW 5ϵ�н���', '2024-02-01 00:00:00', '2024-02-01 00:00:00');  
INSERT INTO carseries_table  VALUES (2024003, 2024002, 'S-Class', 'Mercedes-Benz S������', '2024-03-01 00:00:00', '2024-03-01 00:00:00');  
INSERT INTO carseries_table  VALUES (2024004, 2024003, 'A4',            'Audi A4ϵ�н���', '2024-04-01 00:00:00', '2024-04-01 00:00:00');  
INSERT INTO carseries_table  VALUES (2024005, 2024004, 'Camry',    'Toyota Camryϵ�н���', '2024-05-01 00:00:00', '2024-05-01 00:00:00');  
  

DROP TABLE IF EXISTS cartype_table
create table cartype_table (
  typeId int,
  seriesId int,
  name varchar(20),
  price money,
  createTime datetime,
  updateTime datetime
)

INSERT INTO cartype_table  VALUES (2024001, 2024001, '320i',     35000.00, '2024-01-01 00:00:00', '2024-01-01 00:00:00');    
INSERT INTO cartype_table  VALUES (2024002, 2024001, '330i',     40000.00, '2024-02-01 00:00:00', '2024-02-01 00:00:00');    
INSERT INTO cartype_table  VALUES (2024003, 2024002, '520i',     45000.00, '2024-03-01 00:00:00', '2024-03-01 00:00:00');  
INSERT INTO cartype_table  VALUES (2024004, 2024003, 'S350',     90000.00, '2024-04-01 00:00:00', '2024-04-01 00:00:00');    
INSERT INTO cartype_table  VALUES (2024005, 2024004, 'A4 Avant', 38000.00, '2024-05-01 00:00:00', '2024-05-01 00:00:00');  


--repair
DROP TABLE IF EXISTS repair_table
create table repair_table (
  repId int,
  empId int,
  userId int,
  carId int,
  partId int,   --����Ҫ�����Ϊ0
  content varchar(200),
  cost money,
  status tinyint,   --ά��״̬��0������1ά���У�2����ɣ�3��ȡ��
  remark varchar(100),      --��ע��û��Ϊ"--"
  createTime datetime,
  updateTime datetime
)

INSERT INTO repair_table  VALUES (2024001, 2024001, 2024001, 2024001,       0,   '������',  50.00, 2,               '--', '2024-01-01 09:00:00', '2024-01-01 10:00:00');  
INSERT INTO repair_table  VALUES (2024002, 2024001, 2024002, 2024002, 2024001, '����ɲ��Ƭ', 200.00, 1,   '�ͻ���ȷ�ϸ���', '2024-01-02 10:30:00', '2024-01-02 12:00:00');    
INSERT INTO repair_table  VALUES (2024003, 2024001, 2024003, 2024003,       0,   '�������',   0.00, 0,               '--', '2024-01-10 14:00:00', '2024-01-10 14:00:00');  
INSERT INTO repair_table  VALUES (2024004, 2024002, 2024004, 2024004, 2024002,   '������̥', 400.00, 2, '��ʹ����������̥', '2024-02-11 08:30:00', '2024-02-11 10:00:00');  
INSERT INTO repair_table  VALUES (2024005, 2024003, 2024005, 2024005, 2024006,   '�������', 150.00, 1,     '�ȴ��������', '2024-03-19 11:00:00', '2024-03-19 12:00:00');  
INSERT INTO repair_table  VALUES (2024006, 2024003, 2024001, 2024001,       0,   '������ϴ',  30.00, 3,         '�ͻ�ȡ��', '2024-05-20 13:30:00', '2024-05-20 13:35:00');


--usercar
DROP TABLE IF EXISTS usercar_table
create table usercar_table (
  usercarId int,
  userId int,
  carName varchar(20),
  carNo char(10),
  typeName varchar(20),    ----"�γ�" : "SUV"
  content varchar(200),
  createTime datetime,
  updateTime datetime
)

INSERT INTO usercar_table   VALUES (2024001, 2024001,    '���￨����', '��A12345', '�����ͽγ�', 'ԤԼ���г������', '2024-01-01 09:00:00', '2024-01-01 09:00:00');   
INSERT INTO usercar_table   VALUES (2024002, 2024002,        '����X5', '��B67890',  '������SUV',     'ԤԼ������̥', '2024-01-05 14:30:00', '2024-01-05 14:30:00');  
INSERT INTO usercar_table   VALUES (2024003, 2024001, '��˹��Model 3', '��C23456',     '�綯��', 'ԤԼ�����������', '2024-04-10 10:00:00', '2024-04-10 10:00:00');  
INSERT INTO usercar_table   VALUES (2024004, 2024003,       '�µ�A6L', '��D76543', '�����ͽγ�', 'ԤԼ�����������', '2024-03-15 13:30:00', '2024-03-15 13:30:00');  
INSERT INTO usercar_table   VALUES (2024005, 2024004,      '·����ʤ', '��E87654',  'ԽҰ��SUV', 'ԤԼ���е��̼��', '2024-05-20 11:00:00', '2024-05-20 11:00:00');

--part
DROP TABLE IF EXISTS part_table
create table part_table(
  partId int,
  name varchar(20),
  number int,
  price money,
  content varchar(200),
  createTime datetime,
  updateTime datetime
)

INSERT INTO part_table  VALUES (2024001, 'ɲ��Ƭ',    10, 50.00,       '������ɲ��Ƭ', '2024-01-01 09:00:00', '2024-01-01 09:00:00');    
INSERT INTO part_table  VALUES (2024002, '��̥',       4, 200.00,      '�ļ�ͨ����̥', '2024-01-02 10:30:00', '2024-01-02 10:30:00');   
INSERT INTO part_table  VALUES (2024003, '����������', 5, 30.00,         'ȫ�ϳɻ���', '2024-01-10 14:00:00', '2024-01-10 14:00:00');  
INSERT INTO part_table  VALUES (2024004, '����������', 2, 40.00, '��Ч���˿���������', '2024-01-11 08:30:00', '2024-01-11 08:30:00');    
INSERT INTO part_table  VALUES (2024005, '����',     4, 80.00,       '����������', '2024-01-19 11:00:00', '2024-01-19 11:00:00');  
INSERT INTO part_table  VALUES (2024006, '���',       1, 150.00,    '�������������', '2024-01-20 13:30:00', '2024-01-20 13:30:00');

DROP TABLE IF EXISTS partinput_table
create table partinput_table(
  partInputId int,
  partId int,
  empId int,
  number int,
  price money,
  content varchar(200),
  createTime datetime,
  updateTime datetime
)

INSERT INTO partinput_table  VALUES (2024001, 2024001, 2024004,  5,   50.00,   '�µ���ɲ��Ƭ', '2024-01-01 09:00:00', '2024-01-01 09:00:00');  
INSERT INTO partinput_table  VALUES (2024002, 2024002, 2024004,  3,  200.00,     '����̥���', '2024-01-02 10:30:00', '2024-01-02 10:30:00');  
INSERT INTO partinput_table  VALUES (2024003, 2024003, 2024004, 10,   30.00,   '���Ͳ�����', '2024-01-05 14:00:00', '2024-01-05 14:00:00');  
INSERT INTO partinput_table  VALUES (2024004, 2024004, 2024005,  2,   40.00, '��������������', '2024-01-08 08:30:00', '2024-01-08 08:30:00');  
INSERT INTO partinput_table  VALUES (2024005, 2024006, 2024005,  1,  150.00,     '�µ�����', '2024-01-10 11:00:00', '2024-01-10 11:00:00');

DROP TABLE IF EXISTS partoutput_table
create table partoutput_table(
  partOutputId int,
  partId int,
  empId int,
  number int,
  price money,
  content varchar(200),
  createTime datetime,
  updateTime datetime
)

INSERT INTO partoutput_table VALUES (2024001, 2024001, 2024001, 2,  50.00,       'ɲ��Ƭ������ͻ�A', '2024-01-15 10:00:00', '2024-01-15 10:00:00');  
INSERT INTO partoutput_table VALUES (2024002, 2024002, 2024001, 1, 200.00,     '��̥�����ά�޳���B', '2024-01-16 13:30:00', '2024-01-16 13:30:00');  
INSERT INTO partoutput_table VALUES (2024003, 2024003, 2024002, 5,  30.00, '���ͳ��������C���и���', '2024-01-17 09:15:00', '2024-01-17 09:15:00');  
INSERT INTO partoutput_table VALUES (2024004, 2024004, 2024002, 1,  40.00,   '����������������ͻ�D', '2024-01-18 11:45:00', '2024-01-18 11:45:00');  
INSERT INTO partoutput_table VALUES (2024005, 2024006, 2024003, 1, 150.00, '��س��������E���и���', '2024-01-19 14:30:00', '2024-01-19 14:30:00');

