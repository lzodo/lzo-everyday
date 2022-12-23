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

CREATE TABLE IF NOT EXISTS `juhe_city` (
    id INT PRIMARY KEY AUTO_INCREMENT,
		country VARCHAR(30) NOT NULL COMMENT "国家",
		province VARCHAR(30) NOT NULL COMMENT "地区",
		city VARCHAR(30) NOT NULL COMMENT "城市"
);


DELETE FROM juhe_city WHERE country = '韩国';
SELECT COUNT(*) FROM juhe_city;
