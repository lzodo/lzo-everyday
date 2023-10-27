CREATE TABLE IF NOT EXISTS avatar (
	id INT PRIMARY key AUTO_INCREMENT,
	filename VARCHAR(50) NOT NULL UNIQUE,
	path VARCHAR(500) NOT NULL,
	size INT,
	user_id INT NOT null,
	mimetype VARCHAR(50),
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);