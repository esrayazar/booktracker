<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>

	<div class="col-sm-9">
	<hr>
	<h2> <i class="fa-solid fa-book"></i> My Completed Book List </h2>
<hr>
		<c:forEach items="${user.completedBooks}" var="book">

			<div class="card" style="width: 40rem">
				<div class="card-header">
					<span> <a href="/books/${book.id}"><h3> ${book.title}</h3></a></span><span class="float-end"><strong>Genre:
					</strong>${book.genre}</span>
				</div>
				<div class="card-body">
					<div class="display:inline-block flex-wrap">
						<div class="container">
							<div class="row">

								<div class="card-group fd-flex  border" style="width: 35rem">
									<div class="col">
										<div class="profile-card-4 text-center">
											<img src="/get/image/byid/${book.image.id}"
												class="img img-responsive">
										</div>
									</div>
									<div class="col text-center">
										<div class="row">
											<div class="col">LIKES</div>
											<div class="col">REVIEW</div>
											<div class="col">RATING</div>
										</div>
										<div class="row">
											<div class="col">${book.likers.size()}</div>
											<div class="col">${book.reviews.size()}</div>
											<div class="col">${book.likers.size()}</div>

										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

				</div>
				<div class="card-footer">
				<span> By ${book.author}</span>
				<span class="float-end">
			
							<c:choose>
								<c:when test="${book.likers.contains(user)}">

									<a href="/books/${book.id}/unlike/bookprofile"><i
										class="fa-regular fa-thumbs-down fa-1x"></i></a>
								</c:when>
								<c:otherwise>
									<a href="/books/${book.id}/like/bookprofile"><i
										class="fa-regular fa-thumbs-up fa-1x"></i></a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${book.wishList.contains(user)}">
									<a href="/books/${book.id}/wish/remove/bookprofile"> <i
										class="fa-solid fa-heart fa-1x"></i></a>
								</c:when>
								<c:otherwise>
									<a href="/books/${book.id}/wish/add/bookprofile"> <i
										class="fa-regular fa-heart fa-1x"></i></a>
								</c:otherwise>
							</c:choose>
							<a href="/books/addreview?book_id=${book.id}"><i
								class="fa-solid fa-comments fa-1x"></i></a>
						
						</span>
					</div>
			</div>
<br>

		</c:forEach>
	</div>





















	<%-- 
<div class="col-sm-6">
<c:forEach items="${user.completedBooks}" var="book">
<a href="/books/${book.id}"><p> Title <c:out value="${book.title}"/></p></a>
<p> Author <c:out value="${book.author}"/></p>
<p> Year <c:out value="${book.year}"/></p>
<p> Genre <c:out value="${book.genre}"/></p>
<p> Description <c:out value="${book.description}"/></p>
<p> Book Photo <c:out value="${book.imgUrl}"/></p>
<p>${book.likers.size()} Likes</p> 
<c:choose>
			<c:when test="${book.likers.contains(user)}">
				<a href="/books/${book.id}/unlike/completedlist">Unlike </a>
			</c:when>
			<c:otherwise>
				<a href="/books/${book.id}/like/completedlist">Like </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${book.wishList.contains(user)}">
				<a href="/books/${book.id}/wish/remove/completedlist">Remove Wish List </a>
			</c:when>
		
		</c:choose>
<hr>
</c:forEach>


</div>  --%>
</t:navigation>






