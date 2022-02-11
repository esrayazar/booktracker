<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>
	<body>
		<div class="container">
			<div class="d-flex flex-row">
				<div class="p-2">
					Title
					<c:out value="${book.title}" />
				</div>
				<div class="p-2">
					Year
					<c:out value="${book.year}" />
				</div>
				<div class="p-2">
					Genre
					<c:out value="${book.genre}" />
				</div>
			</div>
			<div class="d-flex flex-row">
				<div class="p-2">
					Author
					<c:out value="${book.author}" />
				</div>
				<div class="d-flex flex-row">
					Description
					<c:out value="${book.description}" />
				</div>
				<div class="d-flex flex-row">${book.likers.size()} Likes</div>
			</div>
		</div>

		<c:choose>
			<c:when test="${book.likers.contains(user)}">
				<a href="/books/${book.id}/unlike/bookprofile">Unlike </a>
			</c:when>
			<c:otherwise>
				<a href="/books/${book.id}/like/bookprofile">Like </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${book.wishList.contains(user)}">
				<a href="/books/${book.id}/wish/remove/bookprofile">Remove Wish List </a>
			</c:when>
			<c:otherwise>
				<a href="/books/${book.id}/wish/add/bookprofile">Add Wish List </a>
			</c:otherwise>
		</c:choose>
		
		




		<%-- <div class="row">
<a href="/books/${book.id}"> Title <c:out value="${book.title}"/></a>
<p> Author <c:out value="${book.author}"/></p>
<p> Year <c:out value="${book.year}"/></p>
<p> Genre <c:out value="${book.genre}"/></p>
<p> Description <c:out value="${book.description}"/></p>
<p> Book Photo <c:out value="${book.imgUrl}"/></p>
</div> --%>
</t:navigation>
</body>
