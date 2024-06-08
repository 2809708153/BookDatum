
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
INSERT INTO kehu  VALUES ('ZH0001', 'С��', '��', '13800138001','2023-07-01', '2003-07-01');   
INSERT INTO kehu  VALUES ('ZH0002', 'С��', 'Ů', '13912345678','2023-12-14', '2004-03-01');    
INSERT INTO kehu  VALUES ('ZH0011', 'С��', 'Ů', '15987654321','2023-07-13', '2003-12-13');   
INSERT INTO kehu  VALUES ('ZH0012', 'С��', '��', '18612345678','2023-06-01', '2000-07-01');    
INSERT INTO kehu  VALUES ('ZH0020', 'С��', '��', '13798765432','2024-03-01', '2004-10-01');



--CREATE TABLE `kehu` (
--  `kehuzhanghao` varchar(20) NOT NULL COMMENT '�ͻ��˺�',
--  `mima` varchar(20) NOT NULL COMMENT '����',
--  `kehuxingming` char(10) DEFAULT NULL COMMENT '�ͻ�����',
--  `shouji` char(12) DEFAULT NULL COMMENT '�ֻ�',
--  `youxiang` varchar(20) DEFAULT NULL COMMENT '����',
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
    CONSTRAINT UC_WeixiuZhangHao UNIQUE (zhanghao) -- �����UNIQUEԼ��  
);
INSERT INTO yuangong VALUES ('WXZ001', '����', '��', '13800138001',4000,'2023-07-01', '2003-07-01','ά��Ա');    
INSERT INTO yuangong VALUES ('WXZ002', '����', 'Ů', '13912345678',4000,'2024-07-01', '2004-02-01','ά��Ա');    
INSERT INTO yuangong VALUES ('WXZ003', '����', '��', '13777778888',4000,'2023-11-01', '2003-09-21','ά��Ա');   
INSERT INTO yuangong VALUES ('WXZ004', '����', 'Ů', '13666665555',4000,'2023-08-15', '2003-12-01','ά��Ա');    
INSERT INTO yuangong VALUES ('WXZ005', '����', '��', '13512340987',4000,'2023-07-01', '2003-11-01','ά��Ա');
INSERT INTO yuangong VALUES ('CGY001', '����', '��', '13800138001',4000,'2023-07-01', '2003-07-01','�ɹ�Ա');    
INSERT INTO yuangong VALUES ('CGY002', '����', 'Ů', '13912345678',4000,'2024-07-01', '2004-02-01','�ɹ�Ա');    
INSERT INTO yuangong VALUES ('CGY003', '����', '��', '13777778888',4000,'2023-11-01', '2003-09-21','�ɹ�Ա');   
INSERT INTO yuangong VALUES ('CGY004', '����', 'Ů', '13666665555',4000,'2023-08-15', '2003-12-01','�ɹ�Ա');    
INSERT INTO yuangong VALUES ('CGY005', '����', '��', '13512340987',4000,'2023-07-01', '2003-11-01','�ɹ�Ա');
--CREATE TABLE `weixiuyuan` (
--  `weixiuzhanghao` varchar(20) NOT NULL COMMENT 'ά���˺�',
--  `mima` varchar(20) NOT NULL COMMENT '����',
--  `xingming` char(10) DEFAULT NULL COMMENT '����',
--  `xingbie` char(3) DEFAULT NULL COMMENT '�Ա�',
--  `shouji` char(12) DEFAULT NULL COMMENT '�ֻ�',
--  `youxiang` varchar(200) DEFAULT NULL COMMENT '����',
--  UNIQUE KEY `weixiuzhanghao` (`weixiuzhanghao`)
--) 'ά��Ա';

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
VALUES ('CLBH666', 'С��su7', '��A666666', '�糵', '������', 'һ��С�׵��³���'); 
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH001', '�����γ�A', '��A123456', '����', '7ϵ', 'һ��������ʵĽγ����䱸�Ƚ��İ�ȫ�ͼ�ʻ����ϵͳ��');   
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH002', 'SUV B', '��B654321', '�µ�', 'Q7', 'һ�����SUV��ӵ��ǿ��Ķ����Ϳ����ڲ��ռ䡣');    
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH011', '�ܳ�C', '��C987654', '������', '488', 'һ��������ܳ�������׿Խ�ļ������ܺ����ŵ���ƶ����ơ�');    
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH012', '�綯��D', '��AD12345', '��˹��', 'Model 3', 'һ��綯�γ������价������Ч���Ƚ����Զ���ʻ������������');  
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH020', '����E', '��E098765', '����', 'V��', 'һ��������񳵣��ʺ�������кͽӴ���Ҫ�ͻ���'); 
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH021', '��糵F', '��F432109', '�ֶ���', 'XC60', 'һ���������Ժ�ԽҰ���ܵĿ�糵�ͣ��ʺϳ��к�����·��');    
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH022', '���г�G', '��G765432', '·��', '����', 'һ��רΪ��;������Ƶĳ��ͣ�ӵ��ǿ���ԽҰ�����Ϳ����ڲ��ռ䡣');    
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH023', 'Ƥ��H', '��H109876', '����', 'F-150', 'һ��ǿ���Ƥ�����ͣ��ʺ������ԽҰ��ʻ��');   
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH024', '�γ�I', '³I234567', '�׿���˹', 'ES', 'һ������γ����������ŵ���ۺ����ʵ��ڲ��ռ���ܵ�������');   
INSERT INTO cheliangxinxi (cheliangbianhao, cheliangmingcheng, chepaihao, pinpai, xinghao, jieshao)  
VALUES ('CLBH025', '�ܳ�J', '��J876543', '��������', 'Hurac��n', 'һ������ܵ��ܳ����������˾�̾����ƺ�׿Խ�ļ�ʻ�����������');
--CREATE TABLE `cheliangxinxi` (
--  `cheliangbianhao` varchar(200) DEFAULT NULL COMMENT '�������',
--  `cheliangmingcheng` varchar(200) NOT NULL COMMENT '��������',
--  `chepaihao` varchar(200) NOT NULL COMMENT '���ƺ�',
--  `pinpai` varchar(200) DEFAULT NULL COMMENT 'Ʒ��',
--  `xinghao` varchar(200) DEFAULT NULL COMMENT '�ͺ�',
--  `jieshao` longtext COMMENT '����',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `chepaihao` (`chepaihao`),
--  UNIQUE KEY `cheliangbianhao` (`cheliangbianhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618586886053 DEFAULT CHARSET=utf8 COMMENT='������Ϣ';

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
VALUES ('SLD001', 'CLBH001', '��������', 'PJBH001', 800, 2, 'WXZ001',  '2024-01-05');  
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD002', 'CLBH002', '����ɲ��Ƭ','PJBH002', 1500, 3, 'WXZ002',  '2024-02-10');  
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD003', 'CLBH011', '��������������', 'PJBH003', 300, 1, 'WXZ003', '2024-03-15');  
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD004', 'CLBH012', '�����յ�ϵͳ', 'PJBH018', 500, 2, 'WXZ004', '2024-04-20');    
INSERT INTO qichexiulidan (xiulidanhao, cheliangbianhao, weixiuxiangmu, peijianbianhao, xiulifei, xiulixiaoshi, weixiuzhanghao, songxiuriqi)  
VALUES ('SLD005', 'CLBH020', '���ɲ����', 'PJBH019', 200, 0.5, 'WXZ005', '2024-05-25');
--CREATE TABLE `qichexiulidan` (
--  `xiulidanhao` varchar(20) NOT NULL COMMENT '������',
--  `cheliangmingcheng` varchar(20) NOT NULL COMMENT '��������',
--  `chepaihao` char(18) NOT NULL COMMENT '���ƺ�',
--  `pinpai` varchar(20) DEFAULT NULL COMMENT 'Ʒ��',
--  `weixiuxiangmu` varchar(20) DEFAULT NULL COMMENT 'ά����Ŀ',
--  `peijianmingcheng` varchar(20) DEFAULT NULL COMMENT '�������',
--  `xiulifei` int(11) DEFAULT NULL COMMENT '�����',
--  `xiulixiaoshi` int(11) DEFAULT NULL COMMENT '����Сʱ',
--  `weixiuzhanghao` varchar(20) DEFAULT NULL COMMENT 'ά���˺�',
--  `xingming` char(10) DEFAULT NULL COMMENT '����',
--  `songxiuriqi` date DEFAULT NULL COMMENT '��������'
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `xiulidanhao` (`xiulidanhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587262955 DEFAULT CHARSET=utf8 COMMENT='��������';

DROP TABLE IF EXISTS qichepeijiankucun;
CREATE TABLE qichepeijiankucun (  
    peijianbianhao varchar(20) DEFAULT NULL,  
    peijianmingcheng varchar(20) DEFAULT NULL,   
    shuliang int DEFAULT NULL,  
    jiage money DEFAULT NULL,    
    CONSTRAINT UC_PeiJianBianHao UNIQUE (peijianbianhao) -- �����UNIQUEԼ��  
)   
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH001', '����������', 100, 20.00);    
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH002', 'ɲ��Ƭ', 50, 150.00);   
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH003', '����������',  80, 30.00);    
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH004', '���Ƭ',  120, 50.00);   
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH005', '����',  70, 80.00); 
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH006', '��̥', 4, 500.00);    
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH007', '����',  20, 200.00);  
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH008', 'ת��������',  50, 80.00);  
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH009', '�յ�������',  150, 40.00);  
INSERT INTO qichepeijiankucun (peijianbianhao, peijianmingcheng, shuliang, jiage)  
VALUES ('PJH010', 'ɲ����',  8, 120.00);
--CREATE TABLE `qichepeijiankucun` (
--  `peijianbianhao` varchar(20) DEFAULT NULL COMMENT '������',
--  `peijianmingcheng` varchar(20) DEFAULT NULL COMMENT '�������',
--  `peijianleixing` varchar(20) DEFAULT NULL COMMENT '�������',
--  `shuliang` int DEFAULT NULL COMMENT '����',
--  `jiage` money DEFAULT NULL COMMENT '�۸�',
--  `riqi` date DEFAULT NULL COMMENT '����',
--  `beizhu` varchar(200) DEFAULT NULL COMMENT '��ע',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `peijianbianhao` (`peijianbianhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587579647 DEFAULT CHARSET=utf8 COMMENT='����������';




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
--  `caigoudanhao` varchar(200) DEFAULT NULL COMMENT '�ɹ�����',
--  `peijianbianhao` varchar(200) DEFAULT NULL COMMENT '������',
--  `peijianmingcheng` varchar(200) DEFAULT NULL COMMENT '�������',
--  `leixing` varchar(200) DEFAULT NULL COMMENT '�������',
--  `shuliang` int(11) DEFAULT NULL COMMENT '����',
--  `jiage` int(11) DEFAULT NULL COMMENT '�۸�',
--  `riqi` date DEFAULT NULL COMMENT '����',
--  `zhanghao` varchar(200) DEFAULT NULL COMMENT '�˺�',
--  `xingming` varchar(200) DEFAULT NULL COMMENT '����',
--) ENGINE=InnoDB AUTO_INCREMENT=1618587034690 DEFAULT CHARSET=utf8 COMMENT='�ɹ�������';





DROP TABLE IF EXISTS peijianshenqing;
CREATE TABLE peijianshenqing (   
    peijianbianhao varchar(20) DEFAULT NULL,   
    shuliang int DEFAULT NULL,  
    xiulidanhao varchar(20) DEFAULT NULL,  
    shenqingriqi date DEFAULT NULL,  
    weixiuzhanghao varchar(20) DEFAULT NULL,  
    sfsh varchar(3) DEFAULT '��',  
    shhf text  
) 
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH001',1, 'SLD001', '2023-01-01', 'WXZ001','��', '�������ɣ����汣��');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH002',1, 'SLD002', '2023-02-15', 'WXZ002','��', '�������ɣ�ɲ������');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH003',2, 'SLD003', '2023-03-20', 'WXZ003','��', '�������ɣ���������');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH004',3, 'SLD004', '2023-04-10', 'WXZ004','��', '�������ɣ���������ģ��');    
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH005',1, 'SLD005', '2023-05-15', 'WXZ005','��', '�������ɣ���������');
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH006',8, 'SLD006', '2024-06-20', 'WXZ006','��', '�������ɣ������䱣��');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH007',1, 'SLD007', '2024-07-01', 'WXZ007','��', '�������ɣ���̥ĥ������');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH008',4, 'SLD008', '2024-07-15', 'WXZ008','��', '�������ɣ���ȴҺ����');  
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH009',1, 'SLD009', '2024-08-01', 'WXZ009','��', '�������ɣ�ɲ���͹���');   
INSERT INTO peijianshenqing (peijianbianhao, shuliang, xiulidanhao, shenqingriqi, weixiuzhanghao, sfsh, shhf)  VALUES ('PJH010',1, 'SLD010', '2024-08-15', 'WXZ010','��', '�������ɣ����ص�������');
--CREATE TABLE `peijianshenqing` (
--  `shenqingbianhao` varchar(200) DEFAULT NULL COMMENT '������',
--  `peijianbianhao` varchar(20) DEFAULT NULL COMMENT '������',
--  `peijianmingcheng` varchar(20) DEFAULT NULL COMMENT '�������',
--  `shuliang` int DEFAULT NULL COMMENT '����',
--  `xiulidanhao` varchar(200) DEFAULT NULL COMMENT '������',
--  `shenqingriqi` date DEFAULT NULL COMMENT '��������',
--  `weixiuzhanghao` varchar(200) DEFAULT NULL COMMENT 'ά���˺�',
--  `xingming` varchar(200) DEFAULT NULL COMMENT '����',
--  `sfsh` varchar(3) DEFAULT '��' COMMENT '�Ƿ����',
--  `shhf` longtext COMMENT '��˻ظ�',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `shenqingbianhao` (`shenqingbianhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587370244 DEFAULT CHARSET=utf8 COMMENT='�������';


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
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '���￨����', '��A123456', '����', '    ��������','2023-10-23', 'WXZ001')
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '  ����˼��', '��B654321', '����', '  ����ɲ��Ƭ', '2023-10-25','WXZ002')
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '   �µ�A4L', '��C789012', '�µ�', '�����յ�ϵͳ','2023-10-27', 'WXZ003')
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '   ����3ϵ', '��D321098', '����', '    ������̥', '2023-10-29','WXZ004')
INSERT INTO weixiuyuyue (cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, yuyueshijian, weixiuzhanghao)  VALUES ( '   ����C��', '��E567890', '����', '    ������','2023-10-31', 'WXZ005')
--CREATE TABLE `weixiuyuyue` (
--  `yuyuebianhao` varchar(20) DEFAULT NULL COMMENT 'ԤԼ���',
--  `cheliangmingcheng` varchar(20) DEFAULT NULL COMMENT '��������',
--  `chepaihao` char(18) DEFAULT NULL COMMENT '���ƺ�',
--  `pinpai` varchar(20) DEFAULT NULL COMMENT 'Ʒ��',
--  `weixiuxiangmu` varchar(20) DEFAULT NULL COMMENT 'ά����Ŀ',
--  `jiage` int(11) DEFAULT NULL COMMENT '�۸�',
--  `yuyueshijian` date DEFAULT NULL COMMENT 'ԤԼʱ��',
--  `kehuzhanghao` varchar(20) DEFAULT NULL COMMENT '�ͻ��˺�',
--  `kehuxingming` varchar(20) DEFAULT NULL COMMENT '�ͻ�����',
--  `shouji` char(12) DEFAULT NULL COMMENT '�ֻ�',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `yuyuebianhao` (`yuyuebianhao`)
--) 'ά��ԤԼ';


