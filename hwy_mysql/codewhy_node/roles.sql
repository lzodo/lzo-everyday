CREATE TABLE IF NOT EXISTS roles (
	id INT PRIMARY key AUTO_INCREMENT,
	roleName VARCHAR(50) NOT NULL UNIQUE,
	roleKey VARCHAR(20) NOT NULL UNIQUE,
	roleSort INT NOT NULL DEFAULT 1,
	isEnable TINYINT(1) DEFAULT TRUE,
	remark VARCHAR(100),
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# 角色名称 roleName、权限字符 roleKey、角色顺序 roleSort、是否启用 enable、权限菜单 menuIds、备注 remark

ALTER TABLE `roles` CHANGE `roleName` `role_name` VARCHAR(50); 
ALTER TABLE `roles` CHANGE `roleKey` `role_key` VARCHAR(50); 
ALTER TABLE `roles` CHANGE `roleSort` `role_sort` INT; 
ALTER TABLE `roles` CHANGE `isEnable` `is_enable` TINYINT(1); 