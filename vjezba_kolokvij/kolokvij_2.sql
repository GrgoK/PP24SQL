drop database if exists kolokvij_2;
create database kolokvij_2 character set utf8;
use kolokvij_2

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
    asocijalno bit
);

alter table prijatelj add foreign key (svekar) references svekar(sifra);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(50),
    asocijalno bit not null
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(50) not null,
    suknja varchar(38),
    narukvica int ,
    introvertno bit,
    majica varchar(40) not null,
    decko int 
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null

);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakoze varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11)null,
    cura int 
);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);


alter table cura add foreign key(decko) references decko(sifra);

alter table decko_zarucnica add foreign key (decko) references decko(sifra);

alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

alter table neprijatelj add foreign key (cura) references cura(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);


--1.zadatak

insert into neprijatelj(sifra,majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values (null,null,'bijela haljina',null,'ray ban',13.88,null,null),
    (null,null,'zuta haljina',null,'ray pan',13.90,null,null),
    (null,null,'zelena haljina',null,'ray gan',16.88,null,null);
    