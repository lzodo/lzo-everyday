# DDL 数据定义语句，对数据库或表进行 创建、删除、修改等操作 之 表的操作

# 查看所有表
SHOW TABLES;

# 新建表
CREATE TABLE IF NOT EXISTS `students` (  # 如果不存在就创建
  `id` INT PRIMARY KEY AUTO_INCREMENT, # 设置位主键并自动递增
	`name` VARCHAR(10) NOT NULL, # 不能为空
	`norepeat` VARCHAR(10) UNIQUE, # 不能重复
	`age` INT DEFAULT 0 # 最后不能有逗号
);
-- PRIMARY KEY(name,age)

# 修改表名字
ALTER TABLE `students2` RENAME TO `students`;

# 添加新的列
ALTER TABLE `students` ADD `updateTime` TIMESTAMP;

# 修改字段名称
ALTER TABLE `students` CHANGE `updateTime` `createTime` TIMESTAMP; 

# 修改字段类型
ALTER TABLE `students` MODIFY `name` VARCHAR(30);
ALTER TABLE `students` MODIFY `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP; # 默认创建时间 CURRENT_TIMESTAMP 与 字段类型匹配
ALTER TABLE `students` MODIFY `updateTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; # 默认值为更新时候的时间 

# 删除一个字段
ALTER TABLE `students` DROP `age`;

# 查看表结构
DESC `students`;

# 根据表结构创建新表
CREATE TABLE `copytable2` LIKE `students`;

# 根据表结构和内容创建新表(包括内容一起创建)
CREATE TABLE `copytable3` (SELECT * FROM `students`);

# 查看创建表时使用的语句
SHOW CREATE TABLE `students`;

# 删除表
DROP TABLE IF EXISTS `students`; # 如果存在就删除