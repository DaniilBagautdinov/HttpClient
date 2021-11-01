select review.article, client.client_name
from review
inner join client on client.client_id = review.client_id;

select news.news, journalist.journalist_name
from news
inner join journalist on journalist.journalist_id = news.author_id;

select * from review left join client on review.client_id = client.client_id;
select * from news left join journalist on news.author_id = journalist.journalist_id;


select * from review right join client on review.client_id = client.client_id;
select * from news right join journalist on news.author_id = journalist.journalist_id;

select * from review full join client on review.client_id = client.client_id;
select * from news full join journalist on news.author_id = journalist.journalist_id;

select * from review cross join client;
select * from news cross join client;

select * from review natural join client;
select * from news natural join client;



SELECT e.article Employee, b.client_id Boss
FROM review e
JOIN client b ON b.client_id = e.client_id ORDER BY Boss;


SELECT g.client_id FROM client g
WHERE EXISTS(SELECT 1
             FROM review s
             WHERE s.client_id = g.client_id);



