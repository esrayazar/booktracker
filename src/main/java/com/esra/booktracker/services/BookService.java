package com.esra.booktracker.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.esra.booktracker.models.Book;
import com.esra.booktracker.models.User;
import com.esra.booktracker.repositories.BookRepository;



@Service
public class BookService {

	@Autowired
	private BookRepository bookRepository;

	// Create
	public Book create(Book book) {
		return this.bookRepository.save(book);
	}

	// find all

	public List<Book> allbooks() {
		return this.bookRepository.findAll();
	}

	// Get one
	public Book getOneBook(Long id) {
		return this.bookRepository.findById(id).orElse(null);
	}

	// Update
	public Book updateBook(Long id, String description) {
		Book book = getOneBook(id);
		book.setDescription(description);
		return bookRepository.save(book);
	}

	// Delete
	public void deleteBook(Long id) {
		this.bookRepository.deleteById(id);
	}

	// Like
	public void likeBook(User user, Book book) {
		List<User> usersWhoLiked = book.getLikers();
		usersWhoLiked.add(user);
		this.bookRepository.save(book);
	}

	// Unlike
	public void unlikeBook(User user, Book book) {
		List<User> usersWhoLiked = book.getLikers();
		usersWhoLiked.remove(user);
		this.bookRepository.save(book);
	}

//	public List<Book> getLikesSortedDesc() {
//		return this.bookRepository.findAllByLikersOrderByLikersDesc();
//	}
//
//	public List<Book> getLikesSortedAsc() {
//		return this.bookRepository.findAllByLikersOrderByLikersAsc();
//	}

}
