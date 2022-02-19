<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>
	<div class="col-md-6">
	<hr>
		<c:forEach items="${books}" var="book">
		
		
					<section class="section about-section gray-md" id="about">

			<div class="row align-items-center flex-row-reverse">
			
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
									<c:out value="${book.title}" />
									<a href="/books/edit/${book.id}"><i class="fa fa-edit"></i></a>
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
						<img src="/get/image/byid/${book.image.id}" title=""
							alt="user profile picture">
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
	</div>


</t:navigation>
