
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- make sure to add tags -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta Http-Equiv="Cache-Control" Content="no-cache">
<meta Http-Equiv="Pragma" Content="no-cache">
<meta Http-Equiv="Expires" Content="0">
<meta Http-Equiv="Pragma-directive: no-cache">
<meta Http-Equiv="Cache-directive: no-cache">
<title>Books</title>

 <link
rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 -->     <link rel="stylesheet" type="text/css" href="/css/style.css">
<!--         <script type="text/javascript" src="/js/app.js"></script> -->
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">



</head>
<body>
<div class="container">

<nav class="navbar navbar-expand-xl navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/profile/${user.id}">MyBookee</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarBasic" aria-controls="navbarBasic" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse show" id="navbarBasic">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/dashboard">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link .text-decoration-underline" href="/wishlist">Wish List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/books/create">Add Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/books/completedbook">Completed Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/logout">Logout</a>
        </li>
      </ul>
      <form  action="/books/search" method="get" class="d-flex">
        <input class="form-control me-2" name="term" type="text" placeholder="search books ISBN, name, author etc"" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<!-- 
<form >
	<input name="term" type="text" placeholder="search books ISBN, name, author etc" >
	<button type="submit">Search</button>
	</form>
	 -->


 <%--  <h3>
	Welcome, <a href="/profile/${user.id}">
	<c:out value="${user.firstName}"/>
	<c:out value="${user.lastName}"/>
	</a>
	</h3>
	<a href="/dashboard">Dashboard</a> |
	<a href="/books/complete">Log Book Read</a> |
	<a href="/books/completedbook">Completed Book List</a> |
	<a href="/wishlist">Wish List</a>
	<a href="/books/create">Add Book</a> |
	<a href="/logout">Logout</a>
	</div> --%>
	
	
	
	<hr>
	<hr>

	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-sm-10">
				<h1><c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></h1>
			</div>
		</div>
		<%-- <form:form class="form" action="/user/edit/${user.id}" method="post"
			modelAttribute="user" enctype="multipart/form-data"> --%>
			<!-- <div class="row"> -->
				<div class="col-sm-3">
					<!--left col-->


					<div class="text-center">
						<img src="/get/image/byid/${user.image.id}"
							class="avatar img-circle img-thumbnail" alt="avatar">
						<!-- <h6>Upload a different photo...</h6> -->
						<!-- <input type="file" class="text-center center-block file-upload"
							name="mimage">
 -->
					</div>
					<br>


					<div class="panel panel-default">
						<div class="panel-heading">
							My Blog <i class="fa fa-link fa-1x"></i>
						</div>
						<div class="panel-body">
							<a href="*">myblog.com</a>
						</div>
					</div>


					<ul class="list-group">
					
						<li class="list-group-item">Activity <i
							class="fa fa-dashboard fa-1x"></i></li>
						<li class="list-group-item text-right"><span
							class="pull-left"><strong><a
									href="/books/completedbook">Completed Book</a></strong></span>
						<c:out value="${user.completedBooks.size()}"></c:out></li>
						<li class="list-group-item text-right"><span
							class="pull-left"><strong>Likes</strong></span> <c:out value="${user.likedBooks.size()}"></c:out></li>
						<li class="list-group-item text-right"><span
							class="pull-left"><strong>Reviews</strong></span> <c:out
								value="${user.reviews.size()}"></c:out></li>
						<li class="list-group-item text-right"><span
							class="pull-left"><strong><a href="/wishlist">
										Wish List</a></strong> </span> <c:out value="${user.wishedBooks.size()}"></c:out>
						</li>
					</ul>

				</div> 
				<!--/col-3-->
<jsp:doBody/>
<!-- </div>  --><!-- row -->
</div>
</div>
</body>
</html>
