--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no
, e.last_name
, e.first_name
, e.gender
, s.salary
from employee e
left join salary s on e.emp_no = s.emp_no;

--2. List employees who were hired in 1986.
select *
from employee e
where e.hire_date between '01/01/1986' and '12/31/1986';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no
,d.dept_name
, dm.emp_no
, e.last_name
, e.first_name
, dm.from_date
, dm.to_date
from dept_manager dm
left join department d on dm.dept_no = dm.dept_no
left join employee e on dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no
, e.last_name
, e.first_name
, d.dept_name
from employee e
left join dept_emp de on e.emp_no = de.emp_no
left join department d on de.dept_no = d.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select *
from employee e
where upper(e.first_name) = 'HERCULES' and upper(e.last_name) LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no
, e.last_name
, e.first_name
, d.dept_name
from employee e
left join dept_emp de on e.emp_no = de.emp_no
left join department d on de.dept_no = d.dept_no
where upper(d.dept_name) = 'SALES';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no
, e.last_name
, e.first_name
, d.dept_name
from employee e
left join dept_emp de on e.emp_no = de.emp_no
left join department d on de.dept_no = d.dept_no
where upper(d.dept_name) in ('SALES', 'DEVELOPMENT' );

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employee e
group by last_name
order by count(last_name) DESC;


--Epilogue
select *
from employee e
left join salary s on e.emp_no = s.emp_no
where e.emp_no = '499942';