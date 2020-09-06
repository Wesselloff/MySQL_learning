USE shop;
-- Задание 1 ------------------------------------------------------------------
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
INSERT INTO orders (user_id)
  VALUES (1),
  	     (3),
  	     (4),
  	     (1),   	     
  	     (2),   	     
  	     (3),
  	     (1),
  	     (5),
  	     (3),
  	     (4),
  	     (1);

SELECT * FROM orders;
SELECT * FROM users WHERE id IN (SELECT user_id FROM orders);
 
-- Задание 2 ------------------------------------------------------------------
-- Выведите список товаров products и разделов catalogs, который соответствует товару.  	     

SELECT *
  FROM products p
  JOIN catalogs c
    ON c.id = p.catalog_id;

-- Через неявный INNER JOIN
SELECT *
  FROM products p,
       catalogs c
 WHERE c.id = p.catalog_id;

 