drop database if exists vjezba1;
create database vjezba1 character set utf8;
use vjezba1;

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal (16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
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

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(46),
    modelnaocala varchar(43),
    maraka decimal(14,5)not null,
    zena int not null
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




create table sestra(
    sifra int not null primary key auto_increment,
    introventno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
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

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);
alter table cura add foreign key (punac) references punac(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table zena add foreign key (sestra) references sestra(sifra);



alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);

--zadatak 1
insert into sestra(sifra,introventno,haljina,maraka,hlace,narukvica) values
(null,null,'plava haljina',null,'jeans',9);

insert into svekar(sifra,bojaociju,prstena,dukserica,lipa,eura,majica) values
(null,'zelene oci',null,null,null,null,null);

insert into sestra_svekar(sifra,sestra,svekar) values 
(null,1,1);


insert into muskarac(sifra,bojaociju,hlace,modelnaocala,maraka,zena) values
(null,'zelena',null,null,17.12,1),
(null,'plava',null,null,19.12,2),
(null,'smedja',null,null,21.12,3);

insert into zena(sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra) values
(null,null,null,'bijela majica',99883993,'zelena',null,1),
(null,null,null,'crna majica',99885493,'plava',null,1),
(null,null,null,'zuta majica',97683993,'smedja',null,1);


--zadatak 2

update cura 
set gustoca=15.77;

--zadatak 3

delete from mladic where kuna > 15.78;

--zadatak 4

select kratkamajica from zena where hlace like '%ana%';

--zadatak 5 







