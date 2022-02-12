<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>
	<body>
		<div class="container">
			<div class="d-flex flex-row">
				<div class="p-2">
					Title
					<c:out value="${book.title}" />
				</div>
				<div class="p-2">
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
					Description
					<c:out value="${book.description}" />
				</div>
				<div class="p-2">${book.likers.size()}Likes</div>
			</div>
		</div>

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




		<%-- <a href= "/books/addreview?book_id=${book.id}">Write a review </a> --%>
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
		</c:if>



		<%-- <div class="row">
<a href="/books/${book.id}"> Title <c:out value="${book.title}"/></a>
<p> Author <c:out value="${book.author}"/></p>
<p> Year <c:out value="${book.year}"/></p>
<p> Genre <c:out value="${book.genre}"/></p>
<p> Description <c:out value="${book.description}"/></p>
<p> Book Photo <c:out value="${book.imgUrl}"/></p>
</div> --%>
</t:navigation>
</body>
