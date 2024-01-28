create database org;
use org;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25),
	PRIMARY KEY(WORKER_ID)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
		
		
		
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 select * from worker;
 select * from worker where salary > 80000;
select * from worker where DEPARTMENT='HR';
SELECT * FROM WORKER WHERE SALARY BETWEEN 80000 AND 300000;
SELECT * FROM WORKER WHERE DEPARTMENT IN ('HR' , 'Admin', 'Account');
SELECT * FROM WORKER WHERE DEPARTMENT NOT IN ('HR' , 'Admin');
select * FROM WORKER WHERE first_name LIKE '__i%';
select * from WORKER ORDER BY SALARY;
replace into WORKER(WORKER_ID, FIRST_NAME, LAST_NAME) 
values(3, 'Vishu', 'Modi');
SELECT replace (FIRST_NAME, 'a', 'A') from WORKER;
SELECT DISTINCT DEPARTMENT FROM WORKER;
SELECT DEPARTMENT , COUNT(DEPARTMENT) FROM WORKER group by DEPARTMENT;
select DEPARTMENT , AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT;
select DEPARTMENT , MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT;
select DEPARTMENT , MIN(SALARY) FROM WORKER GROUP BY DEPARTMENT;
select DEPARTMENT , SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;
SELECT DEPARTMENT , COUNT(DEPARTMENT) FROM WORKER group by DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;
create database temp;
use temp;
create table Customer(
id integer PRIMARY KEY,
cname varchar(255),
Address varchar(255),
gender char(2),
city varchar(225),
Pincode integer
);
INSERT INTO Customer

VALUES (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),

(1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),

(245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),

(210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),

(500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);
INSERT INTO Customer

VALUES (1, 'Ram Kumar3', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);
select* from Customer;
INSERT INTO Customer (id, cname)
VALUES(121, 'SHRU GADHI');
INSERT INTO Customer (cname, id)
VALUES('Dev Intelli', 122);

-- Update
UPDATE Customer SET Address='MUmbai' , Gender='M' where id=121; 
-- UPDATE MULTILE ROWS
SET SQL_SAFE_UPDATES=1;
UPDATE Customer SET Pincode=110000;  

-- Delete
DELETE FROM Customer WHERE id=121; 

create table Order_details(
Order_id integer PRIMARY KEY,
delivery_date DATE,
cust_id INT,
foreign key (cust_id) references Customer(id) ON DELETE SET NULL
);
INSERT INTO Order_details VALUES (3, '2019-03-11', 1);
INSERT INTO Order_details VALUES (4, '2019-03-11', 1);
SELECT* FROM Order_details;
-- Replace
replace into Customer (id, city, cname)
values(1251, 'Jamui', 'Ram Kumar');
replace into Customer (id, city, cname)
values(1258, 'Muzaffarpur', 'Pramod Uncle');
create table account(
id int PRIMARY KEY,
name varchar(255) UNIQUE,
balance int NOT NULL default 0
);
DELETE FROM Customer Where id=1;
SELECT * FROM account_details;
-- Add new Column
alter TABLE ACCOUNT ADD interest FLOAT NOT NULL DEFAULT 0; 
-- modify
alter TABLE account modify interest DOUBLE NOT NULL DEFAULT 0; 
desc account;
-- Change the Column name
alter table account change column interest saving_interest float not null default 0; 
-- DROP COLUMN
alter table account DROP column  saving_interest; 
-- Rename the column
alter table account rename to account_details; 

create table project (
id int primary key ,
empid int , 
name varchar(255), 
startdate date , 
clientid int);
insert into project values
(1 , 2 ,'A','2021-04-21',3),
(2 , 2 ,'B','2021-03-12',1),
(3 , 3 ,'C','2021-01-16',5),
(4 , 3 ,'D','2021-04-27',2),
(5 , 5 ,'E','2021-05-01',4);
select * from project;
desc project;
create table employee(
id int primary key ,
fname varchar(255),
lname varchar(255),
age int ,
emailid varchar(255) , 
phoneno int(10) , 
city varchar(255)
);

insert into employee values
(1 , 'Aman','Proto', 32 , 'aman@gmail.com',898 , 'Delhi'),
(2 , 'Yagya','Narayan', 44 , 'yagya@gmail.com',222, 'Palam'),
(3 , 'Rahul','BD', 22 , 'rahul@gmail.com',444 , 'Kolkata'),
(4 , 'Jatin','Hermit', 31 , 'jatin@gmail.com',666 , 'Raipur'),
(5 , 'PK','Pandey', 21 , 'pk@gmail.com',555 , 'Jaipur');

select * from employee; 
desc employee;



create table client (
id int primary key ,
first_name varchar(255) ,
last_name varchar(255),
age int , 
emailid varchar(255) , 
phoneNo int ,
city varchar(255) , 
empid int);
select * from client;

insert into client values(1 , 'Mac','Rogers' , 47 , 'mac@hotmail.com' , 333 , 'Kolkata', 3)
,(2 , 'Max','Poirier' , 27 , 'max@gmail.com' , 222 , 'Kolkata', 3)
,(3, 'Peter','Jain' , 24 , 'peter@abc.com' , 111 , 'Delhi', 1)
,(4 , 'Sushant','Aggrawal' , 23 , 'sushant@yahoo.com' , 45454, 'Hyderabad', 5)
,(5 , 'Pratap','Singh' , 36 , 'p@xyz.com' , 77767 , 'Mumbai', 2);
-- 
select e.id, e.fname, e.lname, p.id, p.name from employee as e INNER JOIN project as p ON e.id =p.empID;  
-- 
select e.id, e.emailid, e.phoneno, c.first_name, c.last_name from employee as e INNER JOIN client as c on e.id=c.empid where
e.city='Jaipur' AND c.city='Hyderabad';
--
select * from employee as e LEFT JOIN project as p on e.id=p.empid; 
--
select * from employee as e RIGHT JOIN project as p on e.id=p.empid; 

create table department1 (
empid int primary key  ,
department varchar(255),
role varchar(255)
);

insert into department1 values(1 , 'A' ,'Engineer'),
(2 , 'B' ,'Salesman'),
(3 , 'C' ,'Manager'),
(4 , 'D' ,'Salesman'),
(5 , 'E' ,'Engineer');

select * from department1;
create table department2(
empid int primary key ,
name varchar(255) , 
role varchar(255)
);

insert into department2 values(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman');
insert into department2 values(8, 'H', 'Salesman');
select * from department1 UNION select* from department2;
select * from department1 WHERE role='Salesman'
UNION 
select * from department2 WHERE role='Salesman';
select department1.* from department1 INNER JOIN department2 using (empid);   
--
select department1.* from department1 LEFT JOIN department2 using (empid) WHERE department2.empid is null; 

select * from employee where age in (select age from employee where age > 30);
select * from employee where id in (select empid from project group by empid having count(empid)>1);
select * from employee where age > ( select  avg (age) from employee);
-- 
select max(age) from (select * from employee where fname like '%a%') as temp2;
select max(age) from (select age from employee where fname like '%a%') as temp2;
select * from employee e1 where 3=(select count(e2.age) from employee e2 where e2.age>=e1.age);