--Таблица employees

/* 1. Создать таблицу employees
	- id. serial,  primary key,
	- employee_name. Varchar(50), not null */

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

-- 2. Наполнить таблицу employee 70 строками.

insert into employees(employee_name)
values ('James Gandolfini'),
	('Edie Falco'),
	('Michael Imperioli'),
	('Steve Van Zandt'),
	('Robert Iler'),
	('Tony Sirico'),
	('Jamie-Lynn Sigler'),
	('Lorraine Bracco'),
	('Dominic Chianese'),
	('Aida Turturro'),
	('Steve Schirripa'),
	('Drea de Matteo'),
	('Dan Grimaldi'),
	('Joseph R. Gannascoli'),
	('Sharon Angela'),
	('John Ventimiglia'),
	('Vincent Curatola'),
	('Frank Vincent'),
	('Federico Castelluccio'),
	('Jerry Adler'),
	('Arthur J. Nascarella'),
	('Max Casella'),
	('Maureen Van Zandt'),
	('Vincent Pastore'),
	('Robert Funaro'),
	('Carl Capotorto'),
	('Matt Servitto'),
	('Tom Aldredge'),
	('Nancy Marchand'),
	('Joe Pantoliano'),
	('Suzanne Shepherd'),
	('Kathrine Narducci'),
	('Angelo Massagli'),
	('Denise Borino-Quinn'),
	('Ray Abruzzo'),
	('George Loros'),
	('Tony Darrow'),
	('Steve Buscemi'),
	('Peter Bogdanovich'),
	('Will Janowitz'),
	('Richard Portnow'),
	('Oksana Lada'),
	('Paul Schulze'),
	('John Fiore'),
	('Frank Santorelli'),
	('John Ciarcia'),
	('Miryam Coppersmith'),
	('Jeffrey M. Marchetti'),
	('Jason Cerbone'),
	('Frank Pando'),
	('Toni Kalem'),
	('Frank Pellegrino'),
	('Tony Lip'),
	('Anthony J. Ribustello'),
	('Joe Pucillo'),
	('David Proval'),
	('Al Sapienza'),
	('Karen Young'),
	('Richard Maldone'),
	('John Bianco'),
	('Danielle Di Vecchio'),
	('Ed Vassallo'),
	('Louis Lombardi'),
	('Greg Antonacci'),
	('Lenny Venito'),
	('Annika Pergament'),
	('Marianne Leone'),
	('Chris Caldovino'),
	('Dan Castleman'),
	('Joseph Badalucco Jr.');

select * from employees e;

--Таблица salary

/* 3. Создать таблицу salary
	- id. Serial  primary key,
	- monthly_salary. Int, not null */

create table salary(
	id serial primary key,
	monthly_salary int not null
);

--сбросить счётчик id 
--ALTER SEQUENCE salary_id_seq RESTART WITH 1; 

-- 4. Наполнить таблицу salary 15 строками

insert into salary(monthly_salary)
values (1000),
	(1100),
	(1200),
	(1300),
	(1400),
	(1500),
	(1600),
	(1700),
	(1800),
	(1900),
	(2000),
	(2100),
	(2200),
	(2300),
	(2400),
	(2500);

select * from salary s ;

--Таблица employee_salary

/* 5. Создать таблицу employee_salary
	- id. Serial  primary key,
	- employee_id. Int, not null, unique
	- salary_id. Int, not null */

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

/* 6. Наполнить таблицу employee_salary 40 строками:
	- в 10 строк из 40 вставить несуществующие employee_id*/

insert into employee_salary(employee_id, salary_id)
values (1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 1),
	(18, 2),
	(19, 3),
	(20, 4),
	(21, 5),
	(22, 6),
	(23, 7),
	(24, 8),
	(25, 9),
	(26, 10),
	(27, 11),
	(28, 12),
	(29, 13),
	(30, 14),
	(311, 15),
	(322, 16),
	(333, 1),
	(344, 2),
	(355, 3),
	(366, 4),
	(377, 5),
	(388, 6),
	(399, 7),
	(400, 8);

select * from employee_salary es ;

--Таблица roles

/* 7. Создать таблицу roles
	- id. Serial  primary key,
	- role_name. int, not null, unique */

create table roles(
	id serial primary key,
	role_name int not null unique
);

-- 8. Поменять тип столба role_name с int на varchar(30)

ALTER TABLE roles ALTER COLUMN role_name TYPE varchar(30);

-- 9. Наполнить таблицу roles 20 строками

insert into roles(role_name)
values ('Junior Python developer'),
	('Middle Python developer'),
	('Senior Python developer'),
	('Junior Java developer'),
	('Middle Java developer'),
	('Senior Java developer'),
	('Junior JavaScript developer'),
	('Middle JavaScript developer'),
	('Senior JavaScript developer'),
	('Junior Manual QA engineer'),
	('Middle Manual QA engineer'),
	('Senior Manual QA engineer'),
	('Project Manager'),
	('Designer'),
	('HR'),
	('CEO'),
	('Sales manager'),
	('Junior Automation QA engineer'),
	('Middle Automation QA engineer'),
	('Senior Automation QA engineer');

select * from roles;

--Таблица roles_employee

/* 10. Создать таблицу roles_employee
	- id. Serial  primary key,
	- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
	- role_id. Int, not null (внешний ключ для таблицы roles, поле id)*/

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id) 
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

-- 11. Наполнить таблицу roles_employee 40 строками

insert into roles_employee(employee_id, role_id)
values (1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20),
	(21, 1),
	(22, 2),
	(23, 3),
	(24, 4),
	(25, 5),
	(26, 6),
	(27, 7),
	(28, 8),
	(29, 9),
	(30, 10),
	(31, 11),
	(32, 12),
	(33, 13),
	(34, 14),
	(35, 15),
	(36, 16),
	(37, 17),
	(38, 18),
	(39, 19),
	(40, 20);

select * from roles_employee;