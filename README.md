# Pewlett Hackard Employee Database Analysis

Background:
This repository contained six CSV files with relevant employee information from the 1980s and 1990s. The project involved data modeling, engineering, and analysis to gain insights into the company's historical workforce.

Data Modeling:
The CSV files were inspected, and an Entity Relationship Diagram (ERD) of the tables was sketched using tools like QuickDBD.

Data Engineering:
A table schema was designed for each CSV file, specifying data types, primary keys, foreign keys, and other constraints. Uniqueness for primary keys was ensured, and composite keys were handled if necessary. Tables were created in the correct order to handle foreign keys, and each CSV file was imported into its corresponding SQL table.

In general, for columns like birth_date, first_name, last_name, sex, and hire_date, it was common to enforce NOT NULL constraints because these fields were typically considered essential attributes of an employee record. It ensured that there was always valid and complete data for each employee. However, in the specific context of the task, where the requirement was to use the NOT NULL condition on necessary columns, I limited the application of NOT NULL constraints primarily to primary keys and wherever columns were involved in foreign key relationships or composite keys.

Data Analysis:

Listed employee details including employee number, last name, first name, sex, and salary.
Provided details of department managers including department number, department name, employee number, last name, and first name.
Included department details for each employee, such as department number, last name, first name, and department name.
Identified employees named Hercules with last names beginning with B, specifying their first name, last name, and sex.
Listed employees in the Sales department, including their employee number, last name, and first name.
Enumerated employees in the Sales and Development departments, detailing their employee number, last name, first name, and department name.
Displayed the frequency counts of employee last names in descending order.

Conclusion:
This project aimed to provide comprehensive insights into Pewlett Hackard's historical employee data through meticulous data modeling, engineering, and analysis, contributing to understanding the company's past workforce dynamics.
