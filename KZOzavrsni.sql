drop database if exists KZO;
create database KZO character set utf8;
use KZO;

create table objekt(
    sifra int not null primary key auto_increment,
    adresa varchar(50),
    gost int,
    cijena decimal(18,2),
    soba int
);

create table gost(
    sifra int not null primary key auto_increment,
    osoba int not null
    
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char (11),
    email varchar(50)

);

create table rezervacija(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2),
    gost int not null,
    soba int not null,
    datumprijave datetime,
    datumodjave datetime 
);


create table soba(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    kapacitet int,
    cijena decimal(18,2)
);

alter table objekt add foreign key (gost) references gost(sifra);
alter table gost add foreign key (osoba) references osoba(sifra);
alter table objekt add foreign key (soba) references soba(sifra);

alter table rezervacija add foreign key (gost) references gost (sifra);
alter table rezervacija add foreign key (soba) references soba(sifra);

insert into gost(sifra,osoba)
values(null,1);

insert into osoba(sifra,ime,prezime,oib,email)
values(null,'Marija','Marijanovic',23323123233,'marija.marijanovic@gmail.com');

insert into soba(sifra,naziv,kapacitet,cijena)
values(null,'Josipa',5,343.44);

insert into objekt(sifra,adresa,gost,cijena,soba)
values(null,'malencica',1,2342.99,2);