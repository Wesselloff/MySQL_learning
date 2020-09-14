------ 3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
------    Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
------    Вызов функции FIBONACCI(10) должен возвращать число 55.

USE shop;

-- DROP FUNCTION fibonacci;
CREATE FUNCTION fibonacci (num int UNSIGNED) 
RETURNS bigint UNSIGNED DETERMINISTIC

BEGIN
  DECLARE v_prev bigint UNSIGNED DEFAULT 0;
  DECLARE v_curr bigint UNSIGNED DEFAULT 1;
  DECLARE v_next bigint UNSIGNED;
  DECLARE i int UNSIGNED DEFAULT 1;
  WHILE i < num do
    SET v_next = v_prev + v_curr;
    SET v_prev = v_curr;
    SET v_curr = v_next;
    SET i = i + 1;
  END WHILE;
  IF num = 0 THEN
    SET v_curr = 0;
  END IF; 
  RETURN v_curr;
END

------ Проверки через консоль
den@ubuntu-server:~$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 27
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
mysql> select fibonacci(0);
+--------------+
| fibonacci(0) |
+--------------+
|            0 |
+--------------+
1 row in set (0.00 sec)

mysql> select fibonacci(1);
+--------------+
| fibonacci(1) |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)

mysql> select fibonacci(2);
+--------------+
| fibonacci(2) |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)

mysql> select fibonacci(3);
+--------------+
| fibonacci(3) |
+--------------+
|            2 |
+--------------+
1 row in set (0.00 sec)

mysql> select fibonacci(10);
+---------------+
| fibonacci(10) |
+---------------+
|            55 |
+---------------+
1 row in set (0.00 sec)

mysql> exit;
Bye
den@ubuntu-server:~$ 

