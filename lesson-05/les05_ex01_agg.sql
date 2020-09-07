USE lesson_05;

SELECT AVG(timestampdiff(YEAR, birthday_at, now())) age FROM users;
