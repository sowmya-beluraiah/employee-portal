package com.example.employee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.employee.dto.EmployeeDTO;
import com.example.employee.model.Employee;
import com.example.employee.repository.EmployeeRepository;

@Service
public class EmployeeService {
	@Autowired
	EmployeeRepository empRepo;
	
	public List<EmployeeDTO> getEmployeeList() {
		List<Employee> meta = empRepo.findAll();
		List<EmployeeDTO> res = new ArrayList<>();
		for(Employee e : meta) {
			EmployeeDTO temp = new EmployeeDTO();
			BeanUtils.copyProperties(e, temp);
			res.add(temp);
		}
		
		return res;
	}

	public EmployeeDTO getEmployeeDetails(Integer empId) {
		EmployeeDTO dto = new EmployeeDTO();
		BeanUtils.copyProperties(empRepo.getById(empId), dto);
		return dto;
	}

	public EmployeeDTO createEmployee(EmployeeDTO empDTO) {
		Employee meta = new Employee();
		Employee mgr = empRepo.findbyName(empDTO.getReporting_path().toLowerCase());

		BeanUtils.copyProperties(empDTO, meta);
		if(mgr.getReporting_path() != null) {
			meta.setReporting_path(mgr.getReporting_path()+"/"+mgr.getId());
		}else {
			meta.setReporting_path(mgr.getId()+"");
		}
		
		meta = empRepo.save(meta);
		BeanUtils.copyProperties(meta, empDTO);
		return empDTO;
	}

	public EmployeeDTO updateEmployee(EmployeeDTO empDTO) {
		Employee meta = empRepo.getById(empDTO.getId());
		if(meta == null) {
			return null;
		}
		empDTO.setReporting_path(meta.getReporting_path());
		BeanUtils.copyProperties(empDTO, meta);
		meta = empRepo.save(meta);
		BeanUtils.copyProperties(meta, empDTO);
		return empDTO;
	}

	public Boolean deleteEmployee(Integer empId) {
		Employee meta = empRepo.getById(empId);
		if(meta == null) {
			return false;
		}
		empRepo.delete(meta);
		return true;
	}

	public List<EmployeeDTO> getReportees(Integer empId) {
		List<EmployeeDTO> res = new ArrayList<>();
		Optional<Employee> e1 = empRepo.findById(empId);
		if(e1.isEmpty()) {
			return res;
		}
		
		List<Employee> meta = empRepo.getReportees(String.valueOf(empId));
		
		for(Employee e : meta) {
			EmployeeDTO temp = new EmployeeDTO();
			BeanUtils.copyProperties(e, temp);
			res.add(temp);
		}
		
		return res;
	}

	public List<EmployeeDTO> getHierarchy(Integer empId) {
		Employee meta = empRepo.getById(empId);
		if(meta.getReporting_path() == null) {
			return new ArrayList<>();
		}
		
		String[] list = meta.getReporting_path().split("/");
		List<Integer> empList = new ArrayList<>();
		
		for(String s : list) {
			empList.add(Integer.parseInt(s));
		}
		
		
		List<Employee> metaList = empRepo.getHierarchy(empList);
		List<EmployeeDTO> res = new ArrayList<>();
		EmployeeDTO temp;
		for(Employee e : metaList) {
			temp = new EmployeeDTO();
			BeanUtils.copyProperties(e, temp);
			res.add(temp);
		}
		
		temp = new EmployeeDTO();
		BeanUtils.copyProperties(meta, temp);
		res.add(temp);
		return res;
	}
}
