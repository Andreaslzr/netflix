create database netflix;
use netflix;

create table catfilm(
id bigint not null auto_increment,
category varchar(100) not null,
primary key(id)
);

create table film(
id bigint not null auto_increment,
title varchar(100) not null,
banner varchar(300) not null,
synopsis varchar(300) not null,
createDate date not null,
timesDisplayed int not null,
categoryFK bigint not null,
primary key(id),
foreign key(categoryFK) references catfilm(id)
);

create table signatures(
id bigint not null auto_increment,
signature varchar(30) not null,
price numeric(10,2) not null,
primary key(id)
);

create table users(
id bigint not null auto_increment,
name varchar(60) not null,
birthDate date not null,
email varchar(60) not null,
signatureFK bigint not null,
primary key(id),
foreign key(signatureFK) references signatures(id)
);

create table payments(
id bigint not null auto_increment,
userFK bigint not null,
signatureFK bigint not null,
datePayment date not null,
primary key(id),
foreign key(userFK) references users(id),
foreign key(signatureFK) references signatures(id)
);

insert into catfilm(category) values
('ação'),('aventura'),('terror'),('animação'),('comédia'),('ficção');

insert into film(title,banner,synopsis,createDate,timesDisplayed,categoryFK) values
('aventuras','https:aventdcril','aventureiro','2023-02-15',18998367,2),
('cachorro','https:cchrrdjrdn','aventura','2023-03-13',16188983,4),
('karatê','https:krtlão','karatê','2022-08-18','18888988',4),
('panico','https:panico','panico','2019-05-03',11245368,3),
('titanic','https:titanicafnd','titanic','1999-09-11',17545798,5);

insert into signatures(signature,price) values
('basic',29.99),('premium',39.99),('gold',49.99);

insert into users(name,birthDate,email,signatureFK) values
('Carlos Eduardo','1985-06-30','cadu@hmail.com',2),('Felipe Santos','2004-08-02','felipesan@hmail.com',3),
('Diogo Teixeira','2005-04-10','didird@hmail.com',2),('Pedro Panini','2004-03-31','PPP@hmail.com',2),
('Marcia albuquerque','1979-05-05','marciaalb@hmail.com',2);

insert into payments(userFK,signatureFK,datePayment) values
(1,1,'2021-02-03'),(2,3,'2021-03-01'),(3,2,'2022-04-21'),(4,2,'2023-01-10'),(5,2,'2019-05-07');

select signature as plano from signatures s
inner join users u on s.id = u.signatureFK
group by signature;

select * from film where timesDisplayed=(
select max(timesDisplayed) from film) or timesDisplayed=(select min(timesDisplayed) from film);



