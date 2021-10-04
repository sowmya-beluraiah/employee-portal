# EmployeePortal
This project contains a small Employee Portal project.
This is a spring MVC Maven project

# Fucntionalities supported
1.  Project contains a employee DB (refer to [db-schema](https://github.com/sowmya-brm/EmployeePortal/blob/master/db-schema.md))
2. Allows CRUD operations on employee table 
3. Get Reportee's - Gets all employees who are directly or indirectly reported to a given emp ID
4. Get Employee Hierarchy - Gets managerial hierarchy above a given emp ID and display it using breadcrumbs

# TechStack
SpringBoot, JAVA, Bootstrap, JQuery, H2 DB

# Build Instructions
1. Clone the repo
2. Install Spring Tool Suite / Eclipse
3. File -> Import -> Import existing maven project -> select project path -> Finish
4. Right click on project root folder in IDE and select 'Run as SpringBoot App'
5. When project starts, Go to browser and load "http://localhost:8080"
6. To access H2 DB and see table contents, load "http://localhost:8080/h2-console"

# DB Schema
Refer to [db-schema](https://github.com/sowmya-brm/EmployeePortal/blob/master/db-schema.md)

# Design
1. HLD document [hld](https://github.com/sowmya-brm/EmployeePortal/blob/master/design/HLD.PNG)
2. LLD document [lld](https://github.com/sowmya-brm/EmployeePortal/blob/master/design/LLD.PNG)

# Video
Refer to [demo-video](https://drive.google.com/file/d/1SMToz2_ahyVfcLZjdfFq8avmOF_rr4OS/view?usp=sharing)
