------ 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
------    Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

-- Готовим тестовые данные
CREATE TABLE sample.messages AS SELECT * FROM vk.messages;
USE sample;

-- Если в таблице есть столбец с уникальными значениями, то всё просто:
DELETE 
-- SELECT *
  FROM messages mm
 WHERE mm.id NOT IN (SELECT m.id 
                       FROM (SELECT * 
                               FROM messages
                              ORDER BY created_at DESC 
                              LIMIT 5
                            ) m
                    ); 

-- Если уникального столбца нет, то в таблице может остаться больше пяти сообщений, если есть совпадающие даты
DELETE 
-- SELECT *
  FROM messages mm
 WHERE mm.created_at < (SELECT min(m.created_at) 
                          FROM (SELECT * 
                                  FROM messages 
                                 ORDER BY created_at DESC 
                                 LIMIT 5
                                ) m
                       );
