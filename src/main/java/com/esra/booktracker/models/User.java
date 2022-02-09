package com.esra.booktracker.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank(message = "First Name must be present.")
	@Size(min = 3, max = 64, message = "First Name must be between 1-64 characters.")
	private String firstName;
	@NotBlank(message = "Last Name must be present.")
	@Size(min = 3, max = 64, message = "Last Name must be between 1-64 characters.")
	private String lastName;
	@Email(message = "Invalid email!")
	@NotBlank(message = "Email must be present.")
	private String email;
	@NotBlank(message = "Password must be present.")
	@Size(min = 8, message = "Password should be min 8 characters.")
	private String password;
	@Transient
	private String confirmPassword;
	
	
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public User() {
		super();
	}
	
	
	
	
	
}