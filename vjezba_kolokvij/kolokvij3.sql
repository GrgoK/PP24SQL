drop database if exists vjezba3;
create database vjezba3  character set utf8;
use vjezba3;

create table cura (
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
    
);

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
    
);

alter table svekar add foreign key (cura) references cura(sifra);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno bit  not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null
);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    introventno bit,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    asocijalno bit ,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int 
);


alter table punica add foreign key (snasa) references snasa(sifra);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);


alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);

alter table prijatelj_brat add foreign key (brat) references brat(sifra);




--zadatak 1

insert into ostavljena(sifra,kuna,lipa,majica,modelnaocala,prijatelj) values
(null,null,null,null,'ray ban',null),
(null,null,null,null,'ray dan',null),
(null,null,null,null,'ray man',null);

insert into snasa(sifra,introventno,kuna,eura,treciputa,ostavljena)
values (null,null,16.98,67.88,null,1),
 (null,null,16.93,67.88,null,2),
 (null,null,16.91,67.88,null,3);


insert into prijatelj(sifra,kuna,haljina,lipa,dukserica,indiferentno) values
(null,null,null,null,null,1),
(null,null,null,null,null,0),
(null,null,null,null,null,1);


insert into brat(sifra,jmbag,ogrlica,ekstroventno) values
(null,null,4,1),
(null,null,8,1),
(null,null,7,0);

insert into prijatelj_brat(sifra,prijatelj,brat)
values(null,1,1),
(null,2,2),
(null,3,3);



--zadatak 2

update svekar
set suknja='Osijek';

-- zadatak 3 

delete from punica where kratkamajica='AB';

--zadatak 4

select majica from ostavljena where lipa not in('9','10','20','30','35');

-- zadatak 5

select f.ekstroventno, a.vesta, b.kuna
from punica a 
inner join snasa b on b.sifra=a.snasa
inner join ostavljena c on c.sifra=b.ostavljena
inner join prijatelj d on d.sifra=c.prijatelj
inner join prijatelj_brat e on d.sifra=e.prijatelj
inner join brat f on f.sifra=e.brat
where c.lipa<>91 and d.haljina like'%ba%'
group by b.kuna desc;

--zadatak 6

select haljina,lipa 
from prijatelj
where sifra not in(select distinct prijatelj from prijatelj_brat);






