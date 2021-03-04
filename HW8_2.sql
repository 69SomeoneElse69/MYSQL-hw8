-- solution via JOIN but output only 10 youngest users with their number of likes
-- решение через JOIN (вторая часть задания) количаство лайков у 10 самых молодых пользователей от других пользователей
select users.first_name, count(likes.user_id) as total_likes, likes.target_type_id, profiles.birthday 
from users
join likes
on likes.user_id = users.id and likes.target_type_id = '2'
join profiles
on profiles.user_id = users.id
GROUP BY likes.user_id 
ORDER BY profiles.birthday DESC
LIMIT 10;


-- решение первой части задания с подсчетом общей суммы лайков подходящих под условия
select sum(total) from
(SELECT count(likes.user_id) as total
from profiles 
join likes
on likes.user_id = profiles.user_id and likes.target_type_id = '2'
GROUP BY likes.user_id
ORDER BY birthday desc
limit 10) total_likes;


-- попытка обьеденить оба решения в одну таблицу
select birthday, tipe, total 
FROM
(select birthday, likes.target_type_id as tipe, count(likes.user_id) as total
from profiles
join likes
on likes.user_id = profiles.user_id and likes.target_type_id = '2'
GROUP BY likes.user_id
ORDER BY birthday desc
limit 10) main_data
UNION ALL
SELECT null, "итого", sum(total)
from
(SELECT count(likes.user_id) as total
from profiles 
join likes
on likes.user_id = profiles.user_id and likes.target_type_id = '2'
GROUP BY likes.user_id
ORDER BY birthday desc
limit 10) total_likes;