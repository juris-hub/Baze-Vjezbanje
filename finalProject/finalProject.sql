drop database if exists finalProject;
create database finalProject; 

use finalProject;

create table klijent (
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11),
	adresa varchar(30) not null,
	email varchar(50) not null
);

create table bankar (
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	email varchar(50) not null
);

create table kreditnaKartica (
	sifra int not null primary key auto_increment,
	vrijediDo date not null,
	limitKartice decimal(21,2) not null,
	brojKartice char(16) not null,
	klijent int
);

create table racun (
	sifra int not null primary key auto_increment,
	brojRacuna char(14) not null,
	stanjeRacuna decimal(21,2),
	klijent int
);

create table bankar_klijent(
	sifra int not null primary key auto_increment,
	klijent int,
	bankar int
);

create table poslovnicaBanke (
	sifra int not null primary key auto_increment,
	grad varchar(30) not null,
	postanskiBroj varchar(10) not null	
);

CREATE TABLE bankar_poslovnica(
	sifra int not null primary key auto_increment,
	bankar int,
	poslovnicaBanke int
);


alter table racun add foreign key (klijent) references klijent(sifra);
alter table kreditnaKartica add foreign key (klijent) references klijent(sifra);
alter table bankar_klijent add foreign key (klijent) references klijent(sifra);
alter table bankar_klijent add foreign key (bankar) references bankar(sifra);
alter table bankar_poslovnica add foreign key (bankar) references bankar(sifra);
alter table bankar_poslovnica add foreign key (poslovnicabanke) references poslovnicaBanke(sifra);