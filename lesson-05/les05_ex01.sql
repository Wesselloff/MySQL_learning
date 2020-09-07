CREATE DATABASE lesson_05;
USE lesson_05;
DROP TABLE users_1;
CREATE TABLE users_1 (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  first_name varchar(100) NOT NULL COMMENT 'Имя пользователя',
  last_name varchar(100) NOT NULL COMMENT 'Фамилия пользователя',
  email varchar(100) NOT NULL COMMENT 'Почта',
  phone varchar(100) NOT NULL COMMENT 'Телефон',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  UNIQUE KEY email (email),
  UNIQUE KEY phone (phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';

INSERT INTO users_1 (id,first_name,last_name,email,phone,created_at,updated_at) VALUES 
(1,'Elvie','Lebsack','maia17@example.net','1-519-458-2043x74478','1991-08-26 06:41:03','2013-09-05 08:57:41')
,(2,'Brenda','Okuneva','myrtie.haley@example.com','03328327923','1996-06-03 06:29:28',NULL)
,(3,'Murray','Torphy','beier.ian@example.com','1-831-785-0721x498',NULL,'2020-09-06 21:20:34')
,(4,'Maye','Abernathy','dereck.bergnaum@example.net','(175)711-0553','2003-08-21 23:31:07','2018-12-08 11:11:11')
,(5,'Lindsay','Jacobi','jwisoky@example.org','(180)255-3436','1981-04-29 19:36:15',NULL)
,(6,'Mikel','Runolfsdottir','jordane11@example.net','+58(6)3601094719','1973-09-28 21:39:31','1984-07-16 03:41:52')
,(7,'Dillan','Yundt','treutel.salvador@example.net','069-509-0623','1988-02-10 01:17:08','2010-02-25 22:04:54')
,(8,'Ophelia','Fritsch','milo.beatty@example.net','125-161-9837x1154',NULL,NULL)
,(9,'Lela','Cartwright','olen07@example.org','488.517.4522x469','1985-12-15 00:14:34','2020-09-06 21:20:34')
,(10,'Lindsay','Schmidt','dahlia56@example.com','1-007-536-5571x713','2005-10-04 11:05:38',NULL)
,(11,'Asia','Lehner','oberbrunner.meghan@example.com','1-859-408-9183x339','2003-03-27 02:49:40','2020-09-06 21:20:34')
,(12,'Jace','Raynor','akerluke@example.org','+43(4)3143016327',NULL,'1992-01-21 03:40:32')
,(13,'Shany','Heaney','tre32@example.com','(023)353-6420x72594',NULL,'2020-09-06 21:20:34')
,(14,'Millie','Johnston','oparisian@example.org','(315)005-2803x602','2002-08-11 14:27:01',NULL)
,(15,'Montana','Cole','lorenzo.o''kon@example.net','498-459-8391x2823','2000-09-21 05:15:40','2020-09-06 21:20:34')
,(16,'Lucie','McGlynn','zullrich@example.org','(235)787-0142x871','2011-07-07 22:40:26','2020-09-06 21:20:34')
,(17,'Terrance','Dietrich','torphy.ian@example.com','743.434.9726',NULL,'2019-12-17 07:05:36')
,(18,'Abdul','Shields','nromaguera@example.com','547.308.7960x11327','1982-02-10 01:31:28','1994-05-23 13:15:36')
,(19,'Blaise','Moen','dcrona@example.net','218-575-0412x20058','1970-08-01 03:39:39','1996-07-10 20:51:31')
,(20,'Maegan','Adams','christop.bosco@example.org','1-296-364-0500x90849','2001-03-09 00:46:08','2020-09-06 21:20:34')
;

SHOW tables;
SELECT * FROM users_1;

-- Обновление полей по отдельности
UPDATE users_1
   SET created_at = now()
 WHERE created_at IS NULL;
UPDATE users_1 
   SET updated_at = now()
 WHERE updated_at IS NULL;

-- Обновление полей вместе. Неоптимально, на мой взгляд, но зато одним запросом. 
UPDATE users_1 
   SET created_at = ifnull(created_at, now()),
       updated_at = ifnull(updated_at, now())
 WHERE created_at IS NULL OR updated_at IS NULL;
 
 
