CREATE DATABASE Investigation;
use Investigation;

-- Criminal table
CREATE TABLE Criminal (
Criminal_ID INT PRIMARY KEY,Name VARCHAR(100),Age INT,Gender VARCHAR(10),Crime_Type VARCHAR(100),location_id int,Victim_ID INT);
describe criminal;
-- Victim table
CREATE TABLE Victim (
Victim_ID INT PRIMARY KEY,Name VARCHAR(100),Age INT,Gender VARCHAR(10),Injury_Details VARCHAR(255), Criminal_ID INT ,
Location_ID INT);
select*from victim;

-- Location table
CREATE TABLE Crime_Location (Location_ID INT PRIMARY KEY,State VARCHAR(100)
);

-- Data of criminals , 	case , victims and locations.

-- Criminal
INSERT INTO Criminal VALUES  (0001, 'Lavi Sharma', 34, 'Male', 'Robbery',1,001),
                             (0002, 'Ember Bon', 20, 'female', 'Murder',2,002),
							(0003, 'Shanks Dolx', 30, 'Male', 'smuggling',3,003),
						(0004, 'David Martinez', 18, 'male', 'Stalking',4,004),
							(0005, 'Saiki Mons', 20, 'female', 'Attempt To Murder',5,005),
						(0006, 'Nir Rin', 40, 'male', 'Bombing',6,006),
							(0007, 'Xor Jain', 35, 'female', 'Kidnapped',7,007),
                               (0008, 'Stary Bon', 50, 'male', 'Shooting',8,800),
                               (0009, 'Annie Beatrix', 25, 'female', 'Abducting',9,009),
							(0010, 'Jopls Jawn', 28, 'male', 'Robbery',10,010),
                               (0011, 'Rosy Fawn', 20, 'male', 'Murder',11,011),
							(0012, 'Rosy Fawn', 20, 'male', 'Murder',12,012),
                               (0013, 'Rosy Fawn', 16, 'male', 'Murder',13,013),
                               (0014, 'Bujo Hob', 34, 'male', 'Torture',14,014),
							(0015, 'Sunil Chirt', 20, 'male', 'Homicide',15,015),
                               (0016, 'Akito Exil', 14, 'male', 'Robbery',16,016),
                               (0017, 'Lopst Yoha', 53, 'female', 'Murder',17,017),
							(0018, 'Harry fen', 15, 'female', 'Suicide',18,018),
                               (0019, 'Cope Haw', 24, 'male', 'Attempt for 2 degree murder',19,019),
                               (0020, 'Jozy Fawns', 22, 'female', 'Kidnapping',20,020)
;
-- Victim
INSERT INTO Victim VALUES (001, 'Finber Kovr', 28, 'Female', 'Bruises on arm',0001,1),
                          (002, 'Lelouch Vi', 18, 'male', 'Stabbed at chest',0002,2),
                          (003, 'Hikari Lon', 28, 'female', 'Bullets on leg',0003,3)  ,
						(004, 'Socat Zeo', 28, 'Female', 'Comatose state',0004,4),
                          (005, 'Sunny Yadav', 48, 'female', 'Badly Injured',0005,5),
                          (006,'Zen Shah',27,'male','Dead',0006,6),
                          (007,'Polnaref Pope',60,'male','Abducted',0007,7),
						(008,'Jotaro Kujo',35,'male','Bullets at forehead',0008,8),
                          (009,'Kokomi Voc',14,'female','Missing',0009,9),
                          (010,'Zopl Jack',39,'male','Bruises on torso',0010,10),
                          (011,'Oliver Aiku',27,'male','Dead',0011,11),
                          (012,'Nico Uol',18,'male','Comatose state',0012,12),
						(013,'Nagi Sheshiro',43,'male','Crippled',0013,13),
                          (014,'Chris Prince',32,'male','Trauma',0014,14),
                          (015,'Chigiri  Hyoma',48,'female','Bullets on Chest',0015,15),
                          (016,'Giorino Noa',54,'male','Stabbed at leg',0016,16),
						(017,'Zawari John',23,'female','Dead',0017,17),
						(018,'Shawn Cip',51,'male','Injured',0018,18),
                          (019,'Jolly Sing',27,'female','Minial Injuries',0019,19),
                          (020,'Eren Joe',20,'male','Missing',0020,20)
;


-- Location
INSERT INTO Crime_Location VALUES (1, 'Maharashtra'),
							(2, 'Uttar Pradesh'),
							(3, 'Goa'),
							(4, 'Tamil Nadu'),
							(5, 'Uttar Pradesh'),
								(6, 'Maharashtra'),
							(7, 'JK'),
                                   (8, 'Uttar Pradesh'),
							(9, 'Maharashtra'),
                                   (10, 'Uttar Pradesh'),
							(11, 'Rajasthan'),
							(12, 'Uttar Pradesh'),
                                   (13, 'Maharashtra'),
                                   (15, 'Maharashtra'),
                                   (16, 'Maharashtra'),
								(17, 'Kolkata'),
								(18, 'Maharashtra'),
                                   (19, 'Uttar Pradesh'),
                                   (20, 'Rajasthan');

-- Data in short

select * from criminal;
select * from victim;
select * from crime_location;

-- Basic information with using joins since both tables are seperated and usage of Alias
SELECT V.Victim_ID,V.Name AS Victim_Name,V.Age AS Victim_Age,V.Injury_Details,C.Name AS Criminal_Name,C.Crime_Type
FROM Victim V
JOIN Criminal C 
ON V.Criminal_ID = C.Criminal_ID;


-- Information of victims from location
SELECT V.Victim_ID, V.Name AS Victim_Name, l.State
FROM Victim V
JOIN Crime_location l
ON V.location_id = l.location_id;


-- Group by for genders to know the rate of crimes as per gender
SELECT Gender, COUNT(*) AS Total
FROM Victim
GROUP BY Gender;

-- Where is used for conditions
Select * from Crime_location
Where State= 'Maharashtra';

-- In is used for range of states
SELECT * 
FROM Crime_Location
WHERE State IN ('Maharashtra', 'Uttar Pradesh', 'Rajasthan');


-- using between with and in data to find out youngsters
Select *
from Victim
where Age between 15 and 30;

-- USING JOINS WITH COUNT AS AGGEGRATE FUNCTION TO KNOW WHICH CRIMES IS INCREASING!
SELECT C.Crime_Type, COUNT(*) AS Victim_Count
FROM Victim V
JOIN Criminal C 
ON V.Criminal_ID = C.Criminal_ID
GROUP BY C.Crime_Type;

-- age wise
Select name , age 
from victim
order by age asc;


-- top 5 with limit and offset

select * from
victim 
limit  5  offset 3 ;


select c.name , l.state 
from criminal as c
join crime_location as l
on c.criminal_id=l.criminal_id;

select name 
from criminal 
where name like 'A%';

select gender , count(*)
from victim
group by gender;