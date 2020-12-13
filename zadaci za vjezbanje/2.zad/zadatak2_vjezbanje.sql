drop database if exists zad2;
create database zad2; 

use zad2;


create table decko(
	sifra int not null primary key auto_increment,
	indiferentno bit,
	vesta varchar(34),
	asocijalno bit not null
);

create table cura(
	sifra int not null primary key auto_increment,
	haljina varchar(33) not null,
	drugiputa datetime not null,
	suknja varchar(38),
	narukvica int,
	introvertno bit,
	majica varchar(40),
	decko int
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	modelnaocala varchar(37),
	treciputa datetime not null,
	ekstroventno bit not null,
	prviputa datetime,
	svekar int not null
	);

create table svekar(
	sifra int not null primary key auto_increment,
	stilfrizura varchar(48),
	ogrlica int not null,
	asocijalno bit not null
);

create table zarucnica(
	sifra int not null primary key auto_increment,
	narukvica int,
	bojakose varchar(37) not null,
	novcica decimal (15,8),
	lipa decimal (15,9) not null,
	indiferentno bit not null
);

create table decko_zarucnica(
	sifra int not null primary key auto_increment,
	decko int not null,
	zarucnica int not null
);

create table brat(
	sifra int not null primary key auto_increment,
	suknja varchar(47),
	ogrlica int not null,
	asocijalno bit not null,
	neprijatelj int not null
);

create table neprijatelj(
	sifra int not null primary key auto_increment,
	majica varchar(32),
	haljina varchar(43) not null,
	lipa decimal(16,8),
	modelnaocala varchar(49) not null,
	kuna decimal(12,6) not null,
	jmbag char(11),
	cura int
);

alter table cura add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

insert into neprijatelj (sifra,haljina,modelnaocala,kuna) 
values	(1,'plavacrna','veliki',22.123),
		(2,'plavacrna','veliki',22.123),
		(3,'plavacrna','veliki',22.123);

insert into cura (sifra,haljina,drugiputa) 
values	(1,'plavacrna',now()),
		(2,'plavacrna',now()),
		(3,'plavacrna',now());
	
insert into decko (sifra,asocijalno)
values (1,1),
	(2,1),
	(3,0);

insert into zarucnica (sifra,bojakose,lipa,indiferentno )
values	(1,'plava',22.1,1),
(2,'plava',22.1,0),
(3,'plava',22.1,0);
		
insert into decko_zarucnica (sifra,decko, zarucnica) 
values	(1,2,3),
		(2,3,1),
		(3,2,1);
		
update  prijatelj set treciputa = '2020-04-30';
delete from brat where ogrlica != 14;

select suknja 
from cura where drugiputa = null;

select a.novcica , f.neprijatelj , e.haljina 
from zarucnica a inner join decko_zarucnica b on a.sifra = b.zarucnica 
inner join decko c on b.zarucnica = c.sifra 
inner join cura d on c.sifra = d.decko 
inner join neprijatelj e on d.sifra = e.cura 
inner join brat f on e.sifra = f.neprijatelj 
where d.drugiputa is not null and c.vesta like '%ba%' order by e.haljina desc;

select vesta , asocijalno 
from decko a inner join decko_zarucnica b on a.sifra = b.decko 
where a.sifra not in (select decko from decko_zarucnica);