/*
MySQL Backup
Database: codewhy_node
Backup Time: 2022-12-23 15:37:23
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `codewhy_node`.`avatar`;
DROP TABLE IF EXISTS `codewhy_node`.`comment`;
DROP TABLE IF EXISTS `codewhy_node`.`dynamic`;
DROP TABLE IF EXISTS `codewhy_node`.`dynamic_label`;
DROP TABLE IF EXISTS `codewhy_node`.`label`;
DROP TABLE IF EXISTS `codewhy_node`.`pictures`;
DROP TABLE IF EXISTS `codewhy_node`.`users`;
CREATE TABLE `avatar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `mimetype` varchar(30) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `dynamic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dynamic_id` (`dynamic_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`dynamic_id`) REFERENCES `dynamic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `dynamic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `user_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updataAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dynamic_ibfk_1` (`user_id`),
  CONSTRAINT `dynamic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `dynamic_label` (
  `dynamic_id` int NOT NULL,
  `label_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dynamic_id`,`label_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `dynamic_label_ibfk_1` FOREIGN KEY (`dynamic_id`) REFERENCES `dynamic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dynamic_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `pictures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `mimetype` varchar(30) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `dynamic_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updataAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sex` varchar(10) DEFAULT NULL,
  `headurl` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `open_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
BEGIN;
LOCK TABLES `codewhy_node`.`avatar` WRITE;
DELETE FROM `codewhy_node`.`avatar`;
INSERT INTO `codewhy_node`.`avatar` (`id`,`filename`,`mimetype`,`size`,`user_id`,`createAt`,`updateAt`,`path`) VALUES (15, '1668356362046.png', 'image/png', 93800, 46, '2022-11-14 00:19:22', '2022-11-14 00:19:22', 'uploads\\avatar\\1668356362046.png'),(16, '1668356385024.jpg', 'image/jpeg', 65725, 46, '2022-11-14 00:19:45', '2022-11-14 00:19:45', 'uploads\\avatar\\1668356385024.jpg'),(17, '1668386271636.png', 'image/png', 93800, 37, '2022-11-14 08:37:51', '2022-11-14 08:37:51', 'uploads\\avatar\\1668386271636.png'),(18, '1668386739569.png', 'image/png', 93800, 37, '2022-11-14 08:45:39', '2022-11-14 08:45:39', 'uploads\\avatar\\1668386739569.png'),(19, '1668386827291.png', 'image/png', 232541, 37, '2022-11-14 08:47:07', '2022-11-14 08:47:07', 'uploads\\avatar\\1668386827291.png'),(20, '1668386917318.png', 'image/png', 169913, 37, '2022-11-14 08:48:37', '2022-11-14 08:48:37', 'uploads\\avatar\\1668386917318.png'),(21, '1668386972780.png', 'image/png', 93800, 37, '2022-11-14 08:49:33', '2022-11-14 08:49:33', 'uploads\\avatar\\1668386972780.png'),(22, '1668387009569.png', 'image/png', 20241, 37, '2022-11-14 08:50:09', '2022-11-14 08:50:09', 'uploads\\avatar\\1668387009569.png'),(23, '1668393374268.jpg', 'image/jpeg', 4711, 37, '2022-11-14 10:36:15', '2022-11-14 10:36:15', 'uploads\\avatar\\1668393374268.jpg'),(24, '1668393474056.jpg', 'image/jpeg', 4711, 37, '2022-11-14 10:37:54', '2022-11-14 10:37:54', 'uploads\\avatar\\1668393474056.jpg'),(25, '1668393533524.jpg', 'image/jpeg', 4711, 37, '2022-11-14 10:38:54', '2022-11-14 10:38:54', 'uploads\\avatar\\1668393533524.jpg'),(26, '1668393764419.jpg', 'image/jpeg', 4711, 37, '2022-11-14 10:42:45', '2022-11-14 10:42:45', 'uploads\\avatar\\1668393764419.jpg'),(27, '1668393770168.jpg', 'image/jpeg', 6103, 37, '2022-11-14 10:42:52', '2022-11-14 10:42:52', 'uploads\\avatar\\1668393770168.jpg'),(28, '1668393782687.png', 'image/png', 380341, 37, '2022-11-14 10:43:03', '2022-11-14 10:43:03', 'uploads\\avatar\\1668393782687.png'),(29, '1668394641573.jpg', 'image/jpeg', 6103, 37, '2022-11-14 10:57:22', '2022-11-14 10:57:22', 'uploads\\avatar\\1668394641573.jpg'),(30, '1668394707895.ico', 'image/vnd.microsoft.icon', 4286, 37, '2022-11-14 10:58:28', '2022-11-14 10:58:28', 'uploads\\avatar\\1668394707895.ico'),(31, '1668398058175.jpg', 'image/jpeg', 442239, 37, '2022-11-14 11:54:19', '2022-11-14 11:54:19', 'uploads\\avatar\\1668398058175.jpg'),(32, '1668398196569.png', 'image/png', 98094, 37, '2022-11-14 11:56:37', '2022-11-14 11:56:37', 'uploads\\avatar\\1668398196569.png'),(33, '1668398206432.jpg', 'image/jpeg', 1052086, 37, '2022-11-14 11:56:47', '2022-11-14 11:56:47', 'uploads\\avatar\\1668398206432.jpg'),(34, '1668398272363.png', 'image/png', 98094, 37, '2022-11-14 11:57:53', '2022-11-14 11:57:53', 'uploads\\avatar\\1668398272363.png'),(35, '1668398386896.jpg', 'image/jpeg', 138116, 37, '2022-11-14 11:59:47', '2022-11-14 11:59:47', 'uploads\\avatar\\1668398386896.jpg'),(36, '1668402632538.jpg', 'image/jpeg', 12585, 37, '2022-11-14 13:10:33', '2022-11-14 13:10:33', 'uploads\\avatar\\1668402632538.jpg'),(37, '1668402721596.jpg', 'image/jpeg', 157117, 37, '2022-11-14 13:12:02', '2022-11-14 13:12:02', 'uploads\\avatar\\1668402721596.jpg'),(38, '1668403863795.jpg', 'image/jpeg', 157117, 37, '2022-11-14 13:31:04', '2022-11-14 13:31:04', 'uploads/avatar/1668403863795.jpg'),(39, '1668405167087.jpg', 'image/jpeg', 157117, 37, '2022-11-14 13:52:48', '2022-11-14 13:52:48', 'uploads\\avatar\\1668405167087.jpg'),(40, '1668443738975.png', 'image/png', 183883, 56, '2022-11-15 00:35:38', '2022-11-15 00:35:38', 'uploads\\avatar\\1668443738975.png'),(41, '1668527437730.jpg', 'image/jpeg', 1727238, 56, '2022-11-15 23:50:35', '2022-11-15 23:50:35', 'uploads\\avatar\\1668527437730.jpg'),(42, '1668527470333.jpeg', 'image/jpeg', 29584, 56, '2022-11-15 23:51:08', '2022-11-15 23:51:08', 'uploads\\avatar\\1668527470333.jpeg'),(43, '1668527551211.jpeg', 'image/jpeg', 33054, 46, '2022-11-15 23:52:29', '2022-11-15 23:52:29', 'uploads\\avatar\\1668527551211.jpeg'),(44, '1669010018409.jpg', 'image/jpeg', 6103, 37, '2022-11-21 13:53:40', '2022-11-21 13:53:40', 'uploads\\avatar\\1669010018409.jpg'),(45, '1669544449374.jpeg', 'image/jpeg', 69991, 69, '2022-11-27 18:20:49', '2022-11-27 18:20:49', 'uploads/avatar/1669544449374.jpeg'),(46, '1670165730565.jpeg', 'image/jpeg', 69991, 69, '2022-12-04 22:55:27', '2022-12-04 22:55:27', 'uploads\\avatar\\1670165730565.jpeg');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `codewhy_node`.`comment` WRITE;
DELETE FROM `codewhy_node`.`comment`;
INSERT INTO `codewhy_node`.`comment` (`id`,`content`,`dynamic_id`,`user_id`,`comment_id`,`createAt`,`updateAt`) VALUES (3, '添加的新评论1', 9, 37, NULL, NULL, NULL),(4, '添加的新评论1', 9, 37, NULL, NULL, NULL),(5, '添加的新评论1', 9, 37, NULL, NULL, NULL),(6, '添加的新评论1', 9, 37, NULL, NULL, NULL),(10, '添加的新评论1', 9, 37, NULL, NULL, NULL),(11, '添加的新评论1', 9, 37, NULL, NULL, NULL),(12, '添加的新评论1', 9, 37, NULL, NULL, NULL),(13, '添加的新评论1', 9, 37, NULL, NULL, NULL),(14, '添加的新评论1', 9, 37, NULL, NULL, NULL),(15, '添加的新评论1', 9, 37, NULL, NULL, NULL),(16, '添加的新评论1', 9, 37, NULL, NULL, NULL),(17, '添加的新评论1', 9, 37, NULL, NULL, NULL),(18, '添加的新评论1', 9, 37, NULL, NULL, NULL),(19, '添加的新评论21', 9, 37, NULL, NULL, NULL),(20, '添加的新评论21', 9, 37, NULL, NULL, NULL),(21, '11112213131313', 9, 37, NULL, NULL, NULL),(22, '11112213131313', 9, 37, NULL, NULL, NULL),(23, '11112213131313', 9, 37, NULL, NULL, NULL),(30, '11112213131313', 9, 37, NULL, NULL, NULL),(31, 'qq122222222222qq22222233', 9, 46, NULL, NULL, NULL),(32, '11112213131313', 9, 46, NULL, NULL, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `codewhy_node`.`dynamic` WRITE;
DELETE FROM `codewhy_node`.`dynamic`;
INSERT INTO `codewhy_node`.`dynamic` (`id`,`content`,`user_id`,`createAt`,`updataAt`) VALUES (8, '112222345646', 37, '2022-10-30 07:48:43', '2022-11-03 23:52:02'),(9, 'name_3.12_黄海是一个非常抠门的人范德萨范德萨范德萨范德萨范德萨范德萨111萨范德萨范德萨111111萨范德萨范德萨111111111', 37, '2022-10-30 07:48:43', '2022-11-15 00:29:13'),(10, 'name_4.12_黄海是一个非常抠门的人...', 37, '2022-10-30 07:48:44', '2022-10-30 07:50:03'),(11, 'name_5.12_黄海是一个非常抠门的人...', 37, '2022-10-30 07:48:45', '2022-10-30 07:50:07'),(15, 'name_9.12_黄海是一个非常抠门的人...', 37, '2022-10-30 07:48:49', '2022-10-30 07:50:26'),(17, 'name_11.12_黄海是一个非常抠门的人...', 37, '2022-10-30 07:48:50', '2022-10-30 07:50:35'),(18, 'name_12.12_黄海是一个非常抠门的人...', 37, '2022-10-30 07:48:51', '2022-10-30 07:50:40'),(20, '消极是一个非常抠门的人。。。', 37, '2022-11-02 10:56:30', '2022-11-02 10:56:30'),(21, '消极是一个非常抠门的人。。。', 37, '2022-11-02 14:43:40', '2022-11-02 14:43:40'),(22, '消极是一个非常抠门的人。。。', 37, '2022-11-02 16:39:15', '2022-11-02 16:39:15'),(25, '消极是一个非常抠门的人。。。', 46, '2022-11-03 13:48:37', '2022-11-03 13:48:37'),(26, '11消极是一个非常抠门的人。。。', 46, '2022-11-03 13:48:42', '2022-11-03 13:48:42'),(31, 'zhong发布了一个动态', 56, '2022-11-14 22:07:23', '2022-11-14 22:07:23'),(32, 'zhong发布了第二个动态', 56, '2022-11-14 22:07:31', '2022-11-14 22:07:31'),(79, '11消极是一个非常抠门的人。。。', 37, '2022-11-30 09:38:48', '2022-11-30 09:38:48');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `codewhy_node`.`dynamic_label` WRITE;
DELETE FROM `codewhy_node`.`dynamic_label`;
INSERT INTO `codewhy_node`.`dynamic_label` (`dynamic_id`,`label_id`,`createAt`,`updateAt`) VALUES (10, 1, '2022-11-11 10:32:32', '2022-11-11 10:32:32'),(10, 4, '2022-11-11 10:32:32', '2022-11-11 10:32:32'),(10, 5, '2022-11-11 10:46:00', '2022-11-11 10:46:00'),(25, 1, '2022-11-12 07:20:24', '2022-11-12 07:20:24'),(25, 4, '2022-11-12 07:20:24', '2022-11-12 07:20:24'),(26, 1, '2022-11-12 07:26:35', '2022-11-12 07:26:35'),(26, 4, '2022-11-12 07:26:35', '2022-11-12 07:26:35');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `codewhy_node`.`label` WRITE;
DELETE FROM `codewhy_node`.`label`;
INSERT INTO `codewhy_node`.`label` (`id`,`name`,`createAt`,`updateAt`) VALUES (1, '前端', '2022-11-10 14:09:20', '2022-11-10 14:09:20'),(3, '移动端', '2022-11-10 14:11:01', '2022-11-10 14:11:01'),(4, 'vue', '2022-11-10 22:36:08', '2022-11-10 22:36:08'),(5, 'react', '2022-11-10 22:36:16', '2022-11-10 22:36:16');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `codewhy_node`.`pictures` WRITE;
DELETE FROM `codewhy_node`.`pictures`;
INSERT INTO `codewhy_node`.`pictures` (`id`,`filename`,`mimetype`,`size`,`dynamic_id`,`user_id`,`path`,`createAt`,`updateAt`) VALUES (17, '1669193463421.jpg', 'image/jpeg', 4711, 19, 37, '/picture/2022-11-23/1669193463421.jpg', '2022-11-23 16:51:06', '2022-11-23 16:51:06'),(18, '1669193463424.jpg', 'image/jpeg', 4612, 19, 37, '/picture/2022-11-23/1669193463424.jpg', '2022-11-23 16:51:06', '2022-11-23 16:51:06'),(19, '1669193723198.jpg', 'image/jpeg', 4711, 19, 37, '/picture/2022-11-23/1669193723198.jpg', '2022-11-23 16:55:23', '2022-11-23 16:55:23'),(20, '1669193723202.jpg', 'image/jpeg', 4612, 19, 37, '/picture/2022-11-23/1669193723202.jpg', '2022-11-23 16:55:23', '2022-11-23 16:55:23'),(21, '1669512632410.png', 'image/png', 93800, 40, 56, '/picture/2022-11-27/1669512632410.png', '2022-11-27 09:30:32', '2022-11-27 09:30:32'),(22, '1669512632404.png', 'image/png', 169913, 40, 56, '/picture/2022-11-27/1669512632404.png', '2022-11-27 09:30:32', '2022-11-27 09:30:32'),(23, '1669515160932.png', 'image/png', 20241, 53, 37, '/picture/2022-11-27/1669515160932.png', '2022-11-27 10:12:45', '2022-11-27 10:12:45'),(24, '1669515160933.png', 'image/png', 183883, 53, 37, '/picture/2022-11-27/1669515160933.png', '2022-11-27 10:12:45', '2022-11-27 10:12:45'),(25, '1669523904216.jpg', 'image/jpeg', 415089, 54, 37, '/picture/2022-11-27/1669523904216.jpg', '2022-11-27 12:38:24', '2022-11-27 12:38:24'),(26, '1669523904225.jpg', 'image/jpeg', 330839, 54, 37, '/picture/2022-11-27/1669523904225.jpg', '2022-11-27 12:38:26', '2022-11-27 12:38:26'),(27, '1669523904221.jpg', 'image/jpeg', 245325, 54, 37, '/picture/2022-11-27/1669523904221.jpg', '2022-11-27 12:38:26', '2022-11-27 12:38:26'),(28, '1669524553175.jpg', 'image/jpeg', 6166558, 55, 37, '/picture/2022-11-27/1669524553175.jpg', '2022-11-27 12:49:12', '2022-11-27 12:49:12'),(29, '1669524622508.jpg', 'image/jpeg', 415089, 56, 37, '/picture/2022-11-27/1669524622508.jpg', '2022-11-27 12:50:21', '2022-11-27 12:50:21'),(30, '1669524639438.jpg', 'image/jpeg', 330839, 57, 37, '/picture/2022-11-27/1669524639438.jpg', '2022-11-27 12:50:38', '2022-11-27 12:50:38'),(31, '1669524639431.jpg', 'image/jpeg', 415089, 57, 37, '/picture/2022-11-27/1669524639431.jpg', '2022-11-27 12:50:39', '2022-11-27 12:50:39'),(32, '1669525387606.jpg', 'image/jpeg', 5937308, 58, 37, '/picture/2022-11-27/1669525387606.jpg', '2022-11-27 13:03:08', '2022-11-27 13:03:08'),(33, '1669525515831.png', 'image/png', 20241, 59, 37, '/picture/2022-11-27/1669525515831.png', '2022-11-27 13:05:14', '2022-11-27 13:05:14'),(34, '1669527169601.jpg', 'image/jpeg', 415089, 60, 37, '/picture/2022-11-27/1669527169601.jpg', '2022-11-27 13:32:50', '2022-11-27 13:32:50'),(35, '1669527169613.jpg', 'image/jpeg', 330839, 60, 37, '/picture/2022-11-27/1669527169613.jpg', '2022-11-27 13:32:51', '2022-11-27 13:32:51'),(36, '1669527169608.jpg', 'image/jpeg', 245325, 60, 37, '/picture/2022-11-27/1669527169608.jpg', '2022-11-27 13:32:51', '2022-11-27 13:32:51'),(37, '1669527712700.jpg', 'image/jpeg', 415089, 61, 37, '/picture/2022-11-27/1669527712700middle.jpg', '2022-11-27 13:41:53', '2022-11-27 13:41:53'),(38, '1669527712707.jpg', 'image/jpeg', 245325, 61, 37, '/picture/2022-11-27/1669527712707middle.jpg', '2022-11-27 13:41:53', '2022-11-27 13:41:53'),(39, '1669527738734.jpg', 'image/jpeg', 415089, 62, 37, '/picture/2022-11-27/1669527738734-middle.jpg', '2022-11-27 13:42:18', '2022-11-27 13:42:18'),(40, '1669527738739.jpg', 'image/jpeg', 245325, 62, 37, '/picture/2022-11-27/1669527738739-middle.jpg', '2022-11-27 13:42:20', '2022-11-27 13:42:20'),(41, '1669527850317.jpg', 'image/jpeg', 415089, 63, 37, '/picture/2022-11-27/1669527850317-small.jpg', '2022-11-27 13:44:11', '2022-11-27 13:44:11'),(42, '1669527850327.jpg', 'image/jpeg', 245325, 63, 37, '/picture/2022-11-27/1669527850327-small.jpg', '2022-11-27 13:44:12', '2022-11-27 13:44:12'),(43, '1669527850333.jpg', 'image/jpeg', 330839, 63, 37, '/picture/2022-11-27/1669527850333-small.jpg', '2022-11-27 13:44:12', '2022-11-27 13:44:12'),(44, '1669527984937.png', 'image/png', 20241, 64, 37, '/picture/2022-11-27/1669527984937-small.png', '2022-11-27 13:46:24', '2022-11-27 13:46:24'),(45, '1669528218118.jpg', 'image/jpeg', 7290666, 65, 37, '/picture/2022-11-27/1669528218118-small.jpg', '2022-11-27 13:50:17', '2022-11-27 13:50:17'),(46, '1669528827240.jpg', 'image/jpeg', 6166558, 66, 37, '/picture/2022-11-27/1669528827240-small.jpg', '2022-11-27 14:00:26', '2022-11-27 14:00:26'),(47, '1669528827292.jpg', 'image/jpeg', 1077880, 66, 37, '/picture/2022-11-27/1669528827292-small.jpg', '2022-11-27 14:00:30', '2022-11-27 14:00:30'),(48, '1669528827302.jpg', 'image/jpeg', 330839, 66, 37, '/picture/2022-11-27/1669528827302-small.jpg', '2022-11-27 14:00:30', '2022-11-27 14:00:30'),(49, '1669528827299.jpg', 'image/jpeg', 245325, 66, 37, '/picture/2022-11-27/1669528827299-small.jpg', '2022-11-27 14:00:30', '2022-11-27 14:00:30'),(50, '1669528827296.jpg', 'image/jpeg', 415089, 66, 37, '/picture/2022-11-27/1669528827296-small.jpg', '2022-11-27 14:00:30', '2022-11-27 14:00:30'),(51, '1669528827280.jpg', 'image/jpeg', 3280585, 66, 37, '/picture/2022-11-27/1669528827280-small.jpg', '2022-11-27 14:00:30', '2022-11-27 14:00:30'),(52, '1669532666069.jpg', 'image/jpeg', 5351692, 67, 37, '/picture/2022-11-27/1669532666069-small.jpg', '2022-11-27 15:04:26', '2022-11-27 15:04:26'),(53, '1669532782857.jpg', 'image/jpeg', 4969498, 68, 37, '/picture/2022-11-27/1669532782857-small.jpg', '2022-11-27 15:06:24', '2022-11-27 15:06:24'),(54, '1669532784040.jpg', 'image/jpeg', 4969498, 69, 37, '/picture/2022-11-27/1669532784040-small.jpg', '2022-11-27 15:06:31', '2022-11-27 15:06:31'),(55, '1669533621573.jpg', 'image/jpeg', 3280585, 70, 37, '/picture/2022-11-27/1669533621573-small.jpg', '2022-11-27 15:20:22', '2022-11-27 15:20:22'),(56, '1669533622040.jpg', 'image/jpeg', 1077880, 70, 37, '/picture/2022-11-27/1669533622040-small.jpg', '2022-11-27 15:20:22', '2022-11-27 15:20:22'),(57, '1669533622105.jpg', 'image/jpeg', 415089, 70, 37, '/picture/2022-11-27/1669533622105-small.jpg', '2022-11-27 15:20:22', '2022-11-27 15:20:22'),(58, '1669533622405.jpg', 'image/jpeg', 245325, 70, 37, '/picture/2022-11-27/1669533622405-small.jpg', '2022-11-27 15:20:22', '2022-11-27 15:20:22'),(59, '1669533622094.jpg', 'image/jpeg', 285233, 70, 37, '/picture/2022-11-27/1669533622094-small.jpg', '2022-11-27 15:20:27', '2022-11-27 15:20:27'),(60, '1669533622410.jpg', 'image/jpeg', 330839, 70, 37, '/picture/2022-11-27/1669533622410-small.jpg', '2022-11-27 15:20:27', '2022-11-27 15:20:27'),(61, '1669543797447.jpg', 'image/jpeg', 233729, 71, 37, '/picture/2022-11-27/1669543797447-small.jpg', '2022-11-27 18:09:57', '2022-11-27 18:09:57'),(62, '1669543835474.jpg', 'image/jpeg', 415089, 72, 37, '/picture/2022-11-27/1669543835474-small.jpg', '2022-11-27 18:10:36', '2022-11-27 18:10:36'),(63, '1669545803648.jpg', 'image/jpeg', 161647, 73, 70, '/picture/2022-11-27/1669545803648-small.jpg', '2022-11-27 18:43:22', '2022-11-27 18:43:22'),(64, '1669547792276.jpg', 'image/jpeg', 161647, 74, 37, '/picture/2022-11-27/1669547792276-small.jpg', '2022-11-27 19:16:31', '2022-11-27 19:16:31'),(65, '1669547839656.jpg', 'image/jpeg', 175730, 75, 37, '/picture/2022-11-27/1669547839656-small.jpg', '2022-11-27 19:17:18', '2022-11-27 19:17:18'),(66, '1669547874999.jpg', 'image/jpeg', 175730, 76, 37, '/picture/2022-11-27/1669547874999-small.jpg', '2022-11-27 19:17:53', '2022-11-27 19:17:53'),(67, '1669548022675.jpg', 'image/jpeg', 161647, 77, 37, '/picture/2022-11-27/1669548022675-small.jpg', '2022-11-27 19:20:21', '2022-11-27 19:20:21'),(68, '1669548625351.jpg', 'image/jpeg', 4157832, 78, 37, '/picture/2022-11-27/1669548625351-small.jpg', '2022-11-27 19:30:26', '2022-11-27 19:30:26');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `codewhy_node`.`users` WRITE;
DELETE FROM `codewhy_node`.`users`;
INSERT INTO `codewhy_node`.`users` (`id`,`name`,`passwd`,`createAt`,`updataAt`,`sex`,`headurl`,`display_name`,`open_id`) VALUES (37, 'lzo', '250cf8b51c773f3f8dc8b4be867a9a02', '2022-10-29 15:44:41', '2022-11-16 00:10:22', '男', '/avatar/1668405167087.jpg', '环海', NULL),(46, 'li', '250cf8b51c773f3f8dc8b4be867a9a02', '2022-11-02 21:55:43', '2022-11-16 00:10:22', '男', '/avatar/1668527551211.jpeg', '消极', NULL),(56, 'zhong', '250cf8b51c773f3f8dc8b4be867a9a02', '2022-11-04 00:16:08', '2022-11-16 00:44:21', '女', '/avatar/1668527470333.jpeg', '林详细', NULL),(63, 'lzo55', '250cf8b51c773f3f8dc8b4be867a9a02', '2022-11-13 18:42:37', '2022-11-13 18:42:37', NULL, NULL, NULL, NULL),(64, 'lzo1', '250cf8b51c773f3f8dc8b4be867a9a02', '2022-11-14 21:38:11', '2022-11-14 21:39:37', '男', NULL, '搜索', NULL),(65, 'lzo556', '250cf8b51c773f3f8dc8b4be867a9a02', '2022-11-19 19:53:39', '2022-11-19 19:53:39', NULL, NULL, NULL, NULL),(66, 'lzo55677', '250cf8b51c773f3f8dc8b4be867a9a02', '2022-11-21 20:42:26', '2022-11-21 20:42:26', NULL, NULL, NULL, NULL),(68, 'lzo566666', '250cf8b51c773f3f8dc8b4be867a9a02', '2022-11-24 14:47:08', '2022-11-24 14:47:08', NULL, NULL, NULL, NULL),(69, '9zYiojHM', '96e79218965eb72c92a549dd5a330112', '2022-11-24 15:36:52', '2022-12-04 22:55:30', '男', '/avatar/1670165730565.jpeg', '蜡笔小新', 'o-JkN5KCLf_7dmSFwYTZ9zYiojHM'),(70, 'cs1', 'c4ca4238a0b923820dcc509a6f75849b', '2022-11-27 18:30:48', '2022-11-27 18:30:48', NULL, NULL, NULL, NULL),(71, 'cs2', 'c81e728d9d4c2f636f067f89cc14862c', '2022-11-27 21:28:35', '2022-11-27 21:28:35', NULL, '/images/head_g.png', NULL, NULL),(72, 'cs3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2022-11-27 23:01:30', '2022-11-27 23:01:30', NULL, '/images/head_g.png', NULL, NULL);
UNLOCK TABLES;
COMMIT;
