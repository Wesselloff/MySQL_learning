USE lesson_05;

SELECT DATE_FORMAT(str_to_date(CONCAT(YEAR(now()), DATE_FORMAT(u.birthday_at, '-%m-%d')), '%Y-%m-%d'), '%W') week_day,
       COUNT(1) cnt
  FROM users u
 GROUP BY week_day
 ORDER BY 2 DESC;

