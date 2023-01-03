# SQL - Database Dynamite!
![blog_post_sql](https://user-images.githubusercontent.com/115101031/210284687-68a4303f-ce40-41bc-857b-44f592b14280.gif)

## Background
Structured query language (SQL) is a programming language for storing and processing information in a relational database. A relational database stores information in table form, with rows and columns representing different data attributes and the various relationships between the data values. You can use SQL statements to store, update, remove, search, and retrieve information from the database. You can also use SQL to maintain and optimize database performance.

SQL is a popular query language that is frequently used in all types of applications. Data analysts and developers learn and use SQL because it integrates well with different programming languages. For example, they can embed SQL queries with the Java programming language to build high-performing data processing applications with major SQL database systems such as Oracle or MS SQL Server. SQL is also fairly easy to learn as it uses common English keywords in its statements

SOURCE: https://aws.amazon.com/what-is/sql/ 

## Project Details

Hired as a new data engineer at Pewlett Hackard two weeks ago, my first major task is to complete a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

To complete the project, I will design tables to hold the data from the CSV files, import the CSV files into a SQL database, and then analyze the data. 

This will comprise three key steps:
* Data modeling - Sketch an Entity Relationship Diagram of the CSV files
* Data engineering - Use the provided information to create a table schema for each of the six CSV files
* Data analysis - Vareity of analytics

For this project I will use:
* pgAdmin 4
* ERD tool: www.quickdatabasediagrams.com

## Observations & Results

### Data Modeling
Creating an Entity Relationship Diagram (ERD)allowed me to visualize the relationships between entities like employees, managers, departments, titles and salaries in constructing a database. An ERD also helped visualize the attributes of these entities.

By defining the entities, their attributes, and showing the relationships between them, an ERD can illustrate the logical structure of the database we want to build, including identifying primary and foreign keys.  When documenting a system or process, looking at a system in multiple ways increases the understanding of that system. Our ERD diagram also allowed me to display the contents of the data to be stored. Ultimately, it helped me to visualize how data is connected in a general way, and for constructing a relational database.

![QuickDBD-SQL-Challenge (ERD)](https://user-images.githubusercontent.com/115101031/210285417-736ef3f1-2ec8-443c-8268-ea273af760e7.jpg)
Link: https://app.quickdatabasediagrams.com/#/d/HzdCcl

### Data Engineering
Data Engineering is essentially about processing data depending on our needs. Conventionally, it involves:
* Finding key insights from the whole database.
* Interpreting data: Sometimes the data which is extracted from the database is not understandable so cleaning and transforming the same is needed.
* ETL Process: An expanded form of ETL is extracting, loading, and transforming the data.

Using our ERD to create tables for to store each of our CSV files, I was able to query several aspects of the data and examine its relationship.

Link to SQL code: https://github.com/MichelleCar/SQL-Challenge/blob/8f8e838ccd1cf731a343ffff2afc53c76ea94571/EmployeeSQL/Employees.sql 

### Data Analysis
SQL (using pgAdmin) is accessible, can build complex models and analyses quickly, and offers a deep ability for data manipulation.  The ability to give SQL simple commands in English for complex procedures meant that I could quickly combine data (through JOINS), search for specific data (using WHERE or LIKE), and quickly draw conclusions.  SQL is an excellent tool to build data warehouses thanks to easy accessibility, clear organization, and ability to interact effectively.

### Last thoughts
Another way many use SQL data analytics is by integrating them directly into other frameworks, offering additional functionality and communication abilities without having to build entire structures from scratch. Indeed, SQL analytics can be used within languages like Python.

SOURCE: https://www.sisense.com/glossary/sql-for-data-analysis/ 
