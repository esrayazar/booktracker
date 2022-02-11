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
	
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
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
	public Boolean getIsPublic() {
		return isPublic;
	}
	public void setIsPublic(Boolean isPublic) {
		this.isPublic = isPublic;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	public List<Book> getLikedBooks() {
		return likedBooks;
	}
	public void setLikedBooks(List<Book> likedBooks) {
		this.likedBooks = likedBooks;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", dateOfBirth=" + dateOfBirth + ", city=" + city + ", state=" + state + ", country=" + country
				+ ", bio=" + bio + ", password=" + password + ", confirmPassword=" + confirmPassword + ", isPublic="
				+ isPublic + ", books=" + books + ", likedBooks=" + likedBooks + "]";
	}
	public List<Book> getWishedBooks() {
		return wishedBooks;
	}
	public void setWishedBooks(List<Book> wishedBooks) {
		this.wishedBooks = wishedBooks;
	}
	public List<Book> getCompletedBooks() {
		return completedBooks;
	}
	public void setCompletedBooks(List<Book> completedBooks) {
		this.completedBooks = completedBooks;
	}
	
	
	
	
	
}