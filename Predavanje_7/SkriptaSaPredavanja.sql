

#Zadatak - Unesite novog predavača i neka se zove Shaquille O'Neal

select * from predavac;
select * from osoba;

#Zadatak - Grupu Jp23 vodi Tomislav Jakopec, grupu PP22 vodi Shaquille O'Neal

update grupa set predavac = 1 where sifra = 1;
update grupa set predavac = 2 where sifra = 2;

select * from grupa;

select
from grupa a
inner join smjer s 


#Zadatak - Ispišite imena i prezimena svih polaznika grupe  JP23

select * from grupa;

select d.prezime , d.ime 
from grupa a
inner join clan b on a.sifra = b.grupa 
inner join polaznik c on b.polaznik = c.sifra 
inner join osoba d on c.osoba = d.sifra 
where a.naziv = 'JP23';

#1. zadatak - Odaberite sve naslove knjiga koje su napisali autori rođeni 1980. godine

select a.naslov 
	from katalog a inner join autor b on a.autor = b.sifra where b.datumrodenja between '1980-1-1' and '1980-12-30'

#2. zadatak -  Odaberite sve naslove koji su izdani od strane aktivnih izdavača
	
select a.naslov
	from katalog a inner join izdavac b on a.izdavac =  b.sifra where b.aktivan = 1;

#3. zadatak - Odaberite imena i prezimena autora koji su pisali knjige na ljubavnu tematiku

select a.ime , a.prezime 
	from autor a inner join katalog b on b.autor = a.sifra where b.naslov like '%ljubav';
  
  #Zadatak - Ispisati nazive gradova u europi

select a.Name 
from city a inner join country b on a.CountryCode = b.Code 
where Continent = 'Europe' order by a.Name asc ;

#Zadatak - Odaberite nazive zemalja u kojima se piše španjolski jezik

select a.name
from country a inner join countrylanguage b on a.Code = b.CountryCode 
where b.`Language` = 'Spanish';
