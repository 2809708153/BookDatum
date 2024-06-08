
-- Host: localhost    Database: VehicleSystem

--
-- Table structure for table `caigoujinhuodan`
--
--create database VehicleSystem
use VehicleSystem

-- Table structure for table `kehu`
DROP TABLE IF EXISTS kehu;
CREATE TABLE kehu (   
  kehuzhanghao varchar(20) NOT NULL UNIQUE,  
  kehuxingming char(10) DEFAULT NULL, 
  xingbie char(3) DEFAULT NULL, 
  shouji char(12) DEFAULT NULL,  
  tianjiashijian date not null,
  shengri date not null
) 
INSERT INTO kehu  VALUES ('ZH0001', '小张', '男', '13800138001','2023-07-01', '2003-07-01');   
INSERT INTO kehu  VALUES ('ZH0002', '小李', '女', '13912345678','2023-12-14', '2004-03-01');    
INSERT INTO kehu  VALUES ('ZH0011', '小王', '女', '15987654321','2023-07-13', '2003-12-13');   
INSERT INTO kehu  VALUES ('ZH0012', '小赵', '男', '18612345678','2023-06-01', '2000-07-01');    
INSERT INTO kehu  VALUES ('ZH0020', '小孙', '男', '13798765432','2024-03-01', '2004-10-01');



--CREATE TABLE `kehu` (
--  `kehuzhanghao` varchar(20) NOT NULL COMMENT '客户账号',
--  `mima` varchar(20) NOT NULL COMMENT '密码',
--  `kehuxingming` char(10) DEFAULT NULL COMMENT '客户姓名',
--  `shouji` char(12) DEFAULT NULL COMMENT '手机',
--  `youxiang` varchar(20) DEFAULT NULL COMMENT '邮箱',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `kehuzhanghao` (`kehuzhanghao`)
--)
-- Table structure for table `caigoujinhuodan`

DROP TABLE IF EXISTS yuangong;
CREATE TABLE yuangong (  
    zhanghao varchar(20) NOT NULL,  
    xingming char(10) DEFAULT NULL,  
    xingbie char(3) DEFAULT NULL,  
    shouji char(12) DEFAULT NULL,  
	xinshui money not null,
	ruzhishijian date not null,
	shengri date not null,
	zhiwei varchar(20) not null
    CONSTRAINT UC_WeixiuZhangHao UNIQUE (zhanghao) -- 添加了UNIQUE约束  
);
INSERT INTO yuangong VALUES ('WXZ001', '张三', '男', '13800138001',4000,'2023-07-01', '2003-07-01','维修员');    
INSERT INTO yuangong VALUES ('WXZ002', '李四', '女', '13912345678',4000,'2024-07-01', '2004-02-01','维修员');    
INSERT INTO yuangong VALUES ('WXZ003', '王五', '男', '13777778888',4000,'2023-11-01', '2003-09-21','维修员');   
INSERT INTO yuangong VALUES ('WXZ004', '赵六', '女', '13666665555',4000,'2023-08-15', '2003-12-01','维修员');    
INSERT INTO yuangong VALUES ('WXZ005', '孙七', '男', '13512340987',4000,'2023-07-01', '2003-11-01','维修员');
INSERT INTO yuangong VALUES ('CGY001', '张三', '男', '13800138001',4000,'2023-07-01', '2003-07-01','采购员');    
INSERT INTO yuangong VALUES ('CGY002', '李四', '女', '13912345678',4000,'2024-07-01', '2004-02-01','采购员');    
INSERT INTO yuangong VALUES ('CGY003', '王五', '男', '13777778888',4000,'2023-11-01', '2003-09-21','采购员');   
INSERT INTO yuangong VALUES ('CGY004', '赵六', '女', '13666665555',4000,'2023-08-15', '2003-12-01','采购员');    
INSERT INTO yuangong VALUES ('CGY005', '孙七', '男', '13512340987',4000,'2023-07-01', '2003-11-01','采购员');
--CREATE TABLE `weixiuyuan` (
--  `weixiuzhanghao` varchar(20) NOT NULL COMMENT '维修账号',
--  `mima` varchar(20) NOT NULL COMMENT '密码',
--  `xingming` char(10) DEFAULT NULL COMMENT '姓名',
--  `xingbie` char(3) DEFAULT NULL COMMENT '性别',
--  `shouji` char(12) DEFAULT NULL COMMENT '手机',
--  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
--  UNIQUE KEY `weixiuzhanghao` (`weixiuzhanghao`)
--) '维修员';

