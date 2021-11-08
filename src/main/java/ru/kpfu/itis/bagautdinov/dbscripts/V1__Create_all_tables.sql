	

CREATE TABLE journalist (
	journalist_id int primary key,
	company varchar(255) check(char_length(company) > 1),
	journalist_name varchar(255) check(char_length(journalist_name) > 1),
	journalist_surname varchar(255) check(char_length(journalist_surname) > 1)
);

CREATE TABLE news (
	news_id int primary key,
	author_id int references journalist(journalist_id) not null ,
	date int check ( date > 0 ),
	news varchar(255) check(char_length(news) > 1)
);

CREATE TABLE client (
	client_id int primary key,
	client_name varchar(255) check(char_length(client_name) > 1),
	client_surname varchar(255) check(char_length(client_surname) > 1),
	client_status varchar(255) check(char_length(client_status) > 1)
);

CREATE TABLE review (
	review_id int primary key,
	client_id int references client(client_id) not null ,
	news_id int references news(news_id) not null ,
	article varchar(255) check(char_length(article) > 1)
);

CREATE TABLE client_journalist (
	client_id int references journalist(journalist_id) not null ,
	journalist_id int references client(client_id) not null
);

