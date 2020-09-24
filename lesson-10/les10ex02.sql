--- 2. Задание на оконные функции
--- Построить запрос, который будет выводить следующие столбцы:
-- + имя группы
-- - среднее количество пользователей в группах
-- + самый молодой пользователь в группе
-- + самый старший пользователь в группе
-- + общее количество пользователей в группе
-- + всего пользователей в системе
-- + отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

SELECT DISTINCT c.id, c.name,
      -- sum(count(1) OVER (PARTITION BY c.id)),
       max(p.birthday) OVER (PARTITION BY c.id) youngest,
       min(p.birthday) OVER (PARTITION BY c.id) oldest,
       count(1) OVER (PARTITION BY c.id) members_count,
       (SELECT count(1) FROM users) users_total,
       count(1) OVER (PARTITION BY c.id) / (SELECT count(1) FROM users) * 100 percent
  FROM communities c,
       communities_users cu,
       profiles p
 WHERE c.id = cu.community_id
   AND cu.user_id = p.user_id
;

SELECT DISTINCT c.id, c.name,
       max(p.birthday) OVER (PARTITION BY c.id) youngest,
       min(p.birthday) OVER (PARTITION BY c.id) oldest,
       count(1) OVER (PARTITION BY c.id) members_count,
       count(p.user_id) OVER ()
  FROM profiles p
  LEFT JOIN communities_users cu
    ON cu.user_id = p.user_id
  LEFT JOIN communities c
    ON c.id = cu.community_id
   
;


SELECT * FROM communities_users cu WHERE cu.community_id = 2;
SELECT count(1) FROM users;
SELECT count(1) FROM profiles;
SELECT DISTINCT user_id FROM communities_users;
SELECT *
  FROM communities c,
       communities_users cu,
       profiles p
 WHERE c.id = cu.community_id
   AND cu.user_id = p.user_id
;
