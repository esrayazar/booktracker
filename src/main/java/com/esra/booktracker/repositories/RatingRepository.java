package com.esra.booktracker.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.esra.booktracker.models.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {
	
	

}