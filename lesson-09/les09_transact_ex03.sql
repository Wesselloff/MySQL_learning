------ 3. (по желанию) Пусть имеется таблица с календарным полем created_at. 
------    В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
------    Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходной таблице и 0, 
------    если она отсутствует.


USE sample; 

CREATE 
-- DROP 
TABLE dates
(
  created_at date
);

INSERT INTO dates
  VALUES ('2018-08-01'), 
         ('2018-08-04'), 
         ('2018-08-16'), 
         ('2018-08-17');
SELECT * FROM dates;

-- Генератор последовательных значений честно нагуглен, остальное - моё
SELECT dl.*,
       IF (d.created_at, 1, 0) date_present
  FROM (SELECT str_to_date('01.08.2018', '%d.%c.%Y') + INTERVAL (d1.val + d2.val + d4.val + d8.val + d16.val) DAY day_list
          FROM (SELECT 0 val UNION ALL SELECT 1 val) d1,
               (SELECT 0 val UNION ALL SELECT 2 val) d2,
               (SELECT 0 val UNION ALL SELECT 4 val) d4,
               (SELECT 0 val UNION ALL SELECT 8 val) d8,
               (SELECT 0 val UNION ALL SELECT 16 val) d16
       ) dl
  LEFT JOIN dates d
    ON d.created_at = dl.day_list
 WHERE dl.day_list <= '2018-08-31'
 ORDER BY 1;
