drop database if exists githubprimjer;
create database githubprimjer;
use githubprimjer character set utf8;

create table git( 
    sifra int not null primary key auto_increment,
    naziv varchar(50)not null
);

