<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    <%@ page isErrorPage="true"%>
    <%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>
<div class="col-sm-6">
<c:forEach items="${user.completedBooks}" var="book">
<a href="/books/${book.id}"><p> Title <c:out value="${book.title}"/></p></a>
<p> Author <c:out value="${book.author}"/></p>
<p> Year <c:out value="${book.year}"/></p>
<p> Genre <c:out value="${book.genre}"/></p>
<p> Description <c:out value="${book.description}"/></p>
<p> Book Photo <c:out value="${book.imgUrl}"/></p>
<p>${book.likers.size()} Likes</p> 
<c:choose>
			<c:when test="${book.likers.contains(user)}">
				<a href="/books/${book.id}/unlike/completedlist">Unlike </a>
			</c:when>
			<c:otherwise>
				<a href="/books/${book.id}/like/completedlist">Like </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${book.wishList.contains(user)}">
				<a href="/books/${book.id}/wish/remove/completedlist">Remove Wish List </a>
			</c:when>
		
		</c:choose>
<hr>
</c:forEach>


</div>
</t:navigation>
