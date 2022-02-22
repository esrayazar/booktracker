<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<script type="text/javascript" src="/js/rating.js"></script>
<t:navigation>
	<div class="col-md-6">
		<hr>
		<div class="row">
			<div class="col">Sort By</div>
			<div class="col">
				Like <a href="/books/search?term=${term}&method=asc&by=likes"><i
					class="fas fa-arrow-up"></i></a> <a
					href="/books/search?term=${term}&method=desc&by=likes"><i
					class="fas fa-arrow-down"></i></a>
			</div>
			<div class="col">
				Reviews <a href="/books/search?term=${term}&method=asc&by=reviews"><i
					class="fas fa-arrow-up"></i></a> <a
					href="/books/search?term=${term}&method=desc&by=reviews"><i
					class="fas fa-arrow-down"></i></a>
			</div>
			<div class="col">
				Ratings <a href="/books/search?term=${term}&method=asc&by=ratings"><i
					class="fas fa-arrow-up"></i></a> <a
					href="/books/search?term=${term}&method=desc&by=ratings"><i
					class="fas fa-arrow-down"></i></a>
			</div>
			<div class="col">
				Wish <a href="/books/search?term=${term}&method=asc&by=wish"><i
					class="fas fa-arrow-up"></i></a> <a
					href="/books/search?term=${term}&method=desc&by=wish"><i
					class="fas fa-arrow-down"></i></a>
			</div>
		</div>
		<hr>
		<div class="row" id="result">
		<span class="text-center">${books.size()} result(s) found.</span>
		</div>

		<c:forEach items="${books}" var="book">
		
			<section class="section about-section gray-md" id="about">
				<div class="row align-items-center flex-row-reverse" >
					<div class="col-lg-3">
						<hr>
						<div class="row">
						
							<div class="col-sm-3">
								<c:choose>
									<c:when test="${book.likers.contains(user)}">
										<a href="/books/${book.id}/unlike/bookprofile"><i
											class="fa-regular fa-thumbs-down fa-2x"></i> </a>
									</c:when>
									<c:otherwise>
										<a href="/books/${book.id}/like/bookprofile"><i
											class="fa-regular fa-thumbs-up fa-2x"></i> </a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-sm-3">
								<c:choose>
									<c:when test="${book.wishList.contains(user)}">
										<a href="/books/${book.id}/wish/remove/bookprofile"> <i
											class="fa-solid fa-heart fa-2x"></i></a>
									</c:when>
									<c:otherwise>
										<a href="/books/${book.id}/wish/add/bookprofile"> <i
											class="fa-regular fa-heart fa-2x"></i></a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-sm-3">
								<a href="/books/addreview?book_id=${book.id}"><i
									class="fa-solid fa-comments fa-2x"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="about-text go-to">
							<div class="row">
								<div class="col">
									<h4 class="dark-color">
									<a href="/books/${book.id}">${book.title}</a>
								<c:if test="${book.user.id eq user.id}">
										<a href="/books/edit/${book.id}"><i class="fa fa-edit"></i></a>
										</c:if>
									</h4>
								</div>

							</div>
							<h6 class="theme-color lead">
								<c:out value="${book.author}" />

							</h6>
							<p>
								<strong>Genre </strong>
								<c:out value="${book.genre}" />
							</p>
							<div class="row about-list">
								<div class="col-md-6">
									<div class="media">
										<label>Year: </label> ${book.year}
									</div>
									<div class="media">
										<label>ISBN: </label> ${book.isbn}
									</div>
								</div>
								<div class="col-md-6">
									<div>
										<label>Description: </label> ${book.description}
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="col-lg-3">
						<div class="about-avatar">
						<a href="/get/image/byid/${book.image.id}" target="_blank">
							<img src="/get/image/byid/${book.image.id}" title=""
								alt="user profile picture">
						</a>
						</div>
					</div>

				</div>
				<div class="counter">
					<div class="row">
						<div class="col-6 col-lg-3">
							<div class="count-data text-center">
								<h6 class="count h2" data-to="500" data-speed="500">
									<c:out value="${book.likers.size()}"></c:out>
								</h6>
								<p class="m-0px font-w-600">Likes</p>
							</div>
						</div>
						<div class="col-6 col-lg-3">
							<div class="count-data text-center">
								<h6 class="count h2" data-to="150" data-speed="150">
									<c:out value="${book.reviews.size()}"></c:out>
								</h6>
								<p class="m-0px font-w-600">
									<a href="/books/${book.id}/reviews">Reviews</a>
								</p>
							</div>
						</div>
						<div class="col-6 col-lg-3">
							<div class="count-data text-center">
								<h6 class="count h2" data-to="850" data-speed="850">
									<c:out value="${book.wishList.size()}"></c:out>
								</h6>
								<p class="m-0px font-w-600">Wish List</p>
							</div>
						</div>
						<div class="col-6 col-lg-3">
							<div class="count-data text-center">
								<h6 class="count h2" data-to="190" data-speed="190">
									<c:out value="${book.ratings.size()}"></c:out>
								</h6>
								<p class="m-0px font-w-600">Rating</p>
							</div>
						</div>
					</div>
					<!-- 	<div class="row">
					<div class="count-data text-center"></div>
				</div> -->
				</div>

			</section>
			<hr>
		</c:forEach>
		<c:if test="${empty message}">
		<a href="#result" class="float-end">Go Top</a>
		</c:if>
		<c:if test="${not empty message}">
			<div class="alert alert-info alert-dismissible fade show center">
				<strong>Hey <c:out value="${user.firstName}" /> !
				</strong>
				<c:out value="${message}"></c:out>
				<br> <a href="/books/create" class="alert-link">Do you want
					to add book? </a>.
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>

		</c:if>
		<%-- <div class="col-lg-3">
		<c:forEach items="${book.ratings}" var="rating">
			<c:set var="count" value="${count + rating.rating}" scope="page" />
			<c:if test="${rating.ratedBy.id eq user.id}">
				<c:set var="ratedbyUser" value="true" />
				<c:set var="rated_val" value="${rating.rating}" />
				<c:set var="rated_id" value="${rating.id}" />
			</c:if>
		</c:forEach>
		
		<c:if test="${count>0}">
			<c:set var="rate_avg" value="${count / book.ratings.size()}" />
		</c:if>
		
		</div> --%>
	</div>
</t:navigation>
