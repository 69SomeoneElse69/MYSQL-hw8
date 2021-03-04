SELECT (select gender from profiles where id = user_id) as GENDER, 
(select name from target_types tt where target_type_id = id) as WHO
  FROM likes where target_type_id = '2'
 ORDER BY GENDER DESC
LIMIT 1; 

 
 
-- решение через JOIN  
 SELECT profiles.gender ,count(profiles.user_id) as total
 FROM likes
left JOIN profiles
on profiles.user_id = likes.user_id and likes.target_type_id = '2'
group by profiles.gender 
ORDER BY total desc
limit 1;



-- решение через JOIN  
 SELECT profiles.gender ,count(likes.id) as total
 FROM likes
JOIN profiles
on profiles.user_id = likes.user_id and likes.target_type_id = '2'
group by profiles.gender 
ORDER BY total desc;