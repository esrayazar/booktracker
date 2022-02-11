package com.esra.booktracker.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.esra.booktracker.models.User;
import com.esra.booktracker.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

	public List<User> getAllUsers() {
		return this.userRepository.findAll();
	}

	public User findOneUser(Long id) {
		return this.userRepository.findById(id).orElse(null);
	}

	public User registerUser(User user) {
		// Generate the Hash
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		// Set the hashed password on the users password field
		user.setPassword(hash);
		// Save that new user password and the user object to the database
		return this.userRepository.save(user);
	}

	public boolean authenticateUser(String email, String password) {
		// Query the user by email
		User user = this.userRepository.findByEmail(email);
		if (user == null) {
			return false;
		}
		// Step 2 check provided email against email in database
		return BCrypt.checkpw(password, user.getPassword());
	}

	public User getUserByEmail(String email) {
		return this.userRepository.findByEmail(email);
	}
	
	public void updateUser(User user, User edited) {
		user.setFirstName(edited.getFirstName());
		user.setLastName(edited.getLastName());
		user.setEmail(edited.getEmail());
		user.setDateOfBirth(edited.getDateOfBirth());
		user.setCity(edited.getCity());
		user.setState(edited.getState());
		user.setCountry(edited.getCountry());
		user.setBio(edited.getBio());
	}
	public User saveUser(User user) {
		return userRepository.save(user);
	}
	
	

}
