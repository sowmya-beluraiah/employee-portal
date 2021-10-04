DROP TABLE IF EXISTS employee_sow;

CREATE TABLE employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  email VARCHAR(250) NOT NULL,
  phno VARCHAR(250) NOT NULL,
  role VARCHAR(250) NOT NULL,
  reporting_path VARCHAR(250),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(1, 'Raveendra', 'raveendra@gmail.com', '9872637422', 'Manager', null);
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(2, 'Sanjana', 'sanjana@gmail.com', '9345993234', 'Engineer', '1');
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(3, 'Sushmita', 'sushmita@gmail.com', '9345936414', 'Engineer', '1');
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(4, 'Surya', 'surya@gmail.com', '9835372612', 'Associate', '1/2');
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(5, 'Venkat', 'venkat@gmail.com', '9835625473', 'Associate', '1/3');
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(6, 'Kaushik', 'kaushik@gmail.com', '9123765411', 'Manager', null);
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(7, 'Pratmesh', 'pratmesh@gmail.com', '9123768723', 'Lead', '1/6');
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(8, 'Mayank', 'mayank@gmail.com', '9912374651', 'Engineer', '1/6/7');
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(9, 'Gurpreet', 'gurpreet@gmail.com', '9845236171', 'Lead', '1/6');
INSERT INTO employees(id,name,email,phno,role,reporting_path) VALUES(10, 'Nishant', 'nishant@gmail.com', '9917263542', 'Associate', '1/6/9');

