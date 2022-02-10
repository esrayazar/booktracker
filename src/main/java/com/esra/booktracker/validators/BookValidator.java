package com.esra.booktracker.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.esra.booktracker.models.Book;
@Component
public class BookValidator {

	public boolean supports(Class<?> clazz) {
		return Book.class.equals(clazz);
	}
	
	public void validate(Object target, Errors errors) {
		Book idea =(Book) target;
		if(idea.getDescription().equals("")) 
			errors.rejectValue("description", "Blank", "Book must be Present");
	
	}
}
