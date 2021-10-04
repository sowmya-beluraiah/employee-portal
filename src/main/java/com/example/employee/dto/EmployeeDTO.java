package com.example.employee.dto;

import lombok.Data;

@Data
public class EmployeeDTO {
	private Integer id;
	private String name;
	private String email;
	private String phno;
	private String role;
	private String reporting_path;
}
