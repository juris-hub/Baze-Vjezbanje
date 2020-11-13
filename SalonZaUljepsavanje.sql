#   c:\xampp\mysql\bin\mysql -uedunova -pedunova <d:\SalonZaUljepsavanje.sql


drop database if exists SalonZaUljepsavanje;
create database SalonZaUljepsavanje; 
use SalonZaUljepsavanje;

create table djelatnica(
    sifra int not null primary key auto_increment,
    ime Varchar(20) not null,
    prezime Varchar(20) not null,
    oib Char(11)
);

create table korisnik (
    sifra int not null primary key auto_increment,
    ime Varchar(20) not null,
    prezime Varchar(20) not null,
    oib Char(11),
    djelatnica int not null
);

create table posjet (
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