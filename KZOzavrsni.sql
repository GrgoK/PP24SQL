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
    osoba int not null,
    email varchar(50)
    
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

create table rezervacija(
    sifra int not null primary key auto_increment,
    gost int not null,
    cijena decimal(18,2),
    datumprijave datetime,
    datumodjave datetime 
);


create table soba(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    kapacitet int,
    cijena decimal(18,2)
);

alter table objekt add foreign key (gosti) references gosti(sifra);
alter table gosti add foreign key (osoba) references osoba(sifra);
alter table sobe add foreign key (objekt) references objekt(sifra);



