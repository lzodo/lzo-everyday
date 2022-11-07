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

SELECT
	c.id id,c.content content,c.dynamic_id dynamicId,c.comment_id commentId,c.createAt createTime,
	JSON_OBJECT('id',u.id,'name',u.name,'createTime',u.createAt)
	FROM comment c LEFT JOIN users u ON c.user_id = u.id
	WHERE c.id = 31;

# 多对多
# 点赞 （ 一个用户可以给多条动态点赞，一个动态可以被多个用户点赞 ）
#		dyname_id + 点赞用户的 user_id 建立关系表
# 标签  ( 一个动态可以有多个标签，一个标签可以属于多个动态 ) 



