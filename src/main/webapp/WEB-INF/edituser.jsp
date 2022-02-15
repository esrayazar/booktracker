<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:navigation>
	<hr>
	
	<div class="col-sm-6">
	<!-- 	<div class="row">
			<div class="col-sm-10">
				<h1>User name</h1>
			</div>
		</div>  -->

			<div class="row">
				
					<!--left col-->


					<div class="text-center">
						<%-- <img src="/get/image/byid/${user.image.id}"
							class="avatar img-circle img-thumbnail" alt="avatar"> --%>
						<h6>Upload a different photo...</h6>
				<input type="file" class="text-center center-block file-upload"
							name="mimage">

					</div> 
					<br>

				<!-- 	<div class="panel panel-default">
						<div class="panel-heading">
							Website <i class="fa fa-link fa-1x"></i>
						</div>
						<div class="panel-body">
							<a href="http://bootnipets.com">bootnipets.com</a>
						</div>
					</div> -->
<%-- 
	<ul class="list-group">
						<li class="list-group-item text-muted">Activity <i
							class="fa fa-dashboard fa-1x"></i></li>

						<li class="list-group-item text-right"><span
							class="pull-left"><strong><a
									href="/books/completedbook">Completed Book</a></strong></span>
						<c:out value="${user.completedBooks.size()}"></c:out></li>
						<li class="list-group-item text-right"><span
							class="pull-left"><strong>Likes</strong></span> 13</li>
						<li class="list-group-item text-right"><span
							class="pull-left"><strong>Reviews</strong></span> <c:out
								value="${user.reviews.size()}"></c:out></li>
						<li class="list-group-item text-right"><span
							class="pull-left"><strong><a href="/wishlist">
										Wish List</a></strong> </span> <c:out value="${user.wishedBooks.size()}"></c:out>
						</li>
					</ul> --%>

<!-- <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>  -->

			
				<!--/col-3-->
			
		
		<form:form class="form" action="/user/edit/${user.id}" method="post"
			modelAttribute="user" enctype="multipart/form-data"> 
				<div class="form-group">
					<div class="col-xs-6">
						<form:label path="firstName" class="form-label">
							<h4>First Name</h4>
						</form:label>
						<form:input class="form-control" type="text" path="firstName" />
						<form:errors path="firstName" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-6">
						<form:label path="lastName" class="form-label">
							<h4>Last Name</h4>
						</form:label>
						<form:input class="form-control" type="text" path="lastName" />
						<form:errors path="lastName" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-6">
						<form:label path="email" class="form-label">
							<h4>Email</h4>
						</form:label>
						<form:input class="form-control" type="email" path="email" />
						<form:errors path="email" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-6">
						<form:label path="lastName" class="form-label">
							<h4>Date Of Birth</h4>
						</form:label>
						<form:input class="form-control" type="date" path="dateOfBirth" />
						<form:errors path="dateOfBirth" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-6">
						<form:label path="city" class="form-label">
							<h4>City</h4>
						</form:label>
						<form:input class="form-control" type="text" path="city" />
						<form:errors path="city" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-6">
						<form:label path="state" class="form-label">
							<h4>State</h4>
						</form:label>
						<form:input class="form-control" type="text" path="state" />
						<form:errors path="state" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-6">
						<form:label path="country" class="form-label">
							<h4>Country</h4>
						</form:label>
						<form:input class="form-control" type="text" path="country" />
						<form:errors path="country" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-6">
						<form:label path="bio" class="form-label">
							<h4>Bio</h4>
						</form:label>
						<form:input class="form-control" type="text" path="bio" />
						<form:errors path="bio" />
					</div>
				</div>
				

				<div class="form-group">
					<div class="col-xs-12">
						<br>
						<button class="btn btn-lg btn-success pull-right" type="submit"
							class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Save
						</button>

					</div>
				</div>	</form:form>
			</div>
	
		<p class="text-center text-muted mt-5 mb-0">
			Have already an account? <a href="/login" class="fw-bold text-body"><u>Login
					here</u></a>
		</p>

	</div>
	<!--/tab-pane-->
</t:navigation>