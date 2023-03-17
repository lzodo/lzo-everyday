DELETE FROM users WHERE id >= 57 AND id <= 62;

ALTER TABLE users ADD open_id VARCHAR(100);
ALTER TABLE users ADD headurl VARCHAR(100);
ALTER TABLE users ADD display_name VARCHAR(100);

INSERT INTO `codewhy_node`.`users` (`name`, `passwd`, `createAt`, `updataAt`, `sex`, `headurl`, `display_name`, `open_id`) VALUES ( 'lzoxxun3', '250cf8b51c773f3f8dc8b4be867a9a02', '2023-02-27 13:56:40', '2023-02-27 13:56:40', NULL, '/images/head_g.png', NULL, NULL);