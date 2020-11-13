#   c:\xampp\mysql\bin\mysql -uedunova -pedunova <d:\frizerskiSalon.sql


drop database if exists frizerskiSalon;
create database frizerskiSalon; 
use frizerskiSalon;

create table djelatnica (
    sifra   int not null primary key auto_increment,
    ime     varchar(20) not null,
    prezime varchar(20) not null,
    oib     char(11)

);

create table korisnik (
    sifra   int not null primary key auto_increment,
    ime     varchar(20) not null,
    prezime varchar(20) not null,
    oib     char(11),
    djelatnica int not null

);

create table posjet(

    sifra int not null primary key auto_increment,
    poslovan boolean,
    korisnik int not null,
    usluga int not null


);

create table usluga (

    sifra int not null primary key auto_increment,
    iskoristena boolean
    

);

alter table korisnik add foreign key (djelatnica) references djelatnica(sifra);
alter table posjet add foreign key (korisnik) references korisnik(sifra);
alter table posjet add foreign key (usluga) references usluga(sifra);