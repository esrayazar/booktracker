<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>

	<div class="col-sm-9">
<hr>
		<section class="section about-section gray-sm" id="about">

			<div class="row align-items-center flex-row-reverse">
			<hr>
				<div class="col-sm-6">
				
					<div class="about-text go-to">
						<h3 class="dark-color">
							About Me <a href="/user/edit/${user.id}"><i
								class="fa fa-edit"></i></a>
						</h3>
						<h6 class="theme-color lead">
							<c:out value="${user.firstName}" />
							<c:out value="${user.lastName}" />
						</h6>
						<p>
							<strong>Bio: </strong> <c:out value="${user.bio}" />
						</p>
						<div class="row about-list">
							<div class="col-md-6">
								<div class="media">
									<label>Birthday: </label> ${user.dateOfBirth}
								</div>
								<div class="media">
									<label>Email: </label> ${user.email}
								</div>
							</div>
							<div class="col-md-6">
								<div class="media">
									<label>City: </label> ${user.city}
								</div>
								<div class="media">
									<label>State: </label> ${user.state}
								</div>

								<div class="media">
									<label>Country: </label> ${user.country}
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
				
					<div class="about-avatar">
						<img src="/get/image/byid/${user.image.id}" title="" alt="user profile picture">
					</div>
				</div>
			</div>
			<div class="counter">
				<div class="row">
					<div class="col-6 col-lg-3">
						<div class="count-data text-center">
							<h6 class="count h2" data-to="500" data-speed="500">
								<c:out value="${user.likedBooks.size()}"></c:out>
							</h6>
							<p class="m-0px font-w-600">Likes</p>
						</div>
					</div>
					<div class="col-6 col-lg-3">
						<div class="count-data text-center">
							<h6 class="count h2" data-to="150" data-speed="150">
								<c:out value="${user.reviews.size()}"></c:out>
							</h6>
							<p class="m-0px font-w-600">Reviews</p>
						</div>
					</div>
					<div class="col-6 col-lg-3">
						<div class="count-data text-center">
							<h6 class="count h2" data-to="850" data-speed="850">
								<c:out value="${user.wishedBooks.size()}"></c:out>
							</h6>
							<p class="m-0px font-w-600">Wish List</p>
						</div>
					</div>
					<div class="col-6 col-lg-3">
						<div class="count-data text-center">
							<h6 class="count h2" data-to="190" data-speed="190">
								<c:out value="${user.completedBooks.size()}"></c:out>
							</h6>
							<p class="m-0px font-w-600">Completed Book</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="count-data text-center"></div>
				</div>
			</div>

		</section>

	</div>
</t:navigation>





