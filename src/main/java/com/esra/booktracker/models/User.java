package com.esra.booktracker.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
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
	private String dateOfBirth;
	private String city;
	private String state;
	private String country;
	private String bio;
	@NotBlank(message = "Password must be present.")
	@Size(min = 8, message = "Password should be min 8 characters.")
	private String password;
	@Transient
	private String confirmPassword;
	private Boolean isPublic;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Book> books;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "likes", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "book_id"))
	private List<Book> likedBooks;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "wishes", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "book_id"))
	private List<Book> wishedBooks;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "completed", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "book_id"))
	private List<Book> completedBooks;

	@OneToMany(mappedBy = "ratedBy", fetch = FetchType.LAZY)
	private List<Rating> ratings;
	@OneToMany(mappedBy = "reviewedBy", fetch = FetchType.LAZY)
	private List<Review> reviews;

	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Image image;
	
	@Transient
	MultipartFile imgfile;

}