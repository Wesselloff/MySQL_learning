-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

/* Сначала была создана процедура million_users, которая "В лоб" добавляла пользователей, пробегая в цикле от 1 до 1000000. 
 * Запустив её, стало понятно, что на очень медленная - за 20 минут добавилось менее 150 тыс. записей. Запуск был прерван.
 * 
 * Затем был написан второй вариант процедуры, который сначала во временной таблице формирует пачку пользователей в 1000 штук, 
 * а потом 1000 раз добавляет её в таблицу USERS. Этот вариант отработал менее, чем за 1,5 минуты.
 * 
 * Вывод консольного клиента сохранен в файле les11ex02_output.txt
 */

delimiter //
CREATE PROCEDURE million_users()
BEGIN
  DECLARE i bigint UNSIGNED DEFAULT 1;
  DECLARE max_i bigint UNSIGNED DEFAULT 1000000;
  WHILE i <= max_i do
    INSERT INTO users (name) VALUES (concat('User_', i));
    SET i = i + 1;
  END WHILE;
END//
delimiter ;

SELECT COUNT(*) FROM users;
SELECT * FROM users LIMIT 100;
DELETE FROM users WHERE id > 8;

delimiter //
CREATE 
-- DROP 
PROCEDURE million_users_2()
BEGIN
  DECLARE i bigint UNSIGNED DEFAULT 0;
  DECLARE max_i bigint UNSIGNED DEFAULT 1000;
  DROP TABLE IF EXISTS user_buffer; 
  CREATE TEMPORARY TABLE user_buffer (name varchar(255), cnt int UNSIGNED);
  WHILE i < max_i do
    INSERT INTO user_buffer VALUES ('User_', i);
    SET i = i + 1;
  END WHILE;
  SET i = 0;
  WHILE i < max_i do
    INSERT INTO users (name) 
      SELECT concat(name, i * 1000 + cnt + 1) 
        FROM user_buffer;
    SET i = i + 1;
  END WHILE;
END// 
delimiter ;
