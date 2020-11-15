# c:\xampp\mysql\bin\mysql -uedunova -pedunova <d:\taksi.sql

drop database if exists taksi;
create database taksi; 
use taksi;

create table vozilo(
    sifra int not null primary key auto_increment,
    boja varchar(20),
    marka varchar(20)

);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null
);

create table voznja(
    vozac int not null,
    putnik int not null

);

create table putnik(
    
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null
);

alter table voznja add foreign key (vozac) references vozac(sifra);
alter table voznja add foreign key (putnik) references putnik(sifra);