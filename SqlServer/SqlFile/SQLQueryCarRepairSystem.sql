use CarRepairSystem

DROP TABLE IF EXISTS admin_table
----######admin表
CREATE TABLE admin_table (   
  adminId int,
  name varchar(20),
  realName varchar(20),
  password varchar(20)
) 
insert into admin_table values(2024001,'admin','王先生','123456')
insert into admin_table values(2024002,'admin2','汪女士','123456')
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

INSERT INTO employee_table  VALUES (2024001,'2024001' ,'小张', '123456',0, '13800138001','维修员', '2003-07-01','2023-07-01 00:00:00','2023-07-01 00:00:00');   
INSERT INTO employee_table  VALUES (2024002,'2024002' ,'小李', '123456',1, '13912345678','维修员', '2004-03-01','2023-12-14 00:00:00','2023-12-14 00:00:00');    
INSERT INTO employee_table  VALUES (2024003,'2024003' ,'小王', '123456',0, '15987654321','维修员', '2003-12-13','2023-07-13 00:00:00','2023-07-13 00:00:00');   
INSERT INTO employee_table  VALUES (2024004,'2024004' ,'小赵', '123456',1, '18612345678','采购员', '2000-07-01','2023-06-01 00:00:00','2023-06-01 00:00:00');    
INSERT INTO employee_table  VALUES (2024005,'2024005' ,'小孙', '123456',0, '13798765432','采购员', '2004-10-01','2024-03-01 00:00:00','2024-03-01 00:00:00');



DROP TABLE IF EXISTS user_table
----user
CREATE TABLE user_table (   
  userId int,
  name varchar(20),
  realName varchar(20),
  password varchar(20),
  sex tinyint,
  telephone char(11),
  balance money,        --余额
  birthday date,
  createTime datetime,
  updateTime datetime
) 

INSERT INTO user_table  VALUES (2024001,'2024001' ,'小张', '123456',0, '13800138001',1000, '2003-07-01','2023-07-01 00:00:00','2023-07-01 00:00:00');   
INSERT INTO user_table  VALUES (2024002,'2024002' ,'小李', '123456',1, '13912345678',2000, '2004-03-01','2023-12-14 00:00:00','2023-12-14 00:00:00');    
INSERT INTO user_table  VALUES (2024003,'2024003' ,'小王', '123456',0, '15987654321',3450, '2003-12-13','2023-07-13 00:00:00','2023-07-13 00:00:00');   
INSERT INTO user_table  VALUES (2024004,'2024004' ,'小赵', '123456',1, '18612345678',1000, '2000-07-01','2023-06-01 00:00:00','2023-06-01 00:00:00');    
INSERT INTO user_table  VALUES (2024005,'2024005' ,'小孙', '123456',0, '13798765432', 200, '2004-10-01','2024-03-01 00:00:00','2024-03-01 00:00:00');


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

INSERT INTO carbrand_table  VALUES (2024001, 'BMW', '德国豪华汽车品牌',                'bmw_logo.png', '2024-01-01 00:00:00', '2024-01-01 00:00:00');  
INSERT INTO carbrand_table  VALUES (2024002, 'Mercedes-Benz', '德国豪华汽车品牌', 'mercedes_logo.png', '2024-02-01 00:00:00', '2024-02-01 00:00:00');  
INSERT INTO carbrand_table  VALUES (2024003, 'Audi', '德国汽车制造商',                'audi_logo.png', '2024-03-01 00:00:00', '2024-03-01 00:00:00');  
INSERT INTO carbrand_table  VALUES (2024004, 'Toyota', '日本汽车制造商',            'toyota_logo.png', '2024-04-01 00:00:00', '2024-04-01 00:00:00');  
INSERT INTO carbrand_table  VALUES (2024005, 'Honda', '日本汽车制造商',              'honda_logo.png', '2024-05-01 00:00:00', '2024-05-01 00:00:00');  



DROP TABLE IF EXISTS carseries_table
create table carseries_table (
  seriesId int,
  brandId int,
  name varchar(20),
  content varchar(200),
  createTime datetime,
  updateTime datetime
)


INSERT INTO carseries_table  VALUES (2024001, 2024001, '3 Series',        'BMW 3系列介绍', '2024-01-01 00:00:00', '2024-01-01 00:00:00');   
INSERT INTO carseries_table  VALUES (2024002, 2024001, '5 Series',        'BMW 5系列介绍', '2024-02-01 00:00:00', '2024-02-01 00:00:00');  
INSERT INTO carseries_table  VALUES (2024003, 2024002, 'S-Class', 'Mercedes-Benz S级介绍', '2024-03-01 00:00:00', '2024-03-01 00:00:00');  
INSERT INTO carseries_table  VALUES (2024004, 2024003, 'A4',            'Audi A4系列介绍', '2024-04-01 00:00:00', '2024-04-01 00:00:00');  
INSERT INTO carseries_table  VALUES (2024005, 2024004, 'Camry',    'Toyota Camry系列介绍', '2024-05-01 00:00:00', '2024-05-01 00:00:00');  
  

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
  partId int,   --不需要配件则为0
  content varchar(200),
  cost money,
  status tinyint,   --维修状态：0待处理，1维修中，2已完成，3已取消
  remark varchar(100),      --备注：没有为"--"
  createTime datetime,
  updateTime datetime
)

