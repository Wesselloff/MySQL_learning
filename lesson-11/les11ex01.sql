/* 1. Создайте таблицу logs типа Archive. 
 * Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
 * название таблицы, идентификатор первичного ключа и содержимое поля name.
 */

/* Таблица создана с engine = archive
 * Чтобы не было дублирования кода, сохранение значений в таблицу вынесено в отдельную процедуру,
 * которая вызывается из соответствующих триггеров на таблицах USERS, PRODUCTS, CATALOGS
 * 
 * Вывод консольного клиента сохранен в файле les11ex01_output.txt
 */

CREATE TABLE logs
(
  id serial,
  table_name varchar(255) comment 'Название логируемой таблицы',
  out_id bigint UNSIGNED comment 'ID добавленной записи в логируемую таблицу',
  name varchar(255) comment 'Значение поля "NAME" логируемой таблицы',
  created_at datetime DEFAULT current_timestamp comment 'Дата и время добавления записи'
) 
comment = 'Архивные данные' 
engine = archive;

delimiter //
CREATE PROCEDURE add_log (p_table_name varchar(255), p_out_id bigint UNSIGNED, p_name varchar(255))
BEGIN
  INSERT INTO logs (table_name, out_id, name)
    VALUES (p_table_name, p_out_id, p_name);
END// 

CREATE TRIGGER on_ai_users AFTER INSERT ON users FOR EACH ROW BEGIN
  CALL add_log('Users', NEW.id, NEW.name);
END//

CREATE TRIGGER on_ai_products AFTER INSERT ON products FOR EACH ROW BEGIN
  CALL add_log('Products', NEW.id, NEW.name);
END//

CREATE TRIGGER on_ai_catalogs AFTER INSERT ON catalogs FOR EACH ROW BEGIN
  CALL add_log('Catalogs', NEW.id, NEW.name);
END//

delimiter ;

INSERT INTO users (name) VALUES ('Петр Петрович');
INSERT INTO catalogs (name) VALUES ('Клавиатуры');
INSERT INTO products (name, description, price, catalog_id)
  VALUES ('Microsoft Natural Ergonomic Keyboard 4000', 'Клавиатура Microsoft изогнутая', 5000, 6);

SELECT * FROM users;
SELECT * FROM catalogs;
SELECT id, name, description, price, catalog_id FROM products;
SELECT * FROM logs;
