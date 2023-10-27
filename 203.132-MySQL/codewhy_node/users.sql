CREATE TABLE IF NOT EXISTS users (
	id INT PRIMARY key AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	passwd CHAR(50) NOT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `users` ADD `sex` VARCHAR(20);
ALTER TABLE `users` ADD `headurl` VARCHAR(20);
ALTER TABLE `users` ADD `display_name` VARCHAR(20);