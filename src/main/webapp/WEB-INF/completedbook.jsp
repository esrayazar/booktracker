<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:navigation>
	<div class="col">
		<div class="card center">
			<div class="card-header">Did you finished book?</div>
			<div class="card-body">
				<form action="/books/complete" method="get">
					<input type="text" name="isbn">
					<button class="btn btn-outline-secondary" type="submit">Complete
						Book Reading</button>
				</form>
			</div>
			<div class="card-footer text-muted">
							<c:if test="${not empty error}">
					<c:out value="${error}" />
					<a class="btn btn-outline-secondary" href="/books/create">Add This Book
						Manually</a>
				</c:if>
			</div>
		</div>
	</div>


</t:navigation>