-- Table structure for table `cheliangxinxi`
DROP TABLE IF EXISTS cheliangxinxi;
CREATE TABLE cheliangxinxi (   
    cheliangbianhao varchar(20) NOT NULL UNIQUE,  
    cheliangmingcheng varchar(20) NOT NULL,  
    chepaihao char(18) NOT NULL UNIQUE,  
    pinpai varchar(20) DEFAULT NULL,  
    xinghao char(20) DEFAULT NULL,  
    jieshao text 
) 
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH666', '小米su7', '渝A666666', '电车', '海湾蓝', '一款小米的新车。'); 
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH001', '豪华轿车A', '京A123456', '宝马', '7系', '一款豪华舒适的轿车，配备先进的安全和驾驶辅助系统。');   
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH002', 'SUV B', '沪B654321', '奥迪', 'Q7', '一款豪华SUV，拥有强大的动力和宽敞的内部空间。');    
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH011', '跑车C', '粤C987654', '法拉利', '488', '一款高性能跑车，以其卓越的加速性能和优雅的设计而著称。');    
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH012', '电动车D', '京AD12345', '特斯拉', 'Model 3', '一款电动轿车，以其环保、高效和先进的自动驾驶技术而闻名。');  
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH020', '商务车E', '沪E098765', '奔驰', 'V级', '一款豪华商务车，适合商务出行和接待重要客户。'); 
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH021', '跨界车F', '浙F432109', '沃尔沃', 'XC60', '一款兼具舒适性和越野性能的跨界车型，适合城市和乡村道路。');    
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH022', '旅行车G', '苏G765432', '路虎', '发现', '一款专为长途旅行设计的车型，拥有强大的越野能力和宽敞的内部空间。');    
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH023', '皮卡H', '皖H109876', '福特', 'F-150', '一款强大的皮卡车型，适合运输和越野驾驶。');   
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH024', '轿车I', '鲁I234567', '雷克萨斯', 'ES', '一款豪华轿车，以其优雅的外观和舒适的内部空间而受到赞誉。');   
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH025', '跑车J', '川J876543', '兰博基尼', 'Huracán', '一款极致性能的跑车，以其令人惊叹的设计和卓越的驾驶体验而闻名。');
--CREATE TABLE `cheliangxinxi` (
--  `cheliangbianhao` varchar(200) DEFAULT NULL COMMENT '车辆编号',
--  `cheliangmingcheng` varchar(200) NOT NULL COMMENT '车辆名称',
--  `chepaihao` varchar(200) NOT NULL COMMENT '车牌号',
--  `pinpai` varchar(200) DEFAULT NULL COMMENT '品牌',
--  `xinghao` varchar(200) DEFAULT NULL COMMENT '型号',
--  `jieshao` longtext COMMENT '介绍',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `chepaihao` (`chepaihao`),
--  UNIQUE KEY `cheliangbianhao` (`cheliangbianhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618586886053 DEFAULT CHARSET=utf8 COMMENT='车辆信息';

-- Table structure for table `weixiuyuan`

DROP TABLE IF EXISTS qichexiulidan;
CREATE TABLE qichexiulidan (  
    xiulidanhao varchar(20) NOT NULL unique,  
    cheliangbianhao varchar(20)  NOT NULL UNIQUE,
    weixiuxiangmu varchar(200) DEFAULT NULL,  
    peijianbianhao varchar(20) DEFAULT NULL,  
    xiulifei money DEFAULT NULL,  
    xiulixiaoshi int DEFAULT NULL,  
    weixiuzhanghao varchar(20) DEFAULT NULL,  
    songxiuriqi date DEFAULT NULL,  
); 
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD001', 'CLBH001', '更换机油', 'PJBH001', 800, 2, 'WXZ001',  '2024-01-05');  
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD002', 'CLBH002', '更换刹车片','PJBH002', 1500, 3, 'WXZ002',  '2024-02-10');  
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD003', 'CLBH011', '更换空气滤清器', 'PJBH003', 300, 1, 'WXZ003', '2024-03-15');  
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD004', 'CLBH012', '保养空调系统', 'PJBH018', 500, 2, 'WXZ004', '2024-04-20');    
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD005', 'CLBH020', '检查刹车油', 'PJBH019', 200, 0.5, 'WXZ005', '2024-05-25');
--CREATE TABLE `qichexiulidan` (
--  `xiulidanhao` varchar(20) NOT NULL COMMENT '修理单号',
--  `cheliangmingcheng` varchar(20) NOT NULL COMMENT '车辆名称',
--  `chepaihao` char(18) NOT NULL COMMENT '车牌号',
--  `pinpai` varchar(20) DEFAULT NULL COMMENT '品牌',
--  `weixiuxiangmu` varchar(20) DEFAULT NULL COMMENT '维修项目',
--  `peijianmingcheng` varchar(20) DEFAULT NULL COMMENT '配件名称',
--  `xiulifei` int(11) DEFAULT NULL COMMENT '修理费',
--  `xiulixiaoshi` int(11) DEFAULT NULL COMMENT '修理小时',
--  `weixiuzhanghao` varchar(20) DEFAULT NULL COMMENT '维修账号',
--  `xingming` char(10) DEFAULT NULL COMMENT '姓名',
--  `songxiuriqi` date DEFAULT NULL COMMENT '送修日期'
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `xiulidanhao` (`xiulidanhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587262955 DEFAULT CHARSET=utf8 COMMENT='汽车修理单';

DROP TABLE IF EXISTS qichepeijiankucun;
CREATE TABLE qichepeijiankucun (  
    peijianbianhao varchar(20) DEFAULT NULL,  
    peijianmingcheng varchar(20) DEFAULT NULL,   
    shuliang int DEFAULT NULL,  
    jiage money DEFAULT NULL,    
    CONSTRAINT UC_PeiJianBianHao UNIQUE (peijianbianhao) -- 添加了UNIQUE约束  
)   
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH001', '机油滤清器', 100, 20.00);    
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH002', '刹车片', 50, 150.00);   
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH003', '空气滤清器',  80, 30.00);    
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH004', '雨刮片',  120, 50.00);   
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH005', '火花塞',  70, 80.00); 
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH006', '轮胎', 4, 500.00);    
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH007', '蓄电池',  20, 200.00);  
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH008', '转向助力油',  50, 80.00);  
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH009', '空调滤清器',  150, 40.00);  
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH010', '刹车油',  8, 120.00);
--CREATE TABLE `qichepeijiankucun` (
--  `peijianbianhao` varchar(20) DEFAULT NULL COMMENT '配件编号',
--  `peijianmingcheng` varchar(20) DEFAULT NULL COMMENT '配件名称',
--  `peijianleixing` varchar(20) DEFAULT NULL COMMENT '配件类型',
--  `shuliang` int DEFAULT NULL COMMENT '数量',
--  `jiage` money DEFAULT NULL COMMENT '价格',
--  `riqi` date DEFAULT NULL COMMENT '日期',
--  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `peijianbianhao` (`peijianbianhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587579647 DEFAULT CHARSET=utf8 COMMENT='汽车配件库存';




-- Table structure for table `qichexiulitaizhang`


DROP TABLE IF EXISTS caigoujinhuodan;
CREATE TABLE caigoujinhuodan (  
    caigoudanhao char(20) NOT NULL unique,  
    peijianbianhao varchar(20) DEFAULT NULL,  
    shuliang int DEFAULT NULL,  
    riqi date DEFAULT NULL,  
    weixiuzhanghao varchar(20) not null 
)  
INSERT INTO caigoujinhuodan (caigoudanhao, peijianbianhao, shuliang, riqi, weixiuzhanghao)  
VALUES ('CGDH0001', 'PJBH001',10, '2024-01-01', 'CGY001');  
INSERT INTO caigoujinhuodan (caigoudanhao, peijianbianhao, shuliang, riqi, weixiuzhanghao)  
VALUES ('CGDH0002', 'PJBH002', 5, '2024-03-02', 'CGY002');  
INSERT INTO caigoujinhuodan (caigoudanhao, peijianbianhao, shuliang, riqi, weixiuzhanghao)  
VALUES ('CGDH0003', 'PJBH003', 20,'2024-03-03', 'CGY003');  
INSERT INTO caigoujinhuodan (caigoudanhao, peijianbianhao, shuliang, riqi, weixiuzhanghao)  
VALUES ('CGDH0018', 'PJBH018', 7, '2024-05-18', 'CGY004');   
INSERT INTO caigoujinhuodan (caigoudanhao, peijianbianhao, shuliang, riqi, weixiuzhanghao)  
VALUES ('CGDH0019', 'PJBH019', 3, '2024-04-19', 'CGY005');  
--CREATE TABLE `caigoujinhuodan` (
--  `caigoudanhao` varchar(200) DEFAULT NULL COMMENT '采购单号',
--  `peijianbianhao` varchar(200) DEFAULT NULL COMMENT '配件编号',
--  `peijianmingcheng` varchar(200) DEFAULT NULL COMMENT '配件名称',
--  `leixing` varchar(200) DEFAULT NULL COMMENT '配件类型',
--  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
--  `jiage` int(11) DEFAULT NULL COMMENT '价格',
--  `riqi` date DEFAULT NULL COMMENT '日期',
--  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
--  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
--) ENGINE=InnoDB AUTO_INCREMENT=1618587034690 DEFAULT CHARSET=utf8 COMMENT='采购进货单';





DROP TABLE IF EXISTS peijianshenqing;
CREATE TABLE peijianshenqing (   
    peijianbianhao varchar(20) DEFAULT NULL,   
    shuliang int DEFAULT NULL,  
    xiulidanhao varchar(20) DEFAULT NULL,  
    shenqingriqi date DEFAULT NULL,  
    weixiuzhanghao varchar(20) DEFAULT NULL,  
    sfsh varchar(3) DEFAULT '否',  
    shhf text  
) 
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH001',1, 'SLD001', '2023-01-01', 'WXZ001','否', '申请理由：常规保养');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH002',1, 'SLD002', '2023-02-15', 'WXZ002','是', '申请理由：刹车异响');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH003',2, 'SLD003', '2023-03-20', 'WXZ003','否', '申请理由：保养提醒');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH004',3, 'SLD004', '2023-04-10', 'WXZ004','否', '申请理由：雨天视线模糊');    
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH005',1, 'SLD005', '2023-05-15', 'WXZ005','是', '申请理由：加速无力');
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH006',8, 'SLD006', '2024-06-20', 'WXZ006','否', '申请理由：变速箱保养');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH007',1, 'SLD007', '2024-07-01', 'WXZ007','是', '申请理由：轮胎磨损严重');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH008',4, 'SLD008', '2024-07-15', 'WXZ008','否', '申请理由：冷却液不足');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH009',1, 'SLD009', '2024-08-01', 'WXZ009','是', '申请理由：刹车油过期');   
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH010',1, 'SLD010', '2024-08-15', 'WXZ010','否', '申请理由：蓄电池电量不足');
--CREATE TABLE `peijianshenqing` (
--  `shenqingbianhao` varchar(200) DEFAULT NULL COMMENT '申请编号',
--  `peijianbianhao` varchar(20) DEFAULT NULL COMMENT '配件编号',
--  `peijianmingcheng` varchar(20) DEFAULT NULL COMMENT '配件名称',
--  `shuliang` int DEFAULT NULL COMMENT '数量',
--  `xiulidanhao` varchar(200) DEFAULT NULL COMMENT '修理单号',
--  `shenqingriqi` date DEFAULT NULL COMMENT '申请日期',
--  `weixiuzhanghao` varchar(200) DEFAULT NULL COMMENT '维修账号',
--  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
--  `sfsh` varchar(3) DEFAULT '否' COMMENT '是否审核',
--  `shhf` longtext COMMENT '审核回复',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `shenqingbianhao` (`shenqingbianhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587370244 DEFAULT CHARSET=utf8 COMMENT='配件申请';


-- Table structure for table `qichepeijiankucun`


DROP TABLE IF EXISTS weixiuyuyue;
CREATE TABLE weixiuyuyue (    
    cheliangmingcheng varchar(20) not NULL unique,  
    chepaihao char(18) DEFAULT NULL,  
    pinpai varchar(20) DEFAULT NULL,  
    weixiuxiangmu varchar(20) DEFAULT NULL,   
    yuyueshijian date DEFAULT NULL,  
	weixiuzhanghao varchar(20)
);  
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '丰田卡罗拉', '京A123456', '丰田', '    更换机油','2023-10-23', 'WXZ001')
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '  本田思域', '沪B654321', '本田', '  更换刹车片', '2023-10-25','WXZ002')
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '   奥迪A4L', '粤C789012', '奥迪', '保养空调系统','2023-10-27', 'WXZ003')
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '   宝马3系', '津D321098', '宝马', '    更换轮胎', '2023-10-29','WXZ004')
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '   奔驰C级', '川E567890', '奔驰', '    检查底盘','2023-10-31', 'WXZ005')
--CREATE TABLE `weixiuyuyue` (
--  `yuyuebianhao` varchar(20) DEFAULT NULL COMMENT '预约编号',
--  `cheliangmingcheng` varchar(20) DEFAULT NULL COMMENT '车辆名称',
--  `chepaihao` char(18) DEFAULT NULL COMMENT '车牌号',
--  `pinpai` varchar(20) DEFAULT NULL COMMENT '品牌',
--  `weixiuxiangmu` varchar(20) DEFAULT NULL COMMENT '维修项目',
--  `jiage` int(11) DEFAULT NULL COMMENT '价格',
--  `yuyueshijian` date DEFAULT NULL COMMENT '预约时间',
--  `kehuzhanghao` varchar(20) DEFAULT NULL COMMENT '客户账号',
--  `kehuxingming` varchar(20) DEFAULT NULL COMMENT '客户姓名',
--  `shouji` char(12) DEFAULT NULL COMMENT '手机',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `yuyuebianhao` (`yuyuebianhao`)
--) '维修预约';


