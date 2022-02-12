<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<body>
	<t:navigation>
		<h3></h3>
		<p>
			You have <a href="/wishlist"><c:out
					value="${user.wishedBooks.size()}"></c:out> books</a> in your wish
			list.
		</p>
		<p>
			You have read <a href="/books/completedbook"><c:out
					value="${user.completedBooks.size()}"></c:out> books</a> so far!
		</p>
		<p>
			You have provided
			<c:out value="${user.reviews.size()}"></c:out>
			reviews so far!
		</p>
	</t:navigation>
</body>