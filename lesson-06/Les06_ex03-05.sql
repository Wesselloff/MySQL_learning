-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT (SELECT p.gender FROM profiles p WHERE p.user_id = l.user_id) gender,
        count(1)
  FROM likes l
  GROUP BY gender
  ORDER BY 2 DESC
  LIMIT 1;
 
-- 4. Подсчитать общее количество лайков десяти самым молодым пользователям (сколько лайков получили 10 самых молодых пользователей).
SELECT sum(lc.like_cnt)
  FROM (SELECT (SELECT count(1) 
                  FROM likes l 
                 WHERE l.target_id = p.user_id 
                   AND l.target_type_id = 2
               ) like_cnt
          FROM profiles p
         ORDER BY p.birthday DESC 
         LIMIT 10
       ) lc;
-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
--    (критерии активности необходимо определить самостоятельно).

SELECT u.id,
       (SELECT count(1) FROM posts p WHERE p.user_id = u.id) post_cnt
  FROM users u
  ORDER BY 2, 1 
  LIMIT 10;
   
  
 