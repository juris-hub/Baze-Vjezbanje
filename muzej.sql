# c:\xampp\mysql\bin\mysql -uedunova -pedunova <d:\muzej.sql

drop database if exists muzej;
create database muzej; 
use muzej;

create table izlozba(
    sifra int not null primary key auto_increment,
    sponzor int not null

);

create table sponzor (
    sifra int not null primary key auto_increment

);

create table djela (
    sifra int not null primary key auto_increment,
    izlozba int not null
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11)
);

alter table izlozba add foreign key (sponzor) references sponzor(sifra);
alter table djela add foreign key (izlozba) references izlozba(sifra);