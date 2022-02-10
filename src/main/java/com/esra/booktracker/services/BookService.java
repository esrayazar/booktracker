package com.esra.booktracker.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.esra.booktracker.models.Book;
import com.esra.booktracker.models.Rating;
import com.esra.booktracker.models.User;
import com.esra.booktracker.repositories.BookRepository;
import com.esra.booktracker.repositories.RatingRepository;



@Service
public class BookService {

	@Autowired
	private BookRepository bookRepository;
	@Autowired
	private RatingRepository ratingRepository;

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
	public Book updateBook(Long id, Book edited) {
		Book book = getOneBook(id);
		book.setAuthor(edited.getAuthor());
		book.setDescription(edited.getDescription());
		book.setGenre(edited.getGenre());
		book.setIsbn(edited.getIsbn());
		book.setTitle(edited.getTitle());
		book.setYear(edited.getYear());
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
	
//	Add Rating to Art 
	public void AddRating(Rating rating) {
		 ratingRepository.save(rating);
	}
	

//	public List<Book> getLikesSortedDesc() {
//		return this.bookRepository.findAllByLikersOrderByLikersDesc();
//	}
//
//	public List<Book> getLikesSortedAsc() {
//		return this.bookRepository.findAllByLikersOrderByLikersAsc();
//	}

}
