drop database if exists zad1;
create database zad1; 

use zad1;

create table sestra(
	sifra int not null primary key auto_increment,
	introvertno bit,
	haljina varchar(31) not null,
	maraka decimal(16, 6),
	hlace varchar(46) not null,
	narukvica int
);

create table punac(
	sifra int not null primary key auto_increment,
	ogrlica int,
	gustoca decimal(14,9),
	hlace varchar(41) not null
);

create table cura(
	sifra int not null primary key auto_increment,
	novcica decimal (16,5) not null,
	gustoca decimal (18,6) not null,
	lipa decimal(13,10),
	ogrlica int not null,
	bojakose varchar(38),
	suknja varchar (36),
	punac int
);

create table zena(
	sifra int not null primary key auto_increment,
	treciputa datetime,
	hlace varchar(46),
	kratkamajica varchar(31) not null,
	jmbag char(11) not null,
	bojaociju varchar(39) not null,
	haljina varchar(44),
	sestra int not null
);

create table sestra_svekar(
	sifra int not null primary key auto_increment,
	sestra int not null,
	svekar int not null
);

create table muskarac(
	sifra int not null primary key auto_increment,
	bojaociju varchar(50) not null,
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal (14,5) not null,
	zena int
);

create table mladic(
	sifra int not null primary key auto_increment,
	suknja varchar(50) not null,
	kuna decimal(16,8) not null,
	drugiputa datetime,
	asocijalno bit,
	ekstroventno bit not null,
	dukserica varchar(48) not null,
	muskarac int
);

create table svekar(
	sifra int not null primary key auto_increment,
	bojaociju varchar(40) not null,
	prstena int,
	dukserica varchar(41),
	lipa decimal(13,8),
	eura decimal(12,7),
	majica varchar(35)
);

alter table zena add foreign key (sestra) references sestra(sifra);
alter table cura add foreign key (punac) references punac(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);

insert into svekar (sifra,bojaociju) values
	(1,'plava'),
	(2,'crvena'),
	(3,'smedja');

insert into sestra (sifra,haljina,hlace,narukvica)
	values (1,'Ljetna','Zelene',23),
			(2,'Zimska', 'Ljubicaste',12),
			(3,'Jesenska', 'Plave',11);

insert into sestra_svekar (sestra,svekar)
values (1,1),
		(2,2),
		(3,3);
	
	insert into zena (sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values (1,'2020-11-20', 'moderne', 'plava', '11122233312', 'Plava','Ljetna',1),
		(2,'2020-12-20', 'moderne', 'crvena', '11122233311', 'Crvena','Zimska',2),
		(3,'2020-11-21', 'moderne', 'ljubicasta', '11122233315', 'Roza','Jesenska',3);
	
insert into muskarac (sifra,bojaociju,hlace,modelnaocala,maraka,zena)
values (1,'plave', 'moderne', 'l298N', 125.2, 1),
		(2,'plave', 'moderne', 'l298N', 125.2, 2),
		(3,'plave', 'moderne', 'l298N', 125.2, 3);

update cura set gustoca = 15.77;

delete from mladic where kuna > 15.78;

select kratkamajica
from zena where hlace like '%ana%';

select dukserica
from svekar a