-- Table structure for table `weixiuyuyue`



DROP TABLE IF EXISTS guanliyuan;
CREATE TABLE guanliyuan (    
    zhanghao varchar(20) DEFAULT NULL,  
	xingming varchar(20) not null,
	shouji char(12),
	youxiang varchar(200)
);  

insert guanliyuan values('2022413536','������',15881341537,'wang@outlook.com')

DROP TABLE IF EXISTS yonghu;
CREATE TABLE yonghu (    
    zhanghao varchar(20) DEFAULT NULL,  
	mima varchar(20) not null,
	xingming varchar(20) not null,
	quanxian int   --0,1,2     0 ����Ա    1 Ա��     2 �ͻ� 
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
  CONSTRAINT UC_LingYongBianHao UNIQUE (lingyongbianhao) -- �����UNIQUEԼ��  
) 
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH001', '�����γ�A', '��A123456', '����', '��������', '��ʵ�����', 10, '2023-01-01', '��������', 'ZXH001', '����');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH002', 'SUV B', '��B654321', '�µ�', '����ɲ��Ƭ', 'ԭ��ɲ��Ƭ', 4, '2023-02-15', 'ɲ������', 'ZXH002', '����');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH003', '�ܳ�C', '��C987654', '������', '��������������', '����������������', 1, '2023-03-20', '��������', 'ZXH003', '����');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH004', '�綯��D', '��AD12345', '��˹��', '��̥���', '��̥������', 0, '2023-04-10', '������', 'ZXH004', '����');    
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH005', '����E', '��E098765', '����', 'ȫ�����', 'ȫ��������', 0, '2023-05-15', '��ȼ��', 'ZXH005', '����');
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH006', '���г�F', '��F765432', '·��', '�������Ƭ', '·��ר�����Ƭ', 2, '2023-06-20', '��������ģ��', 'ZXH006', '�ܰ�');    
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH007', '�γ�G', '��G321456', '����', '��������', 'ҿ�����', 4, '2023-07-01', '��������', 'ZXH007', '���');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH008', 'MPV H', '��H876543', '���', '�����ײ�', '��˱����ײ�', 0, '2023-07-15', '���ڱ���', 'ZXH008', '֣ʮ');   
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH009', 'Ƥ��I', '��I543210', '����', '��������Һ', '���Ƿ���Һ', 2, '2023-08-01', '��ȴҺ����', 'ZXH009', '��ʮһ');  
INSERT INTO peijianlingyong (lingyongbianhao, cheliangmingcheng, chepaihao, pinpai, weixiuxiangmu, peijianmingcheng, shuliang, lingyongriqi, beizhu, weixiuzhanghao, xingming)  
VALUES ('LYBH010', '��糵J', '��J987654', '�ֶ���', '������������', '�ֶ��ֱ�������', 6, '2023-08-15', '�����䱣��', 'ZXH010', '��ʮ��');
--CREATE TABLE `peijianlingyong` (
--  `lingyongbianhao` varchar(20) DEFAULT NULL COMMENT '���ñ��',
--  `cheliangmingcheng` varchar(20) DEFAULT NULL COMMENT '��������',
--  `chepaihao` char(18) DEFAULT NULL COMMENT '���ƺ�',
--  `pinpai` varchar(20) DEFAULT NULL COMMENT 'Ʒ��',
--  `weixiuxiangmu` varchar(200) DEFAULT NULL COMMENT 'ά����Ŀ',
--  `peijianmingcheng` varchar(200) DEFAULT NULL COMMENT '�������',
--  `shuliang` int(11) DEFAULT NULL COMMENT '����',
--  `lingyongriqi` date DEFAULT NULL COMMENT '��������',
--  `beizhu` varchar(200) DEFAULT NULL COMMENT '��ע',
--  `weixiuzhanghao` varchar(20) DEFAULT NULL COMMENT 'ά���˺�',
--  `xingming` varchar(20) DEFAULT NULL COMMENT '����',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `lingyongbianhao` (`lingyongbianhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587284616 DEFAULT CHARSET=utf8 COMMENT='�������';


-- Table structure for table `peijianshenqing`


DROP TABLE IF EXISTS qichexiulitaizhang;
CREATE TABLE qichexiulitaizhang (   
    xiulidanhao varchar(20) not null unique,    
    weixiuzonge INT DEFAULT NULL,   
); 
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (1, '��A123456', '��������', '����������', 800, 'WXZ001', '����');   
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (2, '��B654321', '����ɲ��Ƭ', 'ǰɲ��Ƭ', 1500, 'WXZ002', '����');    
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (3, '��C789012', '�����յ�ϵͳ', '�յ�������', 500, 'WXZ003', '����');    
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (4, '��D321098', '������̥', 'ǰ����̥', 2000, 'WXZ004', '����');   
INSERT INTO qichexiulitaizhang (xuhao, chepaihao, weixiuxiangmu, lingjian, weixiuzonge, weixiuzhanghao, xingming)  
VALUES (5, '��E567890', '������', '������˿', 300, 'WXZ005', '����');
--CREATE TABLE `qichexiulitaizhang` (
--  `xuhao` int NOT NULL COMMENT '���',
--  `chepaihao` char(18) NOT NULL COMMENT '���ƺ�',
--  `weixiuxiangmu` varchar(20) DEFAULT NULL COMMENT 'ά����Ŀ',
--  `lingjian` varchar(20) DEFAULT NULL COMMENT '���',
--  `weixiuzonge` int(11) DEFAULT NULL COMMENT 'ά���ܶ�',
--  `weixiuzhanghao` varchar(20) DEFAULT NULL COMMENT 'ά���˺�',
--  `xingming` char(10) DEFAULT NULL COMMENT '����',
--  PRIMARY KEY (`id`),
--  UNIQUE KEY `xuhao` (`xuhao`)
--) ENGINE=InnoDB AUTO_INCREMENT=1618587308664 DEFAULT CHARSET=utf8 COMMENT='��������̨��';




-- Table structure for table `weixiuyuyue`