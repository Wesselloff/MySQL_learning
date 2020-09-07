USE lesson_05;

SELECT *
  FROM users u 
 WHERE lower(DATE_FORMAT(u.birthday_at , '%M')) IN ('may', 'august');



