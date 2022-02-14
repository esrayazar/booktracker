<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>

<div class="col-sm-6">
<div> <!--  class="center" -->
  <div class="card green">
    <div class="additional">
      <div class="user-card">
        <div class="level center">
         <span> <c:out value="${book.reviews.size()}"></c:out> Reviews </span>
        </div>
        <div class="points center">
        <span>
        <c:out value="${book.likers.size()}"></c:out> Likes
        </span>
        </div>
        <img src="/get/image/byid/${book.image.id}" class="img-fluid d-block mx-auto rounded-circle img-thumbnail mb-4">
      </div>
      <div class="more-info">
        <h1>	<c:out value="${book.title}" /></h1>
        	<hr>
        <div class="coords">
          <span>Year:
          <c:out value="${book.year}" />
          </span><br>
          <span>Genre:
          <c:out value="${book.genre}" /></span>
        </div>
        <div class="coords">
          <span>Author:
					<c:out value="${book.author}" /></span><br>
          <span>	ISBN:
					<c:out value="${book.isbn}" /></span>
        </div>
        <div class="stats">
          <div>
            <div class="title"></div>
            <i class="fa fa-trophy"></i>
            <div class="value">
            
            <c:choose>
			<c:when test="${book.likers.contains(user)}">

				<a href="/books/${book.id}/unlike/bookprofile">Unlike </a>
			</c:when>
			<c:otherwise>
				<a href="/books/${book.id}/like/bookprofile">Like </a>
			</c:otherwise>
		</c:choose>
            </div>
          </div>
          <div>
            <div class="title"></div>
            <i class="fa fa-gamepad"></i>
            <div class="value">
            <c:choose>
			<c:when test="${book.wishList.contains(user)}">
				<a href="/books/${book.id}/wish/remove/bookprofile">Remove Wish
					List </a>
			</c:when>
			<c:otherwise>
				<a href="/books/${book.id}/wish/add/bookprofile">Add Wish List </a>
			</c:otherwise>
		</c:choose>
            
            
            </div>
          </div>
          <div>
            <div class="title"></div>
            <i class="fa fa-group"></i>
            <div class="value">
            <c:choose>
			<c:when test="${book.completedList.contains(user)}">
				You have read this book.
			</c:when>
			<c:otherwise>
				<a href="/books/complete?isbn=${book.isbn}&id=${book.id}">Add
					Your Completed Book List </a>
			</c:otherwise>
		</c:choose>
            
            
            </div>
          </div>
        <!--   <div>
            <div class="title">Coffee</div>
            <i class="fa fa-coffee"></i>
            <div class="value infinity">∞</div>
          </div> -->
        </div>
      </div>
    </div>
    <div class="general">
      <h1>	<c:out value="${book.title}" /></h1>
      <p>	<c:out value="${book.description}" /></p>
      <span class="more">Mouse over the card for more info</span>
    </div>
  </div>

</div> <!-- center -->
</div>	
		
		
		
		
			<%-- <div class="d-flex flex-row">
				
				<img alt="book profile picture" height="128" width="128"
		src="/get/image/byid/${book.image.id}">
				
				<div class="d-sm-table-cell p-2 bd-highlight">
					Title
					<c:out value="${book.title}" />
				</div>
				<div class="d-sm-table-cell p-2 bd-highlight">
					Year
					<c:out value="${book.year}" />
				</div>
				<div class="p-2">
					Genre
					<c:out value="${book.genre}" />
				</div>
			</div>
			<div class="d-flex flex-row">
				<div class="p-2">
					Author
					<c:out value="${book.author}" />
				</div>
				<div class="d-flex flex-row">
					<div class="p-2">
						ISBN
						<c:out value="${book.isbn}" />
					</div>
					<div class="d-sm-table-cell p-2 bd-highlight" >
					Description
					<c:out value="${book.description}" />
					</div>
				</div>
				<div class="p-2">${book.likers.size()}Likes</div>
				<a href="/books/edit/${book.id}">Edit Book Profile</a>
		
		

		<c:choose>
			<c:when test="${book.likers.contains(user)}">

				<a href="/books/${book.id}/unlike/bookprofile">Unlike </a>
			</c:when>
			<c:otherwise>
				<a href="/books/${book.id}/like/bookprofile">Like </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${book.wishList.contains(user)}">
				<a href="/books/${book.id}/wish/remove/bookprofile">Remove Wish
					List </a>
			</c:when>
			<c:otherwise>
				<a href="/books/${book.id}/wish/add/bookprofile">Add Wish List </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${book.completedList.contains(user)}">
				You have read this book.
			</c:when>
			<c:otherwise>
				<a href="/books/complete?isbn=${book.isbn}&id=${book.id}">Add
					Your Completed Book List </a>
			</c:otherwise>
		</c:choose>

		<h5>Ratings for this book:</h5>
		<c:set var="count" value="0" scope="page" />

		<c:forEach items="${book.ratings}" var="rating">
			<c:set var="count" value="${count + rating.rating}" scope="page" />
			<c:if test="${rating.ratedBy.id eq user.id}">
				<p>Rating: ${rating.rating} by ${rating.ratedBy.firstName}</p>
				<c:set var="ratedbyUser" value="true" />
			</c:if>
		</c:forEach>

		<c:choose>
			<c:when test="${count>0}">
				Rating Avg: <c:out value="${count / book.ratings.size()}"></c:out> by <c:out
					value="${book.ratings.size()}"></c:out> members.
			</c:when>
			<c:otherwise>
				No ratings data available :(
			</c:otherwise>
		</c:choose>

		<c:forEach items="${book.reviews}" var="review">
			<div>
				<c:out value="${review.review }"></c:out>
			</div>
			<c:if test="${review.reviewedBy.id eq user.id}">
				<c:set var="rewivedbyUser" value="true" /> (<a href="/books/addreview?book_id=${book.id}">Edit</a>)
				(<a href="/books/${book.id}/review/${review.id}/delete/bookprofile">Delete</a>)
			</c:if>
			
		</c:forEach>

		<c:choose>
			<c:when test="${rewivedbyUser eq true}">
				You have reviewed this book 
			</c:when>
			<c:otherwise>
				<a href="/books/addreview?book_id=${book.id}">Write a review</a>
			</c:otherwise>
		</c:choose>




		<a href= "/books/addreview?book_id=${book.id}">Write a review </a>
		
				
			</div> --%>


<%-- <div class="rating">
<input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
</div>
		
		<c:if test="${not ratedbyUser eq true}">
			<form:form action="/books/addrating" method="post"
				modelAttribute="newRating">
				<div class="form-group">
					<form:label path="rating">Rating</form:label>
					<form:errors class="text-danger" path="rating" />
					<form:input class="form-control" path="rating" />
				</div>
				<!-- Hidden Input for userId -->
				<form:input type="hidden" value="${user.id}" path="ratedBy" />
				<!-- Hidden Input for BookId -->
				<form:input type="hidden" value="${book.id}" path="ratedBook" />

				<button>Rate it!!</button>
			</form:form>
		</c:if> --%>
		
		
</t:navigation>
