--Êý¾Ý¿â¸½¼Ó

exec sp_attach_db @dbname = 'datebase name',
@filename1 = 'mdf file path',
@filename2 = 'ldf file path'




exec sp_attach_db @dbname = 'rc_base',
@filename1 = 'E:\MyDB\rc_base/rc_base_Data.MDF',
@filename2 = 'E:\MyDB\rc_base/rc_base_Log.LDF'



exec sp_attach_db @dbname = 'StudentManager',
@filename1 = 'E:\MyDB\StudentManager/StudentManager_Data.MDF',
@filename2 = 'E:\MyDB\StudentManager/StudentManager_Log.LDF'





exec sp_attach_db @dbname = 'room_system',
@filename1 = 'E:\JavaProject\DormMag\sqlserver\room_system.mdf',
@filename2 = 'E:\JavaProject\DormMag\sqlserver\room_system.ldf'

exec sp_attach_db @dbname = 'WarehouseManager',
@filename1 = 'E:\JavaProject\WareHouseMag\sqlserver\WarehouseManager.mdf',
@filename2 = 'E:\JavaProject\WareHouseMag\sqlserver\WarehouseManager_log.ldf'

exec sp_attach_db @dbname = 'STU',
@filename1 = 'E:\JavaProject\StuOptC\sqlserver\STU.mdf',
@filename2 = 'E:\JavaProject\StuOptC\sqlserver\STU_log.ldf'


