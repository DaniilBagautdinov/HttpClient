with recursive cte1 as (
    select review_id, client_id, article from review where client_id = 2
    union
    select review.review_id, review.client_id, review.article from review
    join cte1 on review.client_id = cte1.client_id
)
select * from cte1;


with recursive cte2 as (
    select news_id, author_id, date from news where author_id != 1
    union
    select news.news_id, news.author_id, news.date from news
    join cte2 on news.author_id = cte2.author_id
)
select * from cte2