package com.esra.booktracker.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "books")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String title;
	private String author;
	private String year;
	private String genre;
	private String description;
	private String imgUrl;
	
	@Column(unique=true)
	private String isbn;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "likes", joinColumns = @JoinColumn(name = "book_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> likers;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "wishes", joinColumns = @JoinColumn(name = "book_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> wishList;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "completed", joinColumns = @JoinColumn(name = "book_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> completedList;
	
	@OneToMany(mappedBy ="ratedBook", fetch=FetchType.LAZY)
	 private List<Rating> ratings;
	
	@OneToMany(mappedBy ="reviewedBook", fetch=FetchType.LAZY, cascade = CascadeType.ALL)
	 private List<Review> reviews;
	
	@OneToOne(mappedBy = "book", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Image image;
	
	@Transient
	MultipartFile imgfile;
	
	

}
