<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>


	<div class="col-lg-7">
	<hr>
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
								<h3 class="dark-color">
									<c:out value="${book.title}" />
									<a href="/books/edit/${book.id}"><i class="fa fa-edit"></i></a>
								</h3>
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

	</div>

	<!--  like-review-favorites -->

	<%-- <div class="col-lg-2 d-flex align-items-center ">
		<div class="card" style="width: 14rem;">

			<div class="card-body">

				<c:choose>
					<c:when test="${book.likers.contains(user)}">

						<a href="/books/${book.id}/unlike/bookprofile"><i
							class="fa-regular fa-thumbs-down"></i> </a>
					</c:when>
					<c:otherwise>
						<a href="/books/${book.id}/like/bookprofile"><i
							class="fa-regular fa-thumbs-up"></i> </a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="card-body">
			<c:choose>
			<c:when test="${book.wishList.contains(user)}">
				<a href="/books/${book.id}/wish/remove/bookprofile">
			<i class="fa-solid fa-heart"></i></a>
			</c:when>
			<c:otherwise>
						<a href="/books/${book.id}/wish/add/bookprofile">
							<i class="fa-regular fa-heart"></i></a>
					</c:otherwise>
			</c:choose>
			
			</div>
			<div class="card-body">
				<a href="/books/addreview?book_id=${book.id}"><i class="fa-solid fa-comments"></i></a>
			</div>
		</div>

	</div>
 --%>

	<%-- 

/*last


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
		
		
	*/ last--%>

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
