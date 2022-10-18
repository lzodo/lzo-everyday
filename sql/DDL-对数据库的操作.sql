 # DDL 数据定义语句，对数据库或表进行 创建、删除、修改等操作 之 数据库操作
 # 查询所有数据库
 SHOW DATABASES;
 
 # 选择数据库
 USE lzoxun;
 
 # 查看当前正在使用的数据库
 SELECT DATABASE();
 
 # 创建新数据库
 # CREATE DATABASE users; # 直接创建
 CREATE DATABASE IF NOT EXISTS users; # 如果不存在就创建
 
 # 删除数据库
 DROP DATABASE IF EXISTS users; # 如果存在就删除
 
 # 修改数据库 (字符集和排序规则,一般右键数据库直接改)
 ALTER DATABASE users  CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;