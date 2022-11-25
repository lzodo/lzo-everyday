CREATE TABLE `t_user` ( 
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID', 
	`id_no` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '身份编号', 
	`username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名', 
	`age` int(11) DEFAULT NULL COMMENT '年龄', 
	`create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
	PRIMARY KEY (`id`), 
	KEY `union_idx` (`id_no`,`username`,`age`), 
	KEY `create_time_idx` (`create_time`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
select * from t_user where username = 'Tom2' and age = 12;
select id_no, username, age from t_user where username = 'Tom2';

select * from user where name='一灯'
select * from t_user where username = 'Tom2' and age = 12;
select id_no, username, age from t_user where username = 'Tom2'; 