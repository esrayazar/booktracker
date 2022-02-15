<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>



	<%-- <div class="container">

		<p>
			First Name:
			<c:out value="${user.firstName}" />
		</p>
		<p>
			Last Name:
			<c:out value="${user.lastName}" />
		</p>
		<p>
			DOB
			<c:out value="${user.dateOfBirth}" />
		</p>
		<p>
			Location
			<c:out value="${user.city}" />
			,
			<c:out value="${user.state}" />
			,
			<c:out value="${user.country}" />
		</p>
		<p>
			Bio
			<c:out value="${user.bio}" />
		</p>
		<a href="/user/edit/${user.id}">Edit</a>
	</div>
 --%>
<div class="col-sm-9">

	<section class="section about-section gray-bg" id="about">
	
			<div class="row align-items-center flex-row-reverse">
				<div class="col-sm-6">
					<div class="about-text go-to">
						<h3 class="dark-color">About Me</h3>
						<h6 class="theme-color lead"><c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></h6>
						<p>
							<c:out value="${user.bio}" />
						</p>
						<div class="row about-list">
							<div class="col-md-6">
								<div class="media">
									<label>Birthday</label>
									<p><c:out value="${user.dateOfBirth}" /></p>
								</div>
								<div class="media">
									<label>Email</label>
									<p><c:out value="${user.email}" /></p>
								</div>
								<div class="media">
									
								</div>
								<div class="media">
									
								</div>
								<div class="media">
									
								</div>
								
								
							</div>
							<div class="col-md-6">
								<div class="media">
									<label>City</label>
									<p><c:out value="${user.city}" /></p>
								</div>
								<div class="media">
									<label>State</label>
									<p><c:out value="${user.state}" /></p>
								</div>
								<div class="col-md-6">
								<div class="media">
									<label>Country</label>
									<p><c:out value="${user.country}" /></p>
									
									<a href="/user/edit/${user.id}">Edit</a>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="about-avatar">
						<img src="/get/image/byid/${user.image.id}"
							title="" alt="">
					</div>
				</div>
			</div>
			<div class="counter">
				<div class="row">
					<div class="col-6 col-lg-3">
						<div class="count-data text-center">
							<h6 class="count h2" data-to="500" data-speed="500"><c:out value="${user.likedBooks.size()}"></c:out></h6>
							<p class="m-0px font-w-600">Likes</p>
						</div>
					</div>
					<div class="col-6 col-lg-3">
						<div class="count-data text-center">
							<h6 class="count h2" data-to="150" data-speed="150"><c:out
								value="${user.reviews.size()}"></c:out></h6>
							<p class="m-0px font-w-600">Reviews</p>
						</div>
					</div>
					<div class="col-6 col-lg-3">
						<div class="count-data text-center">
							<h6 class="count h2" data-to="850" data-speed="850"><c:out value="${user.wishedBooks.size()}"></c:out></h6>
							<p class="m-0px font-w-600">Wish List</p>
						</div>
					</div>
					<div class="col-6 col-lg-3">
						<div class="count-data text-center">
							<h6 class="count h2" data-to="190" data-speed="190"><c:out value="${user.wishedBooks.size()}"></c:out></h6>
							<p class="m-0px font-w-600">Completed Book</p>
						</div>
					</div>
				</div>
				<div class="row">
				<div class="count-data text-center">
				<a href="/user/edit/${user.id}">Edit</a>
				</div>
				</div>
			</div>
	
	</section>

</div>
</t:navigation>





