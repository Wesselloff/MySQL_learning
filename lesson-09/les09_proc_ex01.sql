------ 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
------    С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
------    с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

USE sample;
-- DROP FUNCTION hello;

CREATE FUNCTION hello()
RETURNS varchar(100) DETERMINISTIC 

BEGIN
   DECLARE hours int DEFAULT HOUR(now());
   DECLARE str varchar(100);

   IF (hours >=0 AND hours < 6) THEN
     SET str = 'Доброй ночи!';
   ELSEIF (hours >= 6 AND hours < 12) THEN
     SET str = 'Доброе утро!';
   ELSEIF (hours >= 12 AND hours < 18) THEN
     SET str = 'Добрый день!';
   ELSE
     SET str = 'Доброй ночи!';
   END IF;
   
   RETURN str;
END

SELECT hello();
