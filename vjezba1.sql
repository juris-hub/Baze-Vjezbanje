drop database if exists vjezba1;
create database vjezba1 CHARACTER SET utf8; 

use vjezba1;

create table osoba (
	sifra int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	email varchar(30) not null
	
);

select * from osoba;

insert into osoba (sifra,ime,prezime,oib,email) values 
(1,'Mislav','Evic',12345678911, 'mislavevic@hotmail.com'),
(2,'Mislav','Evic',12345678912, 'mislavevic@hotmail.hr'),
(3,'Mislav','Evic',12345678913, 'mislavevic@hotmail.sr'),
(4,'Mislav','Evic',12345678914, 'mislavevic@hotmail.pr');