-- Table structure for table `weixiuyuyue`



DROP TABLE IF EXISTS guanliyuan;
CREATE TABLE guanliyuan (    
    zhanghao varchar(20) DEFAULT NULL,  
	xingming varchar(20) not null,
	shouji char(12),
	youxiang varchar(200)
);  

insert guanliyuan values('2022413536','王先生',15881341537,'wang@outlook.com')

DROP TABLE IF EXISTS yonghu;
CREATE TABLE yonghu (    
    zhanghao varchar(20) DEFAULT NULL,  
	mima varchar(20) not null,
	xingming varchar(20) not null,
	quanxian int   --0,1,2     0 管理员    1 员工     2 客户 
); 




















DROP TABLE IF EXISTS peijianlingyong;
CREATE TABLE peijianlingyong (   
  lingyongbianhao varchar(20) DEFAULT NULL,  
  cheliangmingcheng varchar(20) DEFAULT NULL,  
  chepaihao char(18) DEFAULT NULL,  
  pinpai varchar(20) DEFAULT NULL,  
  weixiuxiangmu varchar(200) DEFAULT NULL,  
  peijianmingcheng varchar(200) DEFAULT NULL,  
  shuliang int DEFAULT NULL,  
  lingyongriqi date DEFAULT NULL,  
  beizhu varchar(200) DEFAULT NULL,  
  weixiuzhanghao varchar(20) DEFAULT NULL,  
  xingming varchar(20) DEFAULT NULL,  
  CONSTRAINT UC_LingYongBianHao UNIQUE (lingyongbianhao) -- 添加了UNIQUE约束  
) 
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH001', '豪华轿车A', '京A123456', '宝马', '更换机油', '嘉实多机油', 10, '2023-01-01', '正常保养', 'ZXH001', '张三');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH002', 'SUV B', '沪B654321', '奥迪', '更换刹车片', '原厂刹车片', 4, '2023-02-15', '刹车异响', 'ZXH002', '李四');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH003', '跑车C', '粤C987654', '法拉利', '更换空气滤清器', '法拉利空气滤清器', 1, '2023-03-20', '保养提醒', 'ZXH003', '王五');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH004', '电动车D', '京AD12345', '特斯拉', '轮胎检查', '轮胎检查服务', 0, '2023-04-10', '常规检查', 'ZXH004', '赵六');    
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH005', '商务车E', '沪E098765', '奔驰', '全车检查', '全车检查服务', 0, '2023-05-15', '年度检查', 'ZXH005', '孙七');
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH006', '旅行车F', '苏F765432', '路虎', '更换雨刮片', '路虎专用雨刮片', 2, '2023-06-20', '雨天视线模糊', 'ZXH006', '周八');    
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH007', '轿车G', '浙G321456', '丰田', '更换火花塞', '铱金火花塞', 4, '2023-07-01', '加速无力', 'ZXH007', '吴九');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH008', 'MPV H', '皖H876543', '别克', '保养套餐', '别克保养套餐', 0, '2023-07-15', '定期保养', 'ZXH008', '郑十');   
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH009', '皮卡I', '赣I543210', '长城', '更换防冻液', '长城防冻液', 2, '2023-08-01', '冷却液不足', 'ZXH009', '陈十一');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH010', '跨界车J', '桂J987654', '沃尔沃', '更换变速箱油', '沃尔沃变速箱油', 6, '2023-08-15', '变速箱保养', 'ZXH010', '杨十二');
--CREATE TABLE `peijianlingyong` (
--  `lingyongbianhao` varchar(20) DEFAULT NULL COMMENT '领用编号',
--  `cheliangmingcheng` varchar(20) DEFAULT NULL COMMENT '车辆名称',
--  `chepaihao` char(18) DEFAULT NULL COMMENT '车牌号',
--  `pinpai` varchar(20) DEFAULT NULL COMMENT '品牌',
--  `weixiuxiangmu` varchar(200) DEFAULT NULL COMMENT '维修项目',
--  `peijianmingcheng` varchar(200) DEFAULT NULL COMMENT '配件名称',
--  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
--  `lingyongriqi` date DEFAULT NULL COMMENT '领用日期',
--  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
--  `weixiuzhanghao` varchar(20) DEFAULT NULL COMMENT '维修账号',
--  `xingming` varchar(20) DEFAULT NULL COMMENT '姓名',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `lingyongbianhao` (`lingyongbianhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587284616 DEFAULT CHARSET=utf8 COMMENT='配件领用';


-- Table structure for table `peijianshenqing`


DROP TABLE IF EXISTS qichexiulitaizhang;
CREATE TABLE qichexiulitaizhang (   
    xiulidanhao varchar(20) not null unique,    
    weixiuzonge INT DEFAULT NULL,   
); 
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (1, '京A123456', '更换机油', '机油滤清器', 800, 'WXZ001', '张三');   
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (2, '沪B654321', '更换刹车片', '前刹车片', 1500, 'WXZ002', '李四');    
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (3, '粤C789012', '保养空调系统', '空调滤清器', 500, 'WXZ003', '王五');    
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (4, '津D321098', '更换轮胎', '前轮轮胎', 2000, 'WXZ004', '赵六');   
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (5, '川E567890', '检查底盘', '底盘螺丝', 300, 'WXZ005', '孙七');
--CREATE TABLE `qichexiulitaizhang` (
--  `xuhao` int NOT NULL COMMENT '序号',
--  `chepaihao` char(18) NOT NULL COMMENT '车牌号',
--  `weixiuxiangmu` varchar(20) DEFAULT NULL COMMENT '维修项目',
--  `lingjian` varchar(20) DEFAULT NULL COMMENT '零件',
--  `weixiuzonge` int(11) DEFAULT NULL COMMENT '维修总额',
--  `weixiuzhanghao` varchar(20) DEFAULT NULL COMMENT '维修账号',
--  `xingming` char(10) DEFAULT NULL COMMENT '姓名',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `xuhao` (`xuhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587308664 DEFAULT CHARSET=utf8 COMMENT='汽车修理台账';




-- Table structure for table `weixiuyuyue`