-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary 
from employees e join employee_salary es 
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary
from employees e join employee_salary es 
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary 
from employees e right join employee_salary es
on e.id = es.employee_id
join salary s 
on es.salary_id = s.id
where employee_name is null;


-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary
from employees e right join employee_salary es
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where employee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s 
on es.salary_id = s.id 
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name
from employees e left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% java %';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% python %';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %' and lower(role_name) like '% manual %';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %' and lower(role_name) like '% auto%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 'junior %';

-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 'middle %';

-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 's %';

-- 15. Вывести зарплаты Java разработчиков
select monthly_salary, role_name
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '% java %';

-- 16. Вывести зарплаты Python разработчиков
select monthly_salary, role_name
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '% python %';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%middle javascript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%senior java%';

-- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior%' and lower(role_name) like'%qa%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select round(avg(monthly_salary), 2) as average_junior_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%javascript%';

-- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 25. Вывести количество QA инженеров
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 26. Вывести количество Middle специалистов.
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%middle%';

-- 27. Вывести количество разработчиков
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%dev%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%dev%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id
order by 3;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary >= 1700 and monthly_salary < 2300
order by 3;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary >= 1700 and monthly_salary < 2300
order by 3;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary in (1100, 1500, 2000)
order by 3;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary 
from employees e right join employee_salary es
on e.id = es.employee_id
join salary s 
on es.salary_id = s.id
where employee_name is null;


-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary
from employees e right join employee_salary es
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where employee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s 
on es.salary_id = s.id 
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name
from employees e left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% java %';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% python %';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %' and lower(role_name) like '% manual %';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %' and lower(role_name) like '% auto%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 'junior %';

-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 'middle %';

-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 's %';

-- 15. Вывести зарплаты Java разработчиков
select monthly_salary, role_name
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '% java %';

-- 16. Вывести зарплаты Python разработчиков
select monthly_salary, role_name
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '% python %';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%middle javascript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%senior java%';

-- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior%' and lower(role_name) like'%qa%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select round(avg(monthly_salary), 2) as average_junior_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%javascript%';

-- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 25. Вывести количество QA инженеров
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 26. Вывести количество Middle специалистов.
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%middle%';

-- 27. Вывести количество разработчиков
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%dev%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%dev%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id
order by 3;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary >= 1700 and monthly_salary < 2300
order by 3;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary >= 1700 and monthly_salary < 2300
order by 3;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary in (1100, 1500, 2000)
order by 3;