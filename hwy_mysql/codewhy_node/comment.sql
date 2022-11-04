CREATE TABLE IF NOT EXISTS `comment` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	content VARCHAR(1000) not NULL,
	dynamic_id INT NOT NULL,
	user_id INT NOT NULL,
	comment_id INT,
	FOREIGN KEY(dynamic_id) REFERENCES dynamic(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(comment_id) REFERENCES comment(id) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT COUNT(*) FROM `comment`;

ALTER TABLE `comment` ADD `createAt` TIMESTAMP;
ALTER TABLE `comment` ADD `updateAt` TIMESTAMP;

ALTER TABLE `comment` MODIFY createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `comment` MODIFY updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
