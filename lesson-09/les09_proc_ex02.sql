------ 2.В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
------   Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
------   Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
------   При попытке присвоить полям NULL-значение необходимо отменить операцию.

USE shop;

-- DROP TRIGGER on_insert_products;
CREATE TRIGGER on_insert_products BEFORE INSERT ON products FOR EACH ROW 
BEGIN
  IF NEW.name IS NULL AND NEW.description IS NULL THEN
    SIGNAL SQLSTATE '45000' SET message_text = 'Поля NAME и DESCRIPTION не могут быть NULL одновременно.';
  END IF;
END

-- DROP TRIGGER on_update_products;
CREATE TRIGGER on_update_products BEFORE UPDATE ON products FOR EACH ROW 
BEGIN
  IF NEW.name IS NULL AND NEW.description IS NULL THEN
    SIGNAL SQLSTATE '45000' SET message_text = 'Поля NAME и DESCRIPTION не могут быть NULL одновременно.';
  END IF;
END


------ Триггеры создавал через DBeaver, чтобы не возиться с переназначением символа окончания команд
------ Проверка работоспособности делалась в консоли

den@ubuntu-server:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.21-0ubuntu0.20.04.4 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use shop;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> INSERT INTO products (name, description) VALUES (NULL, NULL);
ERROR 1644 (45000): Поля NAME и DESCRIPTION не могут быть NULL одновременно.
mysql> 
mysql> UPDATE products SET name = NULL, description = NULL WHERE id = 1;
ERROR 1644 (45000): Поля NAME и DESCRIPTION не могут быть NULL одновременно.
mysql> INSERT INTO products (name, description) VALUES ('Еще девайс', NULL);
Query OK, 1 row affected (0.02 sec)

mysql> select id, name, description from products;
+----+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| id | name                    | description                                                                                                                                         |
+----+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
|  1 | Intel Core i3-8100      | Процессор для настольных персональных компьютеров, основанных на платформе Intel.                                                                   |
|  2 | Intel Core i5-7400      | Процессор для настольных персональных компьютеров, основанных на платформе Intel.                                                                   |
|  3 | AMD FX-8320E            | Процессор для настольных персональных компьютеров, основанных на платформе AMD.                                                                     |
|  4 | AMD FX-8320             | Процессор для настольных персональных компьютеров, основанных на платформе AMD.                                                                     |
|  5 | ASUS ROG MAXIMUS X HERO | Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX                                                                          |
|  6 | Gigabyte H310M S2H      | Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX                                                                              |
|  7 | MSI B250M GAMING PRO    | Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX                                                                               |
|  9 | Еще девайс              | NULL                                                                                                                                                |
+----+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
8 rows in set (0.00 sec)

mysql> UPDATE products SET name = NULL, description = 'Еще девайс' WHERE id = 9;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select id, name, description from products;
+----+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| id | name                    | description                                                                                                                                         |
+----+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
|  1 | Intel Core i3-8100      | Процессор для настольных персональных компьютеров, основанных на платформе Intel.                                                                   |
|  2 | Intel Core i5-7400      | Процессор для настольных персональных компьютеров, основанных на платформе Intel.                                                                   |
|  3 | AMD FX-8320E            | Процессор для настольных персональных компьютеров, основанных на платформе AMD.                                                                     |
|  4 | AMD FX-8320             | Процессор для настольных персональных компьютеров, основанных на платформе AMD.                                                                     |
|  5 | ASUS ROG MAXIMUS X HERO | Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX                                                                          |
|  6 | Gigabyte H310M S2H      | Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX                                                                              |
|  7 | MSI B250M GAMING PRO    | Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX                                                                               |
|  9 | NULL                    | Еще девайс                                                                                                                                          |
+----+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
8 rows in set (0.00 sec)

mysql> 
mysql> exit;
Bye
den@ubuntu-server:~$ 

 