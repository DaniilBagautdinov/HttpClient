	

CREATE TABLE journalist (
	journalist_id int primary key,
	company varchar(255),
	journalist_name varchar(255),
	journalist_surname varchar(255)
);

CREATE TABLE news (
	news_id int primary key,
	author_id int references journalist(journalist_id),
	date int,
	news varchar(255)
	
);

CREATE TABLE client (
	client_id int primary key,
	client_name varchar(255),
	client_surname varchar(255),
	client_status varchar(255)
);

CREATE TABLE review (
	review_id int primary key,
	client_id int references client(client_id),
	news_id int references news(news_id),
	article varchar(255)
);

CREATE TABLE client_journalist (
	client_id int references journalist(journalist_id),
	journalist_id int references client(client_id)
);

