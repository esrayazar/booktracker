package com.esra.booktracker.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.esra.booktracker.models.Book;
import com.esra.booktracker.models.Image;
import com.esra.booktracker.models.Rating;
import com.esra.booktracker.models.Review;
import com.esra.booktracker.models.User;
import com.esra.booktracker.repositories.BookRepository;
import com.esra.booktracker.repositories.ImageRepository;
import com.esra.booktracker.repositories.RatingRepository;
import com.esra.booktracker.repositories.ReviewRepository;
import com.esra.booktracker.utility.ImageUtility;

@Service
public class BookService {

	@Autowired
	private BookRepository bookRepository;
	@Autowired
	private RatingRepository ratingRepository;
	@Autowired
	private ReviewRepository reviewRepository;
	@Autowired
	ImageRepository imageRepository;

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
	public Book updateBook(Long id, Book edited, MultipartFile file) throws IOException {
		Book book = getOneBook(id);
		book.setAuthor(edited.getAuthor());
		book.setDescription(edited.getDescription());
		book.setGenre(edited.getGenre());
		book.setIsbn(edited.getIsbn());
		book.setTitle(edited.getTitle());
		book.setYear(edited.getYear());
		
		if(!file.getOriginalFilename().isEmpty())
		{
			// if book has already a profile picture
			if (book.getImage() != null) {
				Image image = imageRepository.findById(book.getImage().getId()).get();
				image.setName(file.getOriginalFilename());
				image.setType(file.getContentType());
				image.setImage(ImageUtility.compressImage(file.getBytes()));
				imageRepository.save(image);
			} else {
				imageRepository.save(Image.builder().name(file.getOriginalFilename()).type(file.getContentType()).book(book)
						.image(ImageUtility.compressImage(file.getBytes())).build());
			}
		}
		

		return bookRepository.save(book);
	}

	// Delete
	public void deleteBook(Long id) {
		this.bookRepository.deleteById(id);
	}

	// Search Book
	public List<Book> searchBook(String term) {
		List<Book> searchResult = new ArrayList<>();
		Book book = this.bookRepository.findByIsbn(term);
		if (book != null) {
			searchResult.add(book);
			return searchResult;
		}

		searchResult = bookRepository.findAllbySearchTerm(term);// searchByTerm(term);
		return searchResult;
	}

	public Book searchBookByIsbn(String isbn) {
		return this.bookRepository.findByIsbn(isbn);
	}
	// book detail

	public Book getBookById(Long id) {
		return this.bookRepository.findById(id).get();
	}

	// Like
	public void likeBook(User user, Book book) {
		book.getLikers().add(user);
		this.bookRepository.save(book);
	}

	// Unlike
	public void unlikeBook(User user, Book book) {
		book.getLikers().remove(user);
		this.bookRepository.save(book);
	}

	// AddWishList
	public void addWishList(User user, Book book) {
		book.getWishList().add(user);
		this.bookRepository.save(book);
	}

	// RemoveWishList
	public void removeWishList(User user, Book book) {
		book.getWishList().remove(user);
		this.bookRepository.save(book);
	}

//	Add Rating to Book
	public void AddRating(Rating rating) {
		ratingRepository.save(rating);
	}

//	Add Review to Book
	public void AddReview(Review review) {
		reviewRepository.save(review);
	}

	// Delete review
	public void deleteReview(Review review) {
		this.reviewRepository.delete(review);
	}

//Completed Book
	public void completeBookRead(User user, Book book) {
		book.getCompletedList().add(user);
		this.bookRepository.save(book);
	}

	public Review findReviewById(Long id) {
		return reviewRepository.findById(id).get();
	}

//	public List<Book> getLikesSortedDesc() {
//		return this.bookRepository.findAllByLikersOrderByLikersDesc();
//	}
//
//	public List<Book> getLikesSortedAsc() {
//		return this.bookRepository.findAllByLikersOrderByLikersAsc();
//	}

}
