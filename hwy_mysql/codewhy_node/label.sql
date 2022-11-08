

-- 创建label表
-- id
-- name createAt updateAt
CREATE TABLE IF NOT EXISTS label (
	id INT PRIMARY key AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- label 的增加查询

-- 创建动态和标签的关系表 dynamic_label

CREATE TABLE IF NOT EXISTS dynamic_lable (
	dynamic_id INT NOT NULL,
	label_id INT NOT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(dynamic_id, label_id), # 复合或联合主键
	FOREIGN KEY (dynamic_id) REFERENCES dynamic(id) ON DELETE CASCADE ON UPDATE CASCADE,   # 动态删除，这个关系表的记录同时删除，
	FOREIGN KEY (label_id) REFERENCES label(id) ON DELETE CASCADE ON UPDATE CASCADE  # 标签删除，这个关系表的记录同时删除
)


-- 给动态添加标签
-- 得到用户传入的标签名 
-- label中间件验证用户传入的标签是否存在
-- 得到标签名与标签id的数据列表放到ctx中

 
--  判断动态是否以及存在某个标签（通过dynamic_id和label_id能否查询出记录），不存在则建立关系