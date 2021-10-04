package com.example.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.employee.dto.EmployeeDTO;
import com.example.employee.service.EmployeeService;

@RestController
@RequestMapping("/api/v1")
public class EmployeeController {

	@Autowired
	EmployeeService empService;
	
	@GetMapping("/employee/list")
	public ResponseEntity<List<EmployeeDTO>> getEmployeeList() {
		return new ResponseEntity<>(empService.getEmployeeList(), HttpStatus.OK);
    }
	
	@GetMapping("/employee/{empId}")
	public ResponseEntity<EmployeeDTO> getEmployeeDetails(@PathVariable Integer empId) {
		return new ResponseEntity<>(empService.getEmployeeDetails(empId), HttpStatus.OK);
	}
	
	@PostMapping("/employee")
	public ResponseEntity<EmployeeDTO> createEmployee(@RequestBody EmployeeDTO empDTO) {
		return new ResponseEntity<>(empService.createEmployee(empDTO), HttpStatus.OK);
	}
	
	@PutMapping("/employee/{empId}")
	public ResponseEntity<EmployeeDTO> updateEmployee(@RequestBody EmployeeDTO empDTO) {
		return new ResponseEntity<>(empService.updateEmployee(empDTO), HttpStatus.OK);
	}
	
	@DeleteMapping("/employee/{empId}")
	public ResponseEntity<Boolean> deleteEmployee(@PathVariable Integer empId) {
		return new ResponseEntity<>(empService.deleteEmployee(empId), HttpStatus.OK);
	}
	
	@GetMapping("/reportees/{empId}")
	public ResponseEntity<List<EmployeeDTO>> getReportees(@PathVariable Integer empId) {
		return new ResponseEntity<>(empService.getReportees(empId), HttpStatus.OK);
	}
	
	@GetMapping("/hierarchy/{empId}")
	public ResponseEntity<List<EmployeeDTO>> getHierarchy(@PathVariable Integer empId) {
		return new ResponseEntity<>(empService.getHierarchy(empId), HttpStatus.OK);
	}

}
