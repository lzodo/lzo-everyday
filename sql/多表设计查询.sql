CREATE TABLE IF NOT EXISTS `brand` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	website VARCHAR(100),
	phoneRank INT
);

INSERT INTO `brand` (name,website,phoneRank) VALUES ('华为','www.huawei.com',2);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('联想','www.lianxiang.com',4);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('戴尔','www.daier.com',3);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('苹果','www.pingguo.com',10);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('小米','www.xiaomi.com',5);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('oppo','www.oppo.com',8);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('京东','www.jingdong.com',7);
INSERT INTO `brand` (name,website,phoneRank) VALUES ('谷歌','www.google.com',9);

CREATE TABLE IF NOT EXISTS `products` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	brand VARCHAR(20),
	title VARCHAR(100),
	price FLOAT,
	url VARCHAR(100),
	score FLOAT
);

INSERT INTO `products` (brand,price,url,title,score) VALUES ('华为',6666,'www.xxxxx.com','华为 nova 2',8.5); # 添加数据
INSERT INTO `products` (brand,price,url,title,score) VALUES ('华为',7777,'www.xxxxx.com','华为 nova 3',9.);

# 给 products 添加 brand 的外键
ALTER TABLE `products` ADD `brand_id` INT;
ALTER TABLE `products` ADD FOREIGN KEY(brand_id) REFERENCES brand(id); # 设置成外键，并添加外键约束 （brand_id 必须是 brand表中存在的id）

# 设置brand_id
UPDATE `products` SET `brand_id` = 1 WHERE `brand` = '华为'; # 因为 brand 中华为的id就是1
UPDATE `products` SET `brand_id` = 5 WHERE `brand` = 'oppo';
UPDATE `products` SET `brand_id` = 4 WHERE `brand` = '小米';

# 修改和删除被当做外键引用了的id (id 默认不能修改)
# 从工具中表右键 - 设计表 - 外键 有一个删除时的值 RESTRICT ，更新时的值 RESTRICT，界面可以直接修改状态
# 将它们的值 从RESTRICT 该为 CASCADE ，如果id改了，子集引用了这个id的外键会自动更新
# 将它们的值 从RESTRICT 该为 SET NULL ，如果id改了，子集引用了这个id的外键会自动变 NULL

# SQL 语句修改
SHOW CREATE TABLE `products`; # 查看外键的表 的 创建表的语句，哪里有外键关联信息
ALTER TABLE `products` DROP FOREIGN KEY products_ibfk_1; # 根据名称删除外键
# 重新关联外键，并指定更新时的值为 CASCADE 删除时的默认(如果删除也设置成 CASCADE 那么，父一删除，关联它的id外键也会全部删除)
ALTER TABLE `products` ADD FOREIGN KEY (brand_id) REFERENCES brand(id) ON UPDATE CASCADE ON DELETE RESTORE;

 
# 多表查询 SQL JOIN
# 1、左连接，查询表 products 和 brand 的数据，通过products.brand_id 和 brand.id 进行关联;

# 作用 以左表为主，查询出 pruducts 所有数据，在把右表中 id 等于 左表 brand_id 的记录，追加到对应记录后面，
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id;

# 作用 以左表为主，查询出 pruducts 所有数据，在把右表中 id 等于 左表 brand_id 的记录删除，只留下左表独有的数据
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id WHERE brand.id IS NULL;

#=================
# 2、右连接，查询表 products 和 brand 的数据，通过products.brand_id 和 brand.id 进行关联;

# 作用 以右表为主，查询出 brand 所有数据，在左表中 brand_id 等于 右表 id 的记录，追加到对应记录前面
SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id;

# 作用 以右表为主，查询出 brand 所有数据，在左表中 brand_id 等于 右表 id 的记录删除，只留下右边表独有的数据
SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id WHERE products.brand_id IS NULL;

#=================
# 3、内连接 查找products.brand_id 能关联上 brand.id , brand.id 也能关联上 products.brand_id 的记录

SELECT * FROM `products` JOIN `brand` ON products.brand_id = brand.id;

#=================
# 4、全连接 （左连接 + 有连接 + 删除重复）
(SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id)
UNION
(SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id);
 
# 去交集 只要左边关联不到右边，右边也关联不到左边的数据
(SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id WHERE brand.id IS NULL)
UNION
(SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id WHERE products.brand_id IS NULL);
 