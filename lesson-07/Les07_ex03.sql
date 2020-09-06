
-- Выведите список рейсов flights с русскими названиями городов.
CREATE DATABASE flight;
USE flight;

-- Создаем таблицы и заполняем их данными
CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  `FROM`    varchar(255),
  `TO`      varchar(255)
);
INSERT INTO flights (`from`, `to`)
  VALUES ('moscow', 'omsk'),
         ('novgorod', 'kazan'),
         ('irkutsk', 'moscow'),
         ('omsk', 'irkutsk'),
         ('moscow', 'kazan');

CREATE TABLE cities
(
  label varchar(255),
  name  varchar(255)
);
INSERT INTO cities
  VALUES ('moscow', 'Москва'),
         ('irkutsk', 'Иркутск'),
         ('novgorod', 'Новгород'),
         ('kazan', 'Казань'),
         ('omsk', 'Омск');

-- Итоговый запрос. Используется неявный INNER JOIN, т.к. привык к такому синтаксису на работе.
SELECT f.id,
       c1.name "FROM",
       c2.name "TO"
  FROM flights f,
       cities c1,
       cities c2
 WHERE f.`FROM` = c1.label
   AND f.`TO` = c2.label
 ORDER BY 1;

 