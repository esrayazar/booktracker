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
import org.springframework.web.bind.annotation.RequestParam;

import com.esra.booktracker.models.Book;
import com.esra.booktracker.models.Rating;
import com.esra.booktracker.models.User;
import com.esra.booktracker.services.BookService;
import com.esra.booktracker.services.UserService;
import com.esra.booktracker.validators.BookValidator;



@Controller
@RequestMapping("/books")
public class BookController {
	
	private static final String PROFILE_PAGE = "bookprofile";
	private static final String WISHLIST_PAGE = "wishlist";
	private static final String COMPLETED_PAGE = "completedlist";
	
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;
	@Autowired
	private BookValidator bookValidator;
	
	@GetMapping("/{id}")
	public String bookProfile(@PathVariable("id") Long id,HttpSession session, Model viewModel) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		viewModel.addAttribute("user", user);
		Book book = bookService.getBookById(id);
		if(book!= null ) {
			viewModel.addAttribute("book", book);
		}
		return "bookprofile.jsp";
	}
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
			return "newbook.jsp";
		}
		book.setUser(user);
		try {
			this.bookService.create(book);
			return "redirect:/dashboard";
		}catch(Exception e){
			viewModel.addAttribute("error", "Book is already exist in the database with ISBN= " + book.getIsbn());
		}
		viewModel.addAttribute("user", user);
		return "newbook.jsp";
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
		// Verify User has access to Edit the Book
		if (editBook.getUser().getId().compareTo((Long) session.getAttribute("user__id")) != 0)
			return "redirect:/books/dashboard";
		model.addAttribute("editBook", editBook);
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		model.addAttribute("user",user);
		return "editbook.jsp";
	}
	@PostMapping("/update/{id}")
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("editBook") Book book,
			BindingResult result, HttpSession session, Model model) {
		bookValidator.validate(book, result);
		if (result.hasErrors()) {
			return "editbook.jsp";
		}
		bookService.updateBook(id, book);
		return "redirect:/books/dashboard";
	}
	@GetMapping("/{id}/delete")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		Book book = bookService.getOneBook(id);
		if (book.getUser().getId().compareTo((Long) session.getAttribute("user__id")) != 0) {
			System.out.println("Warning: Access denied!");
			return "redirect:/books/dashboard";
		}

		this.bookService.deleteBook(id);
		return "redirect:/books/dashboard";
	}
	@GetMapping("/search")
	public String search(@RequestParam String term,HttpSession session, Model viewModel, @ModelAttribute("book") Book book) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		viewModel.addAttribute("user", user);
		viewModel.addAttribute("books", bookService.searchBook(term));
		return "searchpage.jsp";
	}
	//Like
	@GetMapping("/{id}/like/{page}")
	public String like(HttpSession session, @PathVariable("id") Long id, @PathVariable("page") String page) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		Book book = this.bookService.getOneBook(id);
		this.bookService.likeBook(user, book);
		return whichPage(page);
	}
	
	
	//Unlike
	@GetMapping("/{id}/unlike/{page}")
	public String unlike(HttpSession session, @PathVariable("id") Long id, @PathVariable("page") String page) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		Book book = this.bookService.getOneBook(id);
		this.bookService.unlikeBook(user, book);
		return whichPage(page);
	}
	//Add WishList
	
	@GetMapping("/{id}/wish/add/{page}")
	public String addWishList(HttpSession session, @PathVariable("id") Long id, @PathVariable("page") String page) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		Book book = this.bookService.getOneBook(id);
		this.bookService.addWishList(user, book);
		return whichPage(page);
	}
	
	//Remove WishList
	@GetMapping("/{id}/wish/remove/{page}")
	public String removeWhishList(HttpSession session, @PathVariable("id") Long id, @PathVariable("page") String page) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		Book book = this.bookService.getOneBook(id);
		this.bookService.removeWishList(user, book);
		return whichPage(page);
	}
	
	//Complete Reading a Book
	@GetMapping("/complete")
	public String completeBook(HttpSession session, @RequestParam String isbn) {
		// Check if there is any active user session.
		if(session.getAttribute("user__id") == null) return "redirect:/";
		User user = this.userService.findOneUser((Long) session.getAttribute("user__id"));
		Book book = this.bookService.searchBookByIsbn(isbn);
		//this.bookService.completedBookRead(user, book);
		return "redirect:/dashboard";
	}
	
	//Rating
	@PostMapping("/addRating")
	public String addRating(@ModelAttribute("newRating") Rating rating) {
		bookService.AddRating(rating);
		return "redirect:/books";
		
	}
	
	private String whichPage(String page) {
		if(page.equals(PROFILE_PAGE))
			return "redirect:/books/{id}";
		else if(page.equals(WISHLIST_PAGE))
			return "redirect:/wishlist";
		return "redirect:/";
	}

	

}
