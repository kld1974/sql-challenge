--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_num, e.emp_fname, e.emp_lname, e.emp_sex, s.salary
FROM employees e
JOIN salaries s ON s.sal_emp_num = e.emp_num

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.emp_fname, e.emp_lname, e.emp_hire_date
FROM employees e
WHERE date_part('year', e.emp_hire_date) = 1986

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
   d.dept_name Dept_Name
	,d.dept_num Dept_Number
  ,e.emp_fname First_Name
  ,e.emp_lname Last_Name
	,e.emp_num Emp_Number
from dept_mgr m
join employees e on (m.dm_emp_num = e.emp_num)
join departments d on (m.dm_dept_num = d.dept_num);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select 
  d.dept_num Dept_Number
  ,e.emp_num Emp_Number
  ,e.emp_fname First_Name
  ,e.emp_lname Last_Name
  ,d.dept_name Dept_Name
from employees e
join dept_xref x on (x.dx_emp_num = e.emp_num)
join departments d on (d.dept_num = x.dx_dept_num);


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select 
  e.emp_fname First_Name
  ,e.emp_lname Last_Name
	,e.emp_sex
from employees e
where Upper(e.emp_fname) = 'HERCULES'
and Upper(e.emp_lname) like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select 
  e.emp_num Emp_Number
  ,e.emp_fname First_Name
  ,e.emp_lname Last_Name 
from employees e
join dept_xref x on (x.dx_emp_num = e.emp_num)
join departments d on (d.dept_num = x.dx_dept_num)
Where d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
  e.emp_num Emp_Number
  ,e.emp_fname First_Name
  ,e.emp_lname Last_Name 
	,d.dept_name Dept_Name
from employees e
join dept_xref x on (x.dx_emp_num = e.emp_num)
join departments d on (d.dept_num = x.dx_dept_num)
Where (d.dept_name = 'Sales' or d.dept_name = 'Development');



--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select 
  e.emp_lname Last_Name
	,count(*)
from employees e
group by e.emp_lname
order by 2 desc, 1 ;


