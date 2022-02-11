package com.esra.booktracker.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.esra.booktracker.models.Book;


@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll();
	Book findByIsbn(String isbn);

	@Query(
		value = "SELECT * FROM books b WHERE b.title LIKE %:term% OR b.author LIKE %:term% OR b.genre LIKE %:term% OR b.year LIKE %:term%", 
		nativeQuery = true)
	List<Book> findAllbySearchTerm(@Param("term") String term);
//where b.title like %:term%
//	@Query("SELECT i FROM books i Order By i.likers.size DESC")
//	List<Book> findAllByLikersOrderByLikersDesc();
//
//	@Query("SELECT i FROM books i Order By i.likers.size ASC")
//	List<Book> findAllByLikersOrderByLikersAsc();

}
