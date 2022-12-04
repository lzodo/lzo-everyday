CREATE TABLE IF NOT EXISTS `juhe_video` (
    id INT PRIMARY KEY AUTO_INCREMENT,
		title VARCHAR(500) NOT NULL,
		share_url VARCHAR(500) NOT NULL,
		author VARCHAR(20),
		item_cover VARCHAR(500) NOT NULL,
		hot_value INT,
		hot_words VARCHAR(100),
		play_count INT,
		digg_count INT,
		comment_count INT
);