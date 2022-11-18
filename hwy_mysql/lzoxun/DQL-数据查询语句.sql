# DQL 从数据库中查询记录

# 普通查询
SELECT * FROM `students`; # 查询所有数据与字段
SELECT name,norepeat FROM `students`; # 查询指定字段
SELECT name as listName,norepeat FROM `students`; # 查询指定字段并起别名

# 条件判断查询
SELECT * FROM `students` WHERE `norepeat` >= 5; # 查询 norepeat >= 、= 、!=、<> 5 的记录

# 逻辑运算语句
SELECT * FROM `students` WHERE `norepeat` >= 5 AND `name` = 'liao8'; # 查询 大于5 并且 name 为liao8 的数据
SELECT * FROM `students` WHERE `norepeat` >= 5 && `norepeat` != 8; # 查询 大于5 并且 不等于8 的记录
SELECT * FROM `students` WHERE `norepeat` BETWEEN 5 AND 8; # 查询 5-8 的记录

SELECT * FROM `students` WHERE `norepeat` >= 5 OR `name` = 'liao1'; # 查询 大于5 或者 name 为liao1 的数据
SELECT * FROM `students` WHERE `norepeat` IS NULL; # 查询 norepeat 为 null 的记录
 
# 模糊查询
SELECT * FROM `students` WHERE `name` LIKE "%8%"; # % 表示任意个任意字符，只要 name 存在 8，就可以查出来
SELECT * FROM `students` WHERE `name` LIKE "__ao8"; # _ 表示一个任意字符
SELECT * FROM `students` WHERE `name` regexp '端|a|b'; # 正则查询
 
# 在列表中的，全都查
SELECT * FROM `students` WHERE `name` IN ('liao1','liao2','liao3');

# 对查询结果排序
SELECT * FROM `students` WHERE `name` LIKE "liao_" ORDER BY norepeat DESC, id ASC; # 将查到的记录通过 norepeat 字段进行降序,再同 id 升序

# 分页查询
SELECT * FROM students LIMIT 2 OFFSET 0; # 查询 2 条，偏移 0 ((pageSize-1)*pageNumber) 条 , 第一页，查出1-2条记录
SELECT * FROM students LIMIT 2 OFFSET 2; # 查询 2 条，偏移 2 ((pageSize-1)*pageNumber) 条 , 第二页，查出3-4条件记录
SELECT * FROM students LIMIT 2,2; # （LIMIT offset,limit）也行


# ============================================================
# 聚合操作 
SELECT SUM(norepeat) FROM `students`; # 对 int 类型列进行求和
SELECT SUM(norepeat) FROM `students` WHERE id > 124; # di 大于 124 的记录的norepeat 进行求和
SELECT AVG(norepeat) FROM `students`; # 求平均值 MAX() 最大值、MIN() 最小值、COUNT(*)  统计记录个数，
SELECT COUNT(DISTINCT norepeat) FROM `students`; # 统计个数并去重

# 分组 
# 因为 GROUP BY `group` 所以SELECT 后面可以加 group, 不然不能这么加的
SELECT `group`,AVG(norepeat),COUNT(*) FROM `students` GROUP BY `group`; # 用group分组，计算出每个种类数据，norepleat 的平均值，与记录个数

# HAVING 作用于组, 和 WHERE作用类似，但是它是在分组后进行过滤的
SELECT `group`,AVG(norepeat),COUNT(*) count FROM `students` GROUP BY `group` HAVING count = 2; 

# 通过 WHERE 过滤完再进行分组, WHERE 作用于表
SELECT `group`,AVG(norepeat),COUNT(*) count FROM `students` WHERE id > 121 GROUP BY `group`; 

-- IF语句  条件 成立 查什么，不成 查什么
SELECT name,IF(age=0,"年龄无效",age) age FROM `students`;


# 多表查询
# 主表中有时候，相同类型或组， 数据是很多的，当想给类型，添加额外属性，就需要利用新表，否则，主表每个相同类型都有相同的新属性，难以维护 
 

