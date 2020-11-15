# c:\xampp\mysql\bin\mysql -uedunova -pedunova <d:\samostan.sql

drop database if exists samostan;
create database samostan; 
use samostan;

create table svecenici(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11)

);

create table poslovi (
    sifra int not null primary key auto_increment,
    obavljeni boolean

);

create table nadredjeni(
    sifra int not null primary key auto_increment,
    rankNadredjenog varchar(20)

);

create table obavljanjePoslova(
    svecenici int not null,
    poslovi int not null

);

alter table obavljanjePoslova add foreign key (svecenici) references svecenici(sifra);
alter table obavljanjePoslova add foreign key (poslovi) references poslovi(sifra);