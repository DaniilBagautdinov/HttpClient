INSERT INTO client(client_id, client_name, client_surname, client_status)
VALUES (1, 'Daniil', 'Bagautdinov', 'Im ok');

INSERT INTO client(client_id, client_name, client_surname, client_status)
VALUES (2, 'Artem', 'Kalugin', 'Im ok');

INSERT INTO client(client_id, client_name, client_surname, client_status)
VALUES (3, 'Simen', 'Sokolov', 'Im ok');

INSERT INTO journalist(journalist_id, company, journalist_name, journalist_surname)
VALUES (1, 'Kamon', 'Albert', 'Qqqqq');

INSERT INTO journalist(journalist_id, company, journalist_name, journalist_surname)
VALUES (2, 'Kamon', 'Yqwe', 'Alqwe');

INSERT INTO journalist(journalist_id, company, journalist_name, journalist_surname)
VALUES (3, 'Alie', 'Han', 'Bati');

INSERT INTO client_journalist(client_id, journalist_id)
VALUES (1, 2);

INSERT INTO client_journalist(client_id, journalist_id)
VALUES (1, 3);

INSERT INTO client_journalist(client_id, journalist_id)
VALUES (2, 1);

INSERT INTO client_journalist(client_id, journalist_id)
VALUES (3, 1);

INSERT INTO client_journalist(client_id, journalist_id)
VALUES (2, 3);

INSERT INTO news(news_id, author_id, date, news)
VALUES (1, 1, 10, 'qwwqdqwqw');

INSERT INTO news(news_id, author_id, date, news)
VALUES (2, 1, 11, 'djaksfajdfkask');

INSERT INTO news(news_id, author_id, date, news)
VALUES (3, 2, 11, 'qeqpepewppep');

INSERT INTO news(news_id, author_id, date, news)
VALUES (4, 3, 10, '[weeppepepep]');

INSERT INTO review(review_id, client_id, news_id, article)
VALUES (1,1,1,'qwerqewrq');

INSERT INTO review(review_id, client_id, news_id, article)
VALUES (2,1,3,'ppdppdpdp');

INSERT INTO review(review_id, client_id, news_id, article)
VALUES (3,2,1,'pepepepe');

INSERT INTO review(review_id, client_id, news_id, article)
VALUES (4,3,1,'ncnnxncncxn');