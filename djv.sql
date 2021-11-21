drop database if exists djv;
create database djv character set utf8;
use djv;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

create table odgojnaskupina(
    sifra int not null primary key auto_increment,
    dijete int not null,
    odgajateljica int not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table strucnasprema(
    odgajateljica int not null,
    certifikat boolean
    
);

alter table dijete add foreign key(osoba)references osoba(sifra);

alter table odgajateljica add foreign key(osoba)references osoba(sifra);


alter table odgojnaskupina add foreign key(dijete)references dijete(sifra);
alter table odgojnaskupina add foreign key(odgajateljica)references odgajateljica(sifra);

alter table strucnasprema add foreign key(odgajateljica) references odgajateljica(sifra);
