# c:\xampp\mysql\bin\mysql -uedunova -pedunova <d:\vrtic.sql

drop database if exists vrtic;
create database vrtic; 
use vrtic;

Create table odgojnaSkupina (
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    dobOdgojneSkupine int,
    spolOdgojneSkupine char(1) not null

);

Create table djeca(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    odgojnaSkupina int not null,
    odgajateljica int not null

);

Create table odgajateljica(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11),
    iban varchar(50)
);


Create table strucnaSprema(
    sifra int not null primary key auto_increment,
    razinaSkolovanja varchar(20) not null

);

Alter table djeca add foreign key (odgojnaSkupina) references odgojnaSkupina(sifra);
Alter table djeca add foreign key (odgajateljica) references odgajateljica(sifra);