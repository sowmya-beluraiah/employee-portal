package com.example.employee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.employee.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer>{
	@Query(value="select e from Employee e where e.reporting_path like CONCAT('%', :empId, '%')")
	public List<Employee> getReportees(String empId);
	
	@Query(value="select e from Employee e where e.id in :empList order by e.id asc")
	public List<Employee> getHierarchy(List<Integer> empList);
	
	@Query(value="select e from Employee e where LOWER(e.name) = :name")
	public Employee findbyName(String name);

}
