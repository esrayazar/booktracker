<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:navigation>

	<div class="col">
		<div class="card">
			<div class="card-header">
				<h3>Edit Book: ${editBook.title}</h3>
			</div>
			<div class="card-body">
				<form:form action="/books/update/${editBook.id}" method="post"
					modelAttribute="editBook" enctype="multipart/form-data">
					<div class="row">
						<div class="col-sm-3">
							<img src="/get/image/byid/${editBook.image.id}"
								class="avatar img-circle img-thumbnail"
								alt="book profile picture"> <input type="file"
								name="imgfile" />
						</div>
						<div class="col">
							<input type="hidden" name="id" value="${editBook.id}">
							<div class="form-group">
								<form:label path="title">Title</form:label>
								<form:errors class="text-danger" path="title" />
								<form:input class="form-control" path="title" />
							</div>
							<div class="form-group">
								<form:label path="author">Author</form:label>
								<form:errors class="text-danger" path="author" />
								<form:input class="form-control" path="author" />
							</div>
							<div class="form-group">
								<form:label path="year">Year</form:label>
								<form:errors class="text-danger" path="year" />
								<form:input type="number" class="form-control" path="year" />
							</div>
							<div class="form-group">
								<form:label path="genre">Genre</form:label>
								<form:errors class="text-danger" path="genre" />
								<form:input class="form-control" path="genre" />
							</div>
							<div class="form-group">
								<form:label path="description">Description</form:label>
								<form:errors class="text-danger" path="description" />
								<form:input class="form-control" path="description" />
							</div>
							<div class="form-group">
								<form:label path="isbn">ISBN</form:label>
								<form:errors class="text-danger" path="isbn" />
								<form:input class="form-control" path="isbn" />
							</div>
							<button type="submit" class="btn btn-outline-secondary">Update</button>
							<a class="btn btn-outline-secondary" href="/books/${editBook.id}/delete">Delete</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>


	</div>


</t:navigation>