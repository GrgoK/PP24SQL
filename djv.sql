drop database if exists djv;
create database djv;
use database djv character set utf8;

create table vrtic(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50),
    odgojnaskupina varchar(50)
    
);

create table dijete(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

create table strucna_sprema(
    sifra int not null primary key auto_increment,
    certificiran boolean
);

create table odgajateljica(
    siffra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50),
    email varchar(50)
);

create table odgojna_skupina(
    sifra int not null primary key auto_increment,
    brojdjece char(3),
    dijete not null,
    odgajateljica not null
);

alter table dijete add foreign key(osoba) references osoba(sifra);

alter table odgajateljica add foreign key(osoba) references osoba(sifra);

alter table strucna_sprema add foreign key(odgajateljica)references odgajateljica (sifra);

alter table odgojna_skupina add foreign key (dijete) references dijete(sifra);

alter table odgojna_skupina add foreign key (odgajateljica) references odgajateljica(sifra);
alter table vrtic add foreign key (odgojnaskupina)references odgojna_skupina(sifra);
