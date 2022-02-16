
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- make sure to add tags -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta Http-Equiv="Cache-Control" Content="no-cache">
<meta Http-Equiv="Pragma" Content="no-cache">
<meta Http-Equiv="Expires" Content="0">
<meta Http-Equiv="Pragma-directive: no-cache">
<meta Http-Equiv="Cache-directive: no-cache">
<title>My Bookee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"
	integrity="sha512-yFjZbTYRCJodnuyGlsKamNE/LlEaEAxSUDe5+u61mV8zzqJVFOH7TnULE2/PP/l5vKWpUNnF4VGVkXh3MjgLsg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body>
	<div>
		<nav class="navbar navbar-expand-xl navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="/profile/${user.id}">MyBookee</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarBasic"
					aria-controls="navbarBasic" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse show" id="navbarBasic">
					<ul class="navbar-nav me-auto mb-2 mb-xl-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/dashboard">Home</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="/books/complete">Log it</a></li>
						<li class="nav-item"><a
							class="nav-link .text-decoration-underline" href="/wishlist">Wish
								List</a></li>
						<li class="nav-item"><a class="nav-link "
							href="/books/create">Add Book</a></li>
						<li class="nav-item"><a class="nav-link "
							href="/books/completedbook">Completed Book</a></li>
						<li class="nav-item"><a class="nav-link " href="/logout">Logout</a>
						</li>
					</ul>
					<form action="/books/search" method="get" class="d-flex">
						<input class="form-control me-2" name="term" type="text"
							placeholder="search books ISBN, name, author etc"
							aria-label="Search">
						<button class="btn btn-outline-secondary" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
	</div>
	<form:form class="form" action="/user/edit/${user.id}" method="post"
		modelAttribute="user" enctype="multipart/form-data">
		<div class="container">
			<div class="row">
				<hr>
				<div class="col-sm-3">
					<!--left col-->
					<div class="row">
						<div class="col">
							<h3>
								<c:out value="${user.firstName}" />
								<c:out value="${user.lastName}" />
							</h3>
							<hr>
						</div>

					</div>
					<div class="row">
						<div class="col">
							<div class="text-center">
								<img src="/get/image/byid/${user.image.id}"
									class="avatar img-circle img-thumbnail" alt="avatar"> <input
									type="file" class="text-center center-block file-upload"
									name="imgfile" />
							</div>

							<div class="card" style="width: 14rem;">
								<div class="card-header">
									My Blog <i class="fa fa-link fa-1x"></i>
								</div>
								<div class="card-body">
									<a href="*">myblog.com</a>
								</div>
							</div>

							<div class="card" style="width: 14rem;">
								<div class="card-header">
									Activity <i class="fa fa-dashboard fa-1x"></i>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item text-right"><span
										class="pull-left"><strong><a
												href="/books/completedbook">Completed Book</a></strong></span> <c:out
											value="${user.completedBooks.size()}"></c:out></li>
									<li class="list-group-item text-right"><span
										class="pull-left"><strong>Likes</strong></span> <c:out
											value="${user.likedBooks.size()}"></c:out></li>
									<li class="list-group-item text-right"><span
										class="pull-left"><strong>Reviews</strong></span> <c:out
											value="${user.reviews.size()}"></c:out></li>
									<li class="list-group-item text-right"><span
										class="pull-left"><strong><a href="/wishlist">
													Wish List</a></strong> </span> <c:out value="${user.wishedBooks.size()}"></c:out></li>
								</ul>
							</div>
							<!-- card -->
						</div>
						<!--/col-3-->
					</div>
					<!-- row -->
				</div>
				<!--left col-->
				<jsp:doBody />
			</div>
		</div>
		<!-- container -->
	</form:form>
</body>
</html>
