drop database if exists finalProject;
create database finalProject; 

use finalProject;

create table Klijent (
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11),
	postanskiBroj varchar(10) not null,
	email varchar(50) not null,
	Bankar int
);

create table Bankar (
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	email varchar(50) not null
);

create table KreditnaKartica (
	sifra int not null primary key auto_increment,
	vrijediDo date not null,
	limitKartice decimal(21,2) not null,
	brojKartice char(16) not null,
	Klijent int
);

create table Racun (
	sifra int not null primary key auto_increment,
	brojRacuna char(14) not null,
	stanjeRacuna decimal(21,2),
	Klijent int
);
