<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- make sure to add tags -->
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
  <h3>
	Welcome,
	<c:out value="${user.firstName}"/>
	<c:out value="${user.lastName}"/>
	</h3>
	<a href="/dashboard">Dashboard</a> |
	<a href="/track">Track</a> |
	<a href="/wishlist">Wish List</a>
	<a href="/logout">Logout</a>
	<hr>
<jsp:doBody/>
</div>
</body>
</html>
