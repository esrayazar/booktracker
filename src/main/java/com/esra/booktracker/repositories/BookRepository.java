package com.esra.booktracker.repositories;

import java.util.List;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.esra.booktracker.models.Book;


@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll();

//	@Query("SELECT i FROM books i Order By i.likers.size DESC")
//	List<Book> findAllByLikersOrderByLikersDesc();
//
//	@Query("SELECT i FROM books i Order By i.likers.size ASC")
//	List<Book> findAllByLikersOrderByLikersAsc();

}
