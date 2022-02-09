<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    <%@ page isErrorPage="true"%>
    <%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ideas!!!</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
<div class="row">
<div class="col">
<h3>Register</h3>
	<form:form action="/register" method="post" modelAttribute="user">
	<div class="form-group">
		<form:label path="firstName"><strong>First Name:</strong></form:label>
		<br/>
		<form:errors path="firstName"/>
		<form:input class="form-control" path="firstName"/>
	</div>
	<div class="form-group">
		<form:label path="lastName"><strong>Last Name:</strong></form:label>
		<br/>
		<form:errors path="lastName"/>
		<form:input class="form-control" path="lastName"/>
	</div>
	<div class="form-group">
		<form:label path="email"><strong>Email:</strong></form:label>
		<br/>
		<form:errors path="email"/>
		<form:input type="email" class="form-control" path="email"/>
	</div>
	<div class="form-group">
		<form:label path="password"><strong>Password:</strong></form:label>
		<br/>
		<form:errors path="password"/>
		<form:input type="password" class="form-control" path="password"/>
	</div>
	<div class="form-group">
		<form:label path="confirmPassword"><strong>Confirm Password:</strong></form:label>
		<br/>
		<form:errors path="confirmPassword"/>
		<form:input type="password" class="form-control" path="confirmPassword"/>
	</div>
	<button type="submit" class="btn btn-secondary">Register</button>
	</form:form>
</div>
<div class="col">
<h3>Login</h3>
<p>${loginError}</p>
<form method="post" action="/login" >
	<div class="form-group">
		<label>Email</label>
		<input class="form-control" type="email" name="loginEmail" autocomplete="off"/>
	</div>
	<div class="form-group">
	<label>Password</label>
		<input class="form-control" type="password" name="loginPassword"/>
	</div>
	<button type="submit" class="btn btn-secondary">Login</button>
	</form>
</div>
</div>
</div>


</body>
</html>