--DATA ENGINEERING
--1. Use the provided info to create a table schema for each CSV file
--2. Import each CSV file into its corresponding SQL table

--Drop tables if they exist
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees_by_department CASCADE;
DROP TABLE IF EXISTS manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

--Create departments table
CREATE TABLE departments (
  dept_no VARCHAR(250) NOT NULL,
	PRIMARY KEY (dept_no),
  dept_name VARCHAR(250) NOT NULL
);

--Print departments table
SELECT * FROM departments;

--Create titles table
CREATE TABLE titles (
  title_id VARCHAR(250) NOT NULL,
	PRIMARY KEY (title_id),
  title VARCHAR(250) NOT NULL
);

--Print titles table
SELECT * FROM titles;

--Create employess table
CREATE TABLE employees (
  emp_no VARCHAR(250) NOT NULL,
	PRIMARY KEY (emp_no),
  emp_title_id VARCHAR(250) NOT NULL,
  birth_date VARCHAR (250) NOT NULL,
  first_name VARCHAR (250) NOT NULL,
  last_name VARCHAR (250) NOT NULL,
  sex VARCHAR (250) NOT NULL,
  hire_date VARCHAR (250) NOT NULL
);

--Print employees table
SELECT * FROM employees;

--Create employees by department table
CREATE TABLE employees_by_department (
  emp_no VARCHAR (250) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR (250) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Print employees by department table
SELECT * FROM employees_by_department;

--Create salaries table
CREATE TABLE salaries (
  emp_no VARCHAR (250) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary VARCHAR (250) NOT NULL
);

--Print salaries table
SELECT * FROM salaries;

--Create manager table
CREATE TABLE manager (
  dept_no VARCHAR (250) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no VARCHAR (250) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Print manager table
SELECT * FROM manager;


--DATA ANALYSIS

--1. List the employee number, last name, first name, sex 
--and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2. List the first name, last name, and hire date for the 
--employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--3. List the manager of each department along with their 
--department number, department name, employee number, last name, 
--and first name.
SELECT departments.dept_no, departments.dept_name, manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN manager
ON departments.dept_no = manager.dept_no
	JOIN employees
	ON manager.emp_no = employees.emp_no;

--4. List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department
--name.
SELECT employees_by_department.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees_by_department
JOIN employees
ON employees_by_department.emp_no = employees.emp_no
	JOIN departments
	ON employees_by_department.dept_no = departments.dept_no;

--5. List first name, last name, and sex of each employee whose first
--name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their 
--employee number, last name, and first name.
SELECT employees_by_department.emp_no, employees.last_name, employees.first_name
FROM employees_by_department
JOIN employees
ON employees_by_department.emp_no = employees.emp_no
	JOIN departments
	ON employees_by_department.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and 
--department name.
SELECT employees_by_department.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees_by_department
JOIN employees
ON employees_by_department.emp_no = employees.emp_no
	JOIN departments
	ON employees_by_department.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development';

--8. List the frequency counts, in descending order, of all the 
--employee last names (that is, how many employees share each last 
--name).
SELECT last_name, COUNT (last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;
