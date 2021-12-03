drop database if exists vjezba2;
create database vjezba2 default character set utf8;
use vjezba2;

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstroventno bit not null,
    prviputa datetime,
    svekar int not null
);

alter table prijatelj add foreign key (svekar) references svekar (sifra);


create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakoze varchar(50) not null,
    novcica decimal(15,9),
    lipa decimal(16,8) not null,
    indiferentno bit not null
);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null


);


alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int ,
    introventno bit,
    majica varchar(43) not null,
    decko int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(50),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal (12,6) not null,
    jmbag char(11),
    cura int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

alter table cura add foreign key (decko) references decko(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

--zadatak 1 

insert into decko(sifra,indiferentno,vesta,asocijalno)
values (null,null,null,13.87),
       (null,null,null,14.88),
       (null,null,null,15.42);

insert into zarucnica(sifra,narukvica,bojakoze,novcica,lipa,indiferentno)
values (null,null,'smedja',null,16.89,998.990),
       (null,null,'crna',null,12.89,99.70),
       (null,null,'smedja',null,13.89,98.990);

insert into decko_zarucnica(sifra,decko,zarucnica)
values (null,1,1),
       (null,2,2),
       (null,3,3);

--zadatak 1
insert into cura(sifra,haljina,drugiputa,suknja,narukvica,introventno,majica,decko) values
(null,'kratka haljina','2019-04-04',null,null,null,'bijela',1),
(null,'uska haljina','2019-05-04',null,null,null,'zelena',2),
(null,'mala haljina','2019-07-04',null,null,null,'crvena',3);

insert into neprijatelj(sifra,majica,haljina,lipa,modelnaocala,kuna,jmbag,cura) values
(null,null,'svecana haljina',null,'ray ban',17.99,null,1),
(null,null,'prava haljina',null,'ray pan',17.57,null,2),
(null,null,'crna haljina',null,'ray gan',19.99,null,3);

--zadatak 2

update prijatelj
set treciputa='2020-04-30';

--zadatak 3

delete from brat where ogrlica<>14;

--zadatak 4

select suknja from cura where drugiputa is null;

--zadatak 5


select f.novcica,a.neprijatelj,b.haljina
from brat a 
inner join neprijatelj b on b.sifra=a.neprijatelj
inner join cura c on c.sifra=b.cura
inner join decko d on d.sifra=c.decko
inner join decko_zarucnica e on d.sifra=e.decko
inner join zarucnica f on f.sifra=e.zarucnica
where c.drugiputa is not null and d.vesta like '%ba%'
group by b.haljina desc;

--zadatak 6

select vesta, asocijalno
from decko
where sifra not in (select distinct decko from decko_zarucnica);



    