INSERT INTO repair_table  VALUES (2024001, 2024001, 2024001, 2024001,       0,   '常规检查',  50.00, 2,               '--', '2024-01-01 09:00:00', '2024-01-01 10:00:00');  
INSERT INTO repair_table  VALUES (2024002, 2024001, 2024002, 2024002, 2024001, '更换刹车片', 200.00, 1,   '客户已确认更换', '2024-01-02 10:30:00', '2024-01-02 12:00:00');    
INSERT INTO repair_table  VALUES (2024003, 2024001, 2024003, 2024003,       0,   '车辆检查',   0.00, 0,               '--', '2024-01-10 14:00:00', '2024-01-10 14:00:00');  
INSERT INTO repair_table  VALUES (2024004, 2024002, 2024004, 2024004, 2024002,   '更换轮胎', 400.00, 2, '已使用米其林轮胎', '2024-02-11 08:30:00', '2024-02-11 10:00:00');  
INSERT INTO repair_table  VALUES (2024005, 2024003, 2024005, 2024005, 2024006,   '更换电池', 150.00, 1,     '等待配件到货', '2024-03-19 11:00:00', '2024-03-19 12:00:00');  
INSERT INTO repair_table  VALUES (2024006, 2024003, 2024001, 2024001,       0,   '车辆清洗',  30.00, 3,         '客户取消', '2024-05-20 13:30:00', '2024-05-20 13:35:00');


--usercar
DROP TABLE IF EXISTS usercar_table
create table usercar_table (
  usercarId int,
  userId int,
  carName varchar(20),
  carNo char(10),
  typeName varchar(20),    ----"轿车" : "SUV"
  content varchar(200),
  createTime datetime,
  updateTime datetime
)

INSERT INTO usercar_table   VALUES (2024001, 2024001,    '丰田卡罗拉', '渝A12345', '经济型轿车', '预约进行车辆检查', '2024-01-01 09:00:00', '2024-01-01 09:00:00');   
INSERT INTO usercar_table   VALUES (2024002, 2024002,        '宝马X5', '沪B67890',  '豪华型SUV',     '预约更换轮胎', '2024-01-05 14:30:00', '2024-01-05 14:30:00');  
INSERT INTO usercar_table   VALUES (2024003, 2024001, '特斯拉Model 3', '粤C23456',     '电动车', '预约进行软件升级', '2024-04-10 10:00:00', '2024-04-10 10:00:00');  
INSERT INTO usercar_table   VALUES (2024004, 2024003,       '奥迪A6L', '津D76543', '商务型轿车', '预约进行内饰清洁', '2024-03-15 13:30:00', '2024-03-15 13:30:00');  
INSERT INTO usercar_table   VALUES (2024005, 2024004,      '路虎揽胜', '浙E87654',  '越野型SUV', '预约进行底盘检查', '2024-05-20 11:00:00', '2024-05-20 11:00:00');

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

INSERT INTO part_table  VALUES (2024001, '刹车片',    10, 50.00,       '高性能刹车片', '2024-01-01 09:00:00', '2024-01-01 09:00:00');    
INSERT INTO part_table  VALUES (2024002, '轮胎',       4, 200.00,      '四季通用轮胎', '2024-01-02 10:30:00', '2024-01-02 10:30:00');   
INSERT INTO part_table  VALUES (2024003, '发动机机油', 5, 30.00,         '全合成机油', '2024-01-10 14:00:00', '2024-01-10 14:00:00');  
INSERT INTO part_table  VALUES (2024004, '空气滤清器', 2, 40.00, '高效过滤空气滤清器', '2024-01-11 08:30:00', '2024-01-11 08:30:00');    
INSERT INTO part_table  VALUES (2024005, '火花塞',     4, 80.00,       '长寿命火花塞', '2024-01-19 11:00:00', '2024-01-19 11:00:00');  
INSERT INTO part_table  VALUES (2024006, '电池',       1, 150.00,    '高性能汽车电池', '2024-01-20 13:30:00', '2024-01-20 13:30:00');

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

INSERT INTO partinput_table  VALUES (2024001, 2024001, 2024004,  5,   50.00,   '新到货刹车片', '2024-01-01 09:00:00', '2024-01-01 09:00:00');  
INSERT INTO partinput_table  VALUES (2024002, 2024002, 2024004,  3,  200.00,     '新轮胎入库', '2024-01-02 10:30:00', '2024-01-02 10:30:00');  
INSERT INTO partinput_table  VALUES (2024003, 2024003, 2024004, 10,   30.00,   '机油补充库存', '2024-01-05 14:00:00', '2024-01-05 14:00:00');  
INSERT INTO partinput_table  VALUES (2024004, 2024004, 2024005,  2,   40.00, '空气滤清器到货', '2024-01-08 08:30:00', '2024-01-08 08:30:00');  
INSERT INTO partinput_table  VALUES (2024005, 2024006, 2024005,  1,  150.00,     '新电池入库', '2024-01-10 11:00:00', '2024-01-10 11:00:00');

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

INSERT INTO partoutput_table VALUES (2024001, 2024001, 2024001, 2,  50.00,       '刹车片出库给客户A', '2024-01-15 10:00:00', '2024-01-15 10:00:00');  
INSERT INTO partoutput_table VALUES (2024002, 2024002, 2024001, 1, 200.00,     '轮胎出库给维修车间B', '2024-01-16 13:30:00', '2024-01-16 13:30:00');  
INSERT INTO partoutput_table VALUES (2024003, 2024003, 2024002, 5,  30.00, '机油出库给车间C进行更换', '2024-01-17 09:15:00', '2024-01-17 09:15:00');  
INSERT INTO partoutput_table VALUES (2024004, 2024004, 2024002, 1,  40.00,   '空气滤清器出库给客户D', '2024-01-18 11:45:00', '2024-01-18 11:45:00');  
INSERT INTO partoutput_table VALUES (2024005, 2024006, 2024003, 1, 150.00, '电池出库给车辆E进行更换', '2024-01-19 14:30:00', '2024-01-19 14:30:00');

