DELETE FROM users WHERE id >= 57 AND id <= 62;

ALTER TABLE users ADD open_id VARCHAR(100);
ALTER TABLE users ADD headurl VARCHAR(100);
ALTER TABLE users ADD display_name VARCHAR(100);