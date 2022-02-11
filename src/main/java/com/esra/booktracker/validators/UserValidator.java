package com.esra.booktracker.validators;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.esra.booktracker.models.User;

@Component
public class UserValidator {

	
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	public void validate(Object target, Errors errors) {
		User user =(User) target;
		
		if (user.getFirstName()==null ||
				user.getFirstName().isEmpty()) {
		System.out.println("1..");
			errors.rejectValue("firstName", "noMattAllowed", "First name shouldnt be empty");
		}
		if (user.getLastName()==null ||
				user.getLastName().isEmpty()) {
			errors.rejectValue("lastName", "noMattAllowed", "Last name shouldnt be empty");
			System.out.println("2..");
		}
	}

}