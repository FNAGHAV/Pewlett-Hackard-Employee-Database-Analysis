-- Data Engineering

CREATE TABLE "Titles" (
    "title_id" VARCHAR(5) NOT NULL,
    "title" VARCHAR(20),
    PRIMARY KEY ("title_id")
);

CREATE TABLE "Employees" (
    "emp_no " INT NOT NULL,
    "emp_title_id " VARCHAR(5) NOT NULL,
    "birth_date " DATE,
    "first_name " VARCHAR(20),
    "last_name " VARCHAR(20),
    "sex " VARCHAR(1),
    "hire_date " DATE,
    PRIMARY KEY ("emp_no "),
    FOREIGN KEY ("emp_title_id ") REFERENCES "Titles" ("title_id")
);

CREATE TABLE "Departments" (
    "dept_no " VARCHAR(4) NOT NULL,
    "dept_name " VARCHAR(20),
    PRIMARY KEY ("dept_no ")
);

CREATE TABLE "Dept_emp" (
    "emp_no " INT NOT NULL,
    "dept_no " VARCHAR(4) NOT NULL,
    PRIMARY KEY ("emp_no ","dept_no "),
    FOREIGN KEY ("emp_no ") REFERENCES "Employees" ("emp_no "),
    FOREIGN KEY ("dept_no ") REFERENCES "Departments" ("dept_no ")
);

CREATE TABLE "Dept_manager" (
    "dept_no " VARCHAR(4) NOT NULL,
    "emp_no " INT NOT NULL, 
    PRIMARY KEY ("dept_no ","emp_no "),
    FOREIGN KEY ("dept_no ") REFERENCES "Departments" ("dept_no "),
    FOREIGN KEY ("emp_no ") REFERENCES "Employees" ("emp_no ")
); 

CREATE TABLE "Salaries" (
    "emp_no " INT NOT NULL,
    "salary " INT NOT NULL,
    PRIMARY KEY ("emp_no ","salary "),
    FOREIGN KEY ("emp_no ") REFERENCES "Employees" ("emp_no ")
);

-- List the employee number, last name, first name, sex, and salary of each employee

SELECT E."emp_no ", E."first_name ", E."last_name ", E."sex ", S."salary "
FROM "Employees" AS E
INNER JOIN "Salaries" AS S
  ON E."emp_no " = S."emp_no ";
  
-- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT E."first_name ", E."last_name ", E."hire_date "
FROM "Employees" AS E
WHERE  E."hire_date " BETWEEN DATE '1986-01-01' AND DATE '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT E."first_name ", E."last_name ", DM."dept_no ", DM."emp_no ", D."dept_name "
FROM "Employees" AS E
INNER JOIN "Dept_manager" AS DM
	ON DM."emp_no " = E."emp_no "
INNER JOIN "Departments" AS D
	ON D."dept_no " = DM."dept_no "
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT DP."dept_no ", DP."emp_no ", D."dept_name ", E."first_name ", E."last_name "
FROM "Dept_emp" AS DP
INNER JOIN "Employees" AS E
	ON DP."emp_no " = E."emp_no "
INNER JOIN "Departments" AS D
	ON D."dept_no " = DP."dept_no "
	
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT E."first_name ", E."last_name ", E."sex "
FROM "Employees" AS E
WHERE E."first_name " = 'Hercules'
AND E."last_name " LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name

SELECT E."emp_no ", E."last_name ", E."first_name ", D."dept_name "
FROM "Employees" AS E
INNER JOIN "Dept_emp" AS DP 
	ON E."emp_no " = DP."emp_no "
INNER JOIN "Departments" AS D
	ON D."dept_no " = DP."dept_no "
WHERE DP."dept_no " = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT D."dept_name ", E."emp_no ", E."last_name ", E."first_name "
FROM "Employees" AS E
INNER JOIN "Dept_emp" AS DP 
	ON E."emp_no " = DP."emp_no "
INNER JOIN "Departments" AS D
	ON D."dept_no " = DP."dept_no "
WHERE DP."dept_no " IN ('d007','d005')
GROUP BY D."dept_name ", E."emp_no ", E."last_name ", E."first_name ";

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT E."last_name ", COUNT (*) AS "Total Count"
FROM "Employees" AS E
GROUP BY E."last_name "
ORDER BY "Total Count" DESC, E."last_name " ASC;
