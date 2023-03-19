# DML 对表数据进行 添加、删除、修改等操作

# 插入数据
# INSERT INTO `students` VALUES (110,"liao",'1444','2022-10-10 12:33:00');  # 全表
INSERT INTO `students` (name,norepeat) VALUES ("liao2","144453d1"); #插入指定数据 


# 删除数据
DELETE FROM `students`; # 删除所有数据
DELETE FROM `students` WHERE id = 1;# 删除表中符合条件的数据

# 更新数据
UPDATE `students` SET name = '大都是', norepeat = '4589' WHERE id = 111; # 更新符合条件的数据
