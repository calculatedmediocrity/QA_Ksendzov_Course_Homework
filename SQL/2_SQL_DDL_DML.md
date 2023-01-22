# SQL_DDL_n_DML_Commands. HW_2

1. Создать таблицу employees
	- id. serial,  primary key,
	- employee_name. Varchar(50), not null
```sql
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);
```

2. Наполнить таблицу employee 70 строками
```sql
insert into employees(employee_name)
values ('Domenica Nica Baccalieri'), 
       ('Anthony Tony B. Blundetto'),
       ('Quintina Pollio Blundetto'),  
       ('Brian Cammarata'),            
       ('Hugo Hugh De Angelis'),     
       ('Mary Pellegrino De Angelis'), 
       ('Alyssa Giglione'),            
       ('Thomas Tommy Giglione, Jr.')
       ('Thomas Tom Giglione, Sr.'), 
       ('Barbara Soprano Giglione'),   
       ('Harpo Hal'),                
       ('Alphonse Al Lombardo'),     
       ('Rita Lombardo'),              
       ('Christopher Moltisanti'),     
       ('Kelli Lombardo Moltisanti'),  
       ('Joanne Blundetto Moltisanti'),
       ('Richard Dickie Moltisanti'),
       ('Anthony John A.J. Soprano, J'),
       ('Anthony John Tony Soprano, S'),
       ('Carmela Soprano'),            
       ('Corrado Uncle Junior Soprano'),
       ('Corrado Soprano, Sr.'),       
       ('Ercoli Eckley Soprano'),    
       ('Janice Soprano'),             
       ('John Francis Johnny Boy Soprano'),
       ('Livia Soprano'),              
       ('Meadow Soprano'),
       ('Svetlana Kirilenko'),         
       ('Valentina La Paz'),           
       ('Irina Peltsin'),              
       ('Julianna Skiff'),             
       ('Gloria Trillo'),              
       ('Tracee'),                     
       ('Furio Giunta'),               
       ('Father Phillip Phil Intintol')
       ('Vic Musto'),                  
       ('Robert Wegler'),              
       ('Aaron Arkaway'),              
       ('Artie Bucco'),                
       ('Charmaine Bucco'),            
       ('Carter Chong'),               
       ('Jeannie Cusamano'),           
       ('Fanny'),                      
       ('Fran Felstein'),              
       ('Dov Ginsberg'),               
       ('George Piocosta'),            
       ('Roberta Bobbi Sanfillipo'), 
       ('Francis Satriale'),           
       ('David Davey Scatino'),      
       ('Kelli Aprile'),               
       ('Rosalie Aprile'),             
       ('Karen Baccalieri'),           
       ('Robert Bobby Baccalieri III'),
       ('Sophia Baccalieri'),          
       ('Jason Blundetto'),   
       ('Kelly Blundetto'),            
       ('Louise Blundetto'),           
       ('Angie Bonpensiero'),          
       ('Edward Duke Bonpensiero');  
```

3. Создать таблицу salary
	- id. Serial  primary key,
	- monthly_salary. Int, not null
```sql
create table salary(
	id serial primary key,
	monthly_salary int not null
);
```

4. Наполнить таблицу salary 15 строками
```sql
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
```

5. Создать таблицу employee_salary
	- id. Serial  primary key,
	- employee_id. Int, not null, unique
	- salary_id. Int, not null
```sql
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);
```

6. Наполнить таблицу employee_salary 40 строками:
	- в 10 строк из 40 вставить несуществующие employee_id
```sql
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
```

7. Создать таблицу roles
	- id. Serial  primary key,
	- role_name. int, not null, unique
```sql
create table roles(
	id serial primary key,
	role_name int not null unique
);
```

8. Поменять тип столба role_name с int на varchar(30)
```sql
ALTER TABLE roles ALTER COLUMN role_name TYPE varchar(30);
```

9. Наполнить таблицу roles 20 строками
```sql
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
```

10. Создать таблицу roles_employee
	- id. Serial  primary key,
	- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
	- role_id. Int, not null (внешний ключ для таблицы roles, поле id)*/
```sql
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id) 
		references employees(id),
	foreign key (role_id)
		references roles(id)
);
```

11. Наполнить таблицу roles_employee 40 строками
```sql
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
```
