<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:unavigation>

	<div class="col-sm-6">
		<div class="card">
			<div class="card-header">
				<h3 class="float-end">User Edit</h3> 
			</div>
			<div class="card-body">
				<div class="form-group">
					<form:label path="firstName" class="form-label">
						<h4>First Name</h4>
					</form:label>
					<form:input class="form-control" type="text" path="firstName" />
					<form:errors path="firstName" />
				</div>

				<div class="form-group">
					<form:label path="lastName" class="form-label">
						<h4>Last Name</h4>
					</form:label>
					<form:input class="form-control" type="text" path="lastName" />
					<form:errors path="lastName" />
				</div>

				<div class="form-group">
					<form:label path="email" class="form-label">
						<h4>Email</h4>
					</form:label>
					<form:input class="form-control" type="email" path="email" />
					<form:errors path="email" />
				</div>

				<div class="form-group">
					<form:label path="lastName" class="form-label">
						<h4>Date Of Birth</h4>
					</form:label>
					<form:input class="form-control" type="date" path="dateOfBirth" />
					<form:errors path="dateOfBirth" />
				</div>

				<div class="form-group">
					<form:label path="city" class="form-label">
						<h4>City</h4>
					</form:label>
					<form:input class="form-control" type="text" path="city" />
					<form:errors path="city" />
				</div>

				<div class="form-group">
					<form:label path="state" class="form-label">
						<h4>State</h4>
					</form:label>
					<form:input class="form-control" type="text" path="state" />
					<form:errors path="state" />
				</div>
				<div class="form-group">
					<form:label path="country" class="form-label">
						<h4>Country</h4>
					</form:label>
					<form:input class="form-control" type="text" path="country" />
					<form:errors path="country" />
				</div>

				<div class="form-group">
					<form:label path="bio" class="form-label">
						<h4>Bio</h4>
					</form:label>
					<form:input class="form-control" type="text" path="bio" />
					<form:errors path="bio" />
				</div>

				<div class="form-group">

					<br>
					<button class="btn btn-lg btn-outline-secondary float-end"
						type="submit">Save</button>


				</div>

			</div>
		</div>

		<p class="text-center text-muted mt-5 mb-0">
			Have already an account? <a href="/login" class="fw-bold text-body">
			<span style="text-decoration:underline;">Login here</span></a>
		</p>

	</div>
	<!--/tab-pane-->
</t:unavigation>