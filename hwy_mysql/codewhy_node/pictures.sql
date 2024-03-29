# 动态图片
CREATE TABLE IF NOT EXISTS `pictures` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	filename VARCHAR(255) NOT NULL UNIQUE,
	mimetype VARCHAR(30),
	size INT,
	dynamic_id INT,
	user_id INT,
	path VARCHAR(255),
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

DELETE FROM pictures;