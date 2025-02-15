--Test
Select * from "Departments";
select * from employee_salary;
drop view employee_salary;

-------
--1.) List the following details of each employee: employee number, 
--last name, first name, sex, and salary.

CREATE VIEW employee_salary AS
	Select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Gender", s.salaries as "Salaries" from "Employees" e
		Inner join "Salaries" s
			On s.emp_no = e.emp_no;

--2.) List first name, last name, and hire date for employees who were hired in 1986.

Create view old_timers as 
	Select first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date" from "Employees" 
		where extract(year from hire_date) = '1986';

--3.) List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.

Create View department_managers as
	Select d.dept_no as "Department Number", d.dept_name as "Department Name", dm.emp_no as "Empoyee Number", e.last_name as "Last Name", e.first_name as "First Name" from "Departments" d
		inner join "Dept_manager" dm 
			on d.dept_no = dm.dept_no
		inner join "Employees" e
			on dm.emp_no = e.emp_no;

--4.)List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

Create view employees_department as 
	Select e.emp_no as "Employee Number", e.last_name "Last Name", e.first_name as "First Name", d.dept_name as "Department Name" from "Dept_emp" de
		inner join "Employees" e
			on de.emp_no = e.emp_no
		inner join "Departments" d
			on de.dept_no = d.dept_no;

--5.)List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."

Create view Hercules_B as
	Select first_name as "First Name", last_name as "Last Name", sex as "Gender" from "Employees"
		where first_name = 'Hercules' 
		and last_name like 'B%';

--6.)List all employees in the Sales department, including their employee number, 
--last name, first name, and department name

Create view employees_sales as
	Select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name From "Employees" e 
		Inner join "Dept_emp" de
			on de.emp_no = e.emp_no
		Inner join "Departments" d
			on de.dept_no = d.dept_no
				where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

Create view employees_sale_development as
	Select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name" From "Employees" e 
		Inner Join "Dept_emp" de
			on e.emp_no = de.emp_no
		Inner Join "Departments" d
			on d.dept_no = de.dept_no
				where d.dept_name = 'Sales' or d.dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
Create view last_names as 
	select last_name as "Last Name", count(last_name) as "Count of Last Names" from "Employees"
		group by "Last Name"
			order by "Count of Last Names" desc;

-------
