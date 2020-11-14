#   c:\xampp\mysql\bin\mysql -uedunova -pedunova <d:\Udruga.sql


drop database if exists Udruga;
create database Udruga; 
use Udruga;

Create table osoba (
    sifra int primary key not null auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11)
);

Create table sticenik (
    sifra int primary key not null auto_increment,
    pasmina varchar(20) not null,
    osoba int not null
);

Create table prostor (
    sifra int primary key not null auto_increment,
    zauzeto boolean
);

Alter table sticenik add foreign key (osoba) references osoba(sifra);