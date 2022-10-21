# =========表的关系
# 一对一关系(我只有一个xxx，这个xxx也只是我一个人的)
# 一对多关系(树形状关系数据，手机品牌-> 多个型号)
# 多对多关系(一个学生选多门课，一门课可以被多个人选择)

CREATE TABLE IF NOT EXISTS students (
	id INT primary KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT null,
	age INT
);

CREATE TABLE IF NOT EXISTS courses (
	id INT primary KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT null,
	price DOUBLE
);

INSERT INTO `students` (name,age) VALUES ('stu1',18);
INSERT INTO `students` (name,age) VALUES ('stu2',17);
INSERT INTO `students` (name,age) VALUES ('stu3',17);
INSERT INTO `students` (name,age) VALUES ('stu4',18);
INSERT INTO `students` (name,age) VALUES ('stu5',19);
INSERT INTO `students` (name,age) VALUES ('stu6',16);
INSERT INTO `students` (name,age) VALUES ('stu7',15);

INSERT INTO `courses` (name,price) VALUES ('语文',88);
INSERT INTO `courses` (name,price) VALUES ('数学',87);
INSERT INTO `courses` (name,price) VALUES ('英语',48);
INSERT INTO `courses` (name,price) VALUES ('历史',45);
INSERT INTO `courses` (name,price) VALUES ('化学',68);

# 多对多实现
# 方案1 学生表添加课程表的id列表，查出学生列表，通过切割课程id列表就可以得到他选择的课程（两部查询,有很多缺点）
# 法案2 建立关系表
CREATE TABLE IF NOT EXISTS students_select_courses (
	id INT primary KEY AUTO_INCREMENT,
	students_id INT NOT NULL,
	courses_id INT NOT NULL,
	FOREIGN KEY (students_id) REFERENCES students(id) ON UPDATE CASCADE, # 关联students_id 和 students.id ,students.id 更新时，students_id 自动更新
	FOREIGN KEY (courses_id) REFERENCES courses(id) ON UPDATE CASCADE
);

# 学生选课  
# 1、勾选课程 提交 插入关系表
# stu1 选择了 语文数学
INSERT INTO `students_select_courses` (students_id,courses_id) VALUES (1,1); # 1同学 选择了 1课程
INSERT INTO `students_select_courses` (students_id,courses_id) VALUES (1,2); # 1同学 选择了 2课程

INSERT INTO `students_select_courses` (students_id,courses_id) VALUES (3,1); # 3同学 选择了 1课程
INSERT INTO `students_select_courses` (students_id,courses_id) VALUES (3,4); # 3同学 选择了 4课程

# 查询需求
# 1、查询有选课学生，选择了哪些课程（内连接查询 选了课的学生，和 courses_id）  别名 AS 可省略  
SELECT * FROM students AS stu 
	JOIN students_select_courses AS ssc ON stu.id = ssc.students_id
	JOIN courses crs ON ssc.courses_id = crs.id;# 得到的结果与课程表内连接，拿到它们的课程名称等其他信息

# 优化 去掉关联表的信息，和重名名课程表的字段名称
SELECT stu.id,stu.name,stu.age,crs.id crsId,crs.price,crs.name crsName 
	FROM students AS stu 
	JOIN students_select_courses AS ssc ON stu.id = ssc.students_id
	JOIN courses crs ON ssc.courses_id = crs.id;
	
# 2、查询所有学生的选课情况 （内连接 改成 左连接就行了）
SELECT stu.id,stu.name,stu.age,crs.id crsId,crs.price,crs.name crsName 
	FROM students AS stu 
	left JOIN students_select_courses AS ssc ON stu.id = ssc.students_id
	LEFT JOIN courses crs ON ssc.courses_id = crs.id;
	
# 3、查询哪些学生没有选课
SELECT stu.id,stu.name,stu.age
	FROM students AS stu 
	left JOIN students_select_courses AS ssc ON stu.id = ssc.students_id WHERE ssc.id IS NULL;
	
# 4、 查询哪些课程没被选择
SELECT * FROM courses AS crs RIGHT JOIN students_select_courses AS ssc ON crs.id = ssc.courses_id; #（？应该也可以的）

SELECT stu.id,stu.name,stu.age,crs.id crsId,crs.price,crs.name crsName 
	FROM students AS stu 
	RIGHT JOIN students_select_courses AS ssc ON stu.id = ssc.students_id
	RIGHT JOIN courses crs ON ssc.courses_id = crs.id
	WHERE stu.id IS NULL;
	
# 5、查询某个学生选择了哪些课程
SELECT stu.id,stu.name,stu.age,crs.id crsId,crs.price,crs.name crsName 
	FROM students AS stu 
	JOIN students_select_courses AS ssc ON stu.id = ssc.students_id
	JOIN courses crs ON ssc.courses_id = crs.id
	WHERE stu.id = 1;
