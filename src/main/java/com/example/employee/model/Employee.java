package com.example.employee.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="employees")
@Getter
@Setter
public class Employee {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	private String name;
	
	private String email;
	
	private String phno;
	
	private String role;
	
	private String reporting_path;

	@CreationTimestamp()
	@Column(updatable=false)
	private Timestamp created_at;

	@UpdateTimestamp
	private Timestamp updated_at;
	
	
}
