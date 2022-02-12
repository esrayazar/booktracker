package com.esra.booktracker.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.esra.booktracker.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {
	
	

}