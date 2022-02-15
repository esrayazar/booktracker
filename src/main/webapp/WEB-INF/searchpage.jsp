<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>

 <div class="col-sm-6 style=float: left">
 <c:forEach items="${books}" var="book">
 <div class="col-sm-6 ">
	<div class="row">
	<div class="card-group  style=float: left border">


		
	
			<p>
				<a href="/books/${book.id}"> Title <c:out value="${book.title}" />
				</a>
			</p>
			<p>
				<img src="/get/image/byid/${book.image.id}" class="img-fluid d-block mx-auto rounded-circle img-thumbnail mb-4">
			</p>
			
			<p>
				Author
				<c:out value="${book.author}" />
			</p>
			<p>
				Year
				<c:out value="${book.year}" />
			</p>
			<p>
				Genre
				<c:out value="${book.genre}" />
			</p>
			<p>
				Description
				<c:out value="${book.description}" />
			</p>
			
			<p>${book.likers.size()} Likes</p>
			<hr>
			
			<a href="/books/edit/${book.id}">Edit Book Profile</a>
			
			<c:if test="${not empty message}">
			<c:out value="${message}"></c:out>
		</c:if>
		</div>
		</div>
		</div>
		</c:forEach>
		
	</div>
	

</t:navigation>
