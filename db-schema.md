# Employees

id                  INT AUTO_INCREMENT PRIMARY KEY

name                VARCHAR(250) NOT NULL

email               VARCHAR(250) NOT NULL

phno                VARCHAR(250) NOT NULL

role                VARCHAR(250) NOT NULL

reporting_path      VARCHAR(250)

created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP

updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
