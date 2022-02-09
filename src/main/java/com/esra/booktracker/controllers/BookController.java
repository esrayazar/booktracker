package com.esra.booktracker.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.esra.booktracker.models.Book;
import com.esra.booktracker.models.User;
import com.esra.booktracker.services.BookService;
import com.esra.booktracker.services.UserService;
import com.esra.booktracker.validators.BookValidator;



@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;
	@Autowired
	private BookValidator bookValidator;
	
	@GetMapping("/create")
	public String newBook(HttpSession session, Model viewModel, @ModelAttribute("book") Book book) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		viewModel.addAttribute("user", user);
//		viewModel.addAttribute("books", this.bookService.allbooks());
		return "newbook.jsp";
	}
	
	@PostMapping("/create")
	public String addBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session,
			Model viewModel) {
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		bookValidator.validate(book, result);
		if (result.hasErrors()) {
			viewModel.addAttribute("user", user);
			return "new.jsp";
		}
		book.setUser(user);
		this.bookService.create(book);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, @ModelAttribute("editBook") Book book, Model model,
			HttpSession session) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		Book editBook = bookService.getOneBook(id);
		// Check if the given id returns anything from DB
		// This will prevent white label error on UI
		if (editBook == null) {
			System.out.println("book id=" + id + " is not found in DB.");
			return "redirect:/edit/dashboard";
		}
		// Verify User has access to Edit the Idea
		if (editBook.getUser().getId().compareTo((Long) session.getAttribute("user__id")) != 0)
			return "redirect:/books/dashboard";
		model.addAttribute("editBook", editBook);
		return "editbook.jsp";
	}
	

}
