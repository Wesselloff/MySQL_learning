USE lesson_05;
-- Создаем таблицу с заведомо неверными типами столбца
CREATE TABLE users_2 (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  first_name varchar(100) NOT NULL COMMENT 'Имя пользователя',
  last_name varchar(100) NOT NULL COMMENT 'Фамилия пользователя',
  email varchar(100) NOT NULL COMMENT 'Почта',
  phone varchar(100) NOT NULL COMMENT 'Телефон',
  created_at varchar(100) COMMENT 'Время создания строки',
  updated_at varchar(100) COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  UNIQUE KEY email (email),
  UNIQUE KEY phone (phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';

-- Заполняем данными
INSERT INTO users_2 (first_name,last_name,email,phone,created_at,updated_at) VALUES 
('Elvie','Lebsack','maia17@example.net','1-519-458-2043x74478','26.08.1991 03:41','05.09.2013 04:57')
,('Brenda','Okuneva','myrtie.haley@example.com','03328327923','03.06.1996 02:29','06.09.2020 18:20')
,('Murray','Torphy','beier.ian@example.com','1-831-785-0721x498','01.03.2001 03:21','06.09.2020 18:20')
,('Maye','Abernathy','dereck.bergnaum@example.net','(175)711-0553','21.08.2003 19:31','08.12.2018 08:11')
,('Lindsay','Jacobi','jwisoky@example.org','(180)255-3436','29.04.1981 15:36','06.09.2020 18:20')
,('Mikel','Runolfsdottir','jordane11@example.net','+58(6)3601094719','28.09.1973 18:39','15.07.1984 23:41')
,('Dillan','Yundt','treutel.salvador@example.net','069-509-0623','09.02.1988 22:17','25.02.2010 19:04')
,('Ophelia','Fritsch','milo.beatty@example.net','125-161-9837x1154','03.09.2004 12:28','18.04.2020 02:41')
,('Lela','Cartwright','olen07@example.org','488.517.4522x469','14.12.1985 21:14','06.09.2020 18:20')
,('Lindsay','Schmidt','dahlia56@example.com','1-007-536-5571x713','04.10.2005 07:05','06.09.2020 18:20')
,('Asia','Lehner','oberbrunner.meghan@example.com','1-859-408-9183x339','26.03.2003 23:49','06.09.2020 18:20')
,('Jace','Raynor','akerluke@example.org','+43(4)3143016327','10.08.1972 06:26','21.01.1992 00:40')
,('Shany','Heaney','tre32@example.com','(023)353-6420x72594','17.07.1999 22:25','06.09.2020 18:20')
,('Millie','Johnston','oparisian@example.org','(315)005-2803x602','11.08.2002 10:27','20.12.2018 07:43')
,('Montana','Cole','lorenzo.o''kon@example.net','498-459-8391x2823','21.09.2000 01:15','06.09.2020 18:20')
,('Lucie','McGlynn','zullrich@example.org','(235)787-0142x871','07.07.2011 18:40','06.09.2020 18:20')
,('Terrance','Dietrich','torphy.ian@example.com','743.434.9726','01.12.1988 22:37','17.12.2019 04:05')
,('Abdul','Shields','nromaguera@example.com','547.308.7960x11327','09.02.1982 22:31','23.05.1994 09:15')
,('Blaise','Moen','dcrona@example.net','218-575-0412x20058','01.08.1970 00:39','10.07.1996 16:51')
,('Maegan','Adams','christop.bosco@example.org','1-296-364-0500x90849','08.03.2001 21:46','06.09.2020 18:20')
;

SELECT * FROM users_2;
-- Просмотр текстовых полей как даты
SELECT u.id,
       u.first_name,
       u.last_name,
       u.email,
       u.phone,
       str_to_date(u.created_at, '%d.%m.%Y %H:%i') created_at,
       str_to_date(u.updated_at, '%d.%m.%Y %H:%i') updated_at
  FROM users_2 u;

-- Обновляем даты строкой, меняя формат на соответствующий SQL
UPDATE users_2
   SET created_at = str_to_date(created_at, '%d.%m.%Y %H:%i'),
       updated_at = str_to_date(updated_at, '%d.%m.%Y %H:%i') 
;

-- Меняем типы столбцов
ALTER TABLE users_2
  MODIFY COLUMN created_at datetime,
  MODIFY COLUMN updated_at datetime
;

  
  