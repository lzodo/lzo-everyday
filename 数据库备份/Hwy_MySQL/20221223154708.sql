/*
MySQL Backup
Database: lzoxun
Backup Time: 2022-12-23 15:47:11
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `lzoxun`.`brand`;
DROP TABLE IF EXISTS `lzoxun`.`courses`;
DROP TABLE IF EXISTS `lzoxun`.`products`;
DROP TABLE IF EXISTS `lzoxun`.`students`;
DROP TABLE IF EXISTS `lzoxun`.`students_select_courses`;
CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `phoneRank` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_ibfk_2` (`brand_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int DEFAULT NULL,
  `norepeat` varchar(10) DEFAULT NULL,
  `group` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `norepeat` (`norepeat`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `students_select_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `students_id` int NOT NULL,
  `courses_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `students_id` (`students_id`),
  KEY `courses_id` (`courses_id`),
  CONSTRAINT `students_select_courses_ibfk_1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `students_select_courses_ibfk_2` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
BEGIN;
LOCK TABLES `lzoxun`.`brand` WRITE;
DELETE FROM `lzoxun`.`brand`;
INSERT INTO `lzoxun`.`brand` (`id`,`name`,`website`,`phoneRank`) VALUES (2, '戴尔', 'www.daier.com', 3),(3, '苹果', 'www.pingguo.com', 10),(4, '小米', 'www.xiaomi.com', 5),(5, 'oppo', 'www.oppo.com', 8),(6, '京东', 'www.jingdong.com', 7),(7, '谷歌', 'www.google.com', 9),(8, '联想', 'www.lianxiang.com', 4),(100, '华为', 'www.huawei.com', 2);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `lzoxun`.`courses` WRITE;
DELETE FROM `lzoxun`.`courses`;
INSERT INTO `lzoxun`.`courses` (`id`,`name`,`price`) VALUES (1, '语文', 88),(2, '数学', 87),(3, '英语', 48),(4, '历史', 45),(5, '化学', 68);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `lzoxun`.`products` WRITE;
DELETE FROM `lzoxun`.`products`;
INSERT INTO `lzoxun`.`products` (`id`,`brand`,`title`,`price`,`url`,`score`,`brand_id`) VALUES (1, '华为', '华为 nova 2', 6666, 'www.xxxxx.com', 8.5, 100),(2, '华为', '华为 nova 3', 7777, 'www.xxxxx.com', 8.6, 100),(3, '华为', '华为 nova 4', 4599, 'www.xxxxx.com', 7.6, 100),(4, '华为', '华为 nova 5', 2899, 'www.xxxxx.com', 8.9, 100),(5, '苹果', 'iPhone 5', 2899, 'www.xxxxx.com', 5.9, NULL),(6, '苹果', 'iPhone 6', 3899, 'www.xxxxx.com', 8.9, NULL),(7, '苹果', 'iPhone 9', 7899, 'www.xxxxx.com', 9.9, NULL),(8, '小米', 'mini 10', 4899, 'www.xxxxx.com', 8.9, 4),(9, '小米', 'mini 11', 5899, 'www.xxxxx.com', 8.2, 4),(10, '小米', 'mini 12', 8899, 'www.xxxxx.com', 7.2, 4),(11, 'oppo', 'oppo 8', 8899, 'www.xxxxx.com', 7.2, 5);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `lzoxun`.`students` WRITE;
DELETE FROM `lzoxun`.`students`;
INSERT INTO `lzoxun`.`students` (`id`,`name`,`age`,`norepeat`,`group`) VALUES (1, 'stu1', 18, '1', '语文'),(2, 'stu2', 17, '2', '语文'),(3, 'stu3', 17, '3', '数学'),(4, 'stu4', 18, '4', '数学'),(5, 'stu5', 19, '5', '数学'),(6, 'stu6', 16, '6', '计算机'),(7, 'stu7', 0, '7', '计算机');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `lzoxun`.`students_select_courses` WRITE;
DELETE FROM `lzoxun`.`students_select_courses`;
INSERT INTO `lzoxun`.`students_select_courses` (`id`,`students_id`,`courses_id`) VALUES (1, 1, 1),(2, 1, 2),(3, 3, 1),(4, 3, 4);
UNLOCK TABLES;
COMMIT;
