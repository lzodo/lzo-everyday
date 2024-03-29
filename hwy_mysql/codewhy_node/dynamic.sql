CREATE TABLE IF NOT EXISTS `dynamic` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	content VARCHAR(1000) NOT NULL,
	user_id INT NOT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updataAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO dynamic (content,user_id) VALUES ("id 38 用户发表了动态",38);
INSERT INTO dynamic (content,user_id) VALUES ("id 41 用户发表了动态",41);


SELECT dy.id id,content,JSON_OBJECT("id",us.id,"name",us.name) as `users` FROM `dynamic` dy LEFT JOIN `users` us ON dy.user_id = us.id WHERE dy.id = 1; 
SELECT dy.id id,content,JSON_OBJECT("id",us.id,"name",us.name) as `users` FROM `dynamic` dy LEFT JOIN `users` us ON dy.user_id = us.id WHERE dy.content LIKE '%黄海%' LIMIT 3 OFFSET 2;


SELECT * FROM dynamic WHERE content LIKE '%海%';

SELECT * FROM `dynamic`;
DELETE FROM dynamic WHERE id >= 60;

SELECT 
		dy.id id,content,
		JSON_OBJECT('id',us.id,'name',us.name) as users,
		(SELECT COUNT(*) FROM dynamic_label WHERE dy.id = dynamic_label.dynamic_id) labelCount,
		IF(COUNT(lb.id),JSON_ARRAYAGG(JSON_OBJECT('id',lb.id,'name',lb.name)),null) as labels
FROM dynamic dy 
LEFT JOIN users us ON dy.user_id = us.id
LEFT JOIN dynamic_label dyla ON dy.id = dyla.dynamic_id
LEFT JOIN label lb ON dyla.label_id = lb.id  
GROUP BY dy.id
HAVING dy.content LIKE "%%%" LIMIT 0,10;

