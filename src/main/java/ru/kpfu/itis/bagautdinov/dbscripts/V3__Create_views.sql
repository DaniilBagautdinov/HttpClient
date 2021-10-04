CREATE VIEW reviews_for_news_check
AS SELECT *from review
WHERE news_id = 1
WITH LOCAL CHECK OPTION;

INSERT INTO reviews_for_news_check(review_id, client_id, news_id, article)
VALUES (5,3,1,'Hello');

CREATE VIEW author_of_the_news
AS SELECT *from news
WHERE author_id = 1
WITH LOCAL CHECK OPTION;

