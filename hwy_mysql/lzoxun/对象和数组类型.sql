# 一对多 转对象
SELECT brand.id,brand.name,brand.website,brand.phoneRank,
	JSON_OBJECT('id',products.id,'title',products.title,'brand',products.brand) as products
	FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id;
	
# 括号（）子查询
SELECT brand.id,brand.name,brand.website,brand.phoneRank,
	JSON_OBJECT('id',products.id,'title',products.title,'brand',products.brand) as products,
	(SELECT COUNT(*) FROM students ) stucount
	FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id;
	
	
# 合并
SELECT brand.id,brand.name,brand.website,brand.phoneRank,
	JSON_ARRAYAGG(JSON_OBJECT('id',products.id,'title',products.title)) products
	FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id
	GROUP BY brand.id;
# 多对多 转对象