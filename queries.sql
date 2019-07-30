--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary 
FROM employees AS e 
INNER JOIN salaries AS s 
ON e.emp_no=s.emp_no
ORDER BY e.emp_no;

--List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date 
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date)=1986;

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, 
--and start and end employment dates.
SELECT dm.dept_no, dm.emp_no, dm.from_date, dm.to_date, e.first_name, e.last_name, d.dept_name
FROM dept_manager AS dm 
INNER JOIN employees AS e ON dm.emp_no=e.emp_no 
INNER JOIN departments AS d ON dm.dept_no=d.dept_no;

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM employees AS e 
INNER JOIN dept_emp AS de 
ON e.emp_no=de.emp_no 
INNER JOIN departments AS d 
ON de.dept_no=d.dept_no
ORDER BY e.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name 
FROM employees 
WHERE first_name='Hercules' and left(last_name,1)='B';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM employees AS e 
INNER JOIN dept_emp AS de 
ON e.emp_no=de.emp_no 
INNER JOIN departments AS d 
ON de.dept_no=d.dept_no 
WHERE dept_name='Sales';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM employees AS e 
INNER JOIN dept_emp AS de 
ON e.emp_no=de.emp_no 
INNER JOIN departments AS d 
ON de.dept_no=d.dept_no 
WHERE dept_name IN ('Sales','Development');

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT last_name, COUNT(last_name) AS last_name_count 
FROM employees 
GROUP BY last_name 
ORDER BY last_name_count DESC; 
