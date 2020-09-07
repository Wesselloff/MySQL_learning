USE lesson_05;

SELECT * 
  FROM catalogs c 
 WHERE id IN (5, 1, 2) 
 ORDER BY FIELD(id, 5, 1, 2);
