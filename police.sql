create schema police;

CREATE TABLE Police_Id
(
   id            int PRIMARY KEY unique,
   name          varchar (20) NOT NULL unique,
   surname       varchar (20),
   rank          varchar (40) NOT NULL,
   department    varchar (50) NOT NULL  CHECK (department LIKE 'D%'),
   sex           char (1) CONSTRAINT valid_sex CHECK (sex IN ('F', 'M')),
   phoneNum      char (10),
   age           int,
   dateOfStart   varchar(30)
);


create table nameOfTable(

nameOfTableColumn int,
nameme varchar (20), -- string type
primary key (nameOfTableColumn)
);
create table Login
( 
 userName int  REFERENCES Police_Id (id),
 password  varchar (20) REFERENCES Police_Id (name)  ,
 primary key(userName, password)
);

CREATE TABLE Suspect_Details
(
   cpr         int unique ,
   nameS       varchar (30)unique ,
   surnameS    varchar (20),
   sex         char (1) CONSTRAINT valid_sex CHECK (sex IN ('F', 'M')),
   age         int,
   residence   int,  -- postcode
primary key(cpr,nameS)
);

CREATE TABLE Arrests
(
   causeOfArrests    varchar (20) ,
   police_Arrest     int REFERENCES Police_Id (id),
   name_Suspect      varchar (30) REFERENCES Suspect_Details (nameS),
   suspect_CPR       int REFERENCES Suspect_Details (cpr),   
   hoursOfDetainee   int,
   PRIMARY KEY(causeOfArrests)
);

CREATE TABLE Inventory
(
   weapons             varchar (20),
   drugs               varchar (20),
   personalBelongins   varchar (120) not null,
   name_Suspect        varchar (30) REFERENCES Suspect_Details (nameS)
);


insert into  Police_Id values
(011111119,'Ion','Vasilevici','Sergent','D.Homocide','M','91685870',25,'2011-11-20'),
(011111120,'Cristina','Diacovschi','Leutenant','D.Theft','F','45688025',35,'2015-10-24'),
(011111121,'Joseph','Criphianschi','Chief','D.Drug Enforcement','M','78945520',20,'2016-01-04'),
(011111122,'Grim','Diaconu','Leutenant','D.Theft','M','9114254870',26,'2016-03-20'),
(011111123,'Ina','Dianovschi','Inspector','D.Burlgary','F','69952089',32,'2014-02-02');

--terrorism, burlgary

DROP TABLE Police_Id;
SELECT*FROM Police_Id;

insert into Suspect_Details values
('0310635245','Dragomir','Volcinschi','M',53,'8700' ),
('0112901931','Miranda','Pirlson','F',26,'2500' ),
('0310561234','Frank','Stein','M',22,'0919' ),
('0315646448','John','Casey','M',64,'8100' ),
('0310801234','Sarah','Walker','F',48,'8560' ),
('0310654461','Chuck','Burtowski','M',56,'8700' ),
('0321544873','Gyonmanto','Makinton','M',32,'1234' ),
('0654649788','Josephina','Francesca','F',21,'0645' ),
('0654465461','Timofey','Diacon','M',23,'7895' );

DROP TABLE Suspect_Details;
SELECT*FROM Suspect_Details ;

SELECT*FROM Arrests where police_Arrest =011111119;

insert into Arrests values
('Homocide',011111119,'Dragomir','0310635245',53 ),
('Theft',011111121,'Frank','0310561234',24),
('Drugs',011111122,'Miranda','0112901931',32),
('Terorism',011111120,'John','0315646448',56 ),
('Car Theft',011111120,'Chuck','0310654461',32 ),
('Vandalism',011111123,'Sarah','0310801234',21 ),
('Robery',011111123,'Josephina','0654649788',23);

DROP TABLE Arrests;
SELECT*FROM Arrests;

insert into Inventory values
('Glock 17',null,'black jacket, sneakers, sunglasses,blue T-shirt','Dragomir' ),
(null,'marijuana','small dress, sunglasses,pruple T-shirt','Miranda' ),
(null,null,'jeans, lighter, white T-shirt , Chukka boots','Frank' );
DROP TABLE Inventory;
SELECT*FROM Inventory;

insert into Login values
(011111119,'Ion'),
(011111120,'Cristina'),
(011111121,'Joseph');

DROP TABLE Login;
SELECT*FROM Login;


SELECT * FROM police.login where userName=11111119  AND password='Ion';

SELECT login.password, login.username FROM police.login where userName=11111119  AND password='Ion';

insert into police.suspect_details(cpr,nameS,surnameS,sex,age,residence) values(01321312,'sula','bula','M',25,4506);

