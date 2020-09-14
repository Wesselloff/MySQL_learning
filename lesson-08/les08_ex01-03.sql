-- 1. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT p.gender,
       count(1)
  FROM likes l,
       profiles p
 WHERE l.user_id = p.user_id
 GROUP BY p.gender
 ORDER BY 2 DESC
 LIMIT 1;
 
-- 2. Подсчитать общее количество лайков десяти самым молодым пользователям (сколько лайков получили 10 самых молодых пользователей).
SELECT sum(t.likes_cnt) 
  FROM (SELECT p.birthday,
               p.user_id,
               count(l.id) likes_cnt
          FROM profiles p
          LEFT JOIN likes l
            ON l.target_id = p.user_id
           AND l.target_type_id = 2
         GROUP BY p.birthday, p.user_id 
         ORDER BY 1 DESC
         LIMIT 10) t;
         
-- 3. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
--    (критерии активности необходимо определить самостоятельно).
SELECT u.id,
       count(p.id)
  FROM users u
  LEFT JOIN posts p
    ON p.user_id  = u.id
 GROUP BY u.id 
 ORDER BY 2, 1
 LIMIT 10;
  
 
