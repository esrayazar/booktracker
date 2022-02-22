package com.esra.booktracker.utility;

import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;

import com.esra.booktracker.models.Book;

public class SortUtility {
	
	public List<Book> sortByLikeAsc(List<Book> books)
	{
		PriorityQueue<Book> pq = new PriorityQueue<>((a,b)->a.getLikers().size() - b.getLikers().size());
		return this.sortHelper(pq, books);
	}
	
	private List<Book> sortHelper(PriorityQueue<Book> pq, List<Book> books)
	{
		for(Book b:books) pq.add(b);
		List<Book> result = new ArrayList<>(pq.size());
		while (!pq.isEmpty()) {
			System.out.println("-->"+pq.size());
		    result.add(pq.poll());
		}
		return result;
	}
	

}
