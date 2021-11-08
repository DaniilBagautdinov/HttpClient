create materialized view review_view as select * from review;
select * from review_view;

create materialized view news_view as select * from news;
select * from news_view;
