<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:navigation>
	<div class="col-sm-5" style="margin: 10%">

		<div class="card ">
			<div class="card-header">Did you finish book?</div>
			<div class="card-body">


				<form action="/books/complete" method="get">
					<input type="text" name="isbn"
						placeholder="Please type or enter ISBN">
					<button class="btn float-end btn-grad" type="submit">Complete
						Book Reading</button>

				</form>
			</div>
			<div class="card-footer text-muted">
				<c:if test="${not empty error}">
					<c:out value="${error}" />
					<a class="btn btn-grad" href="/books/create">Add
						This Book Manually</a>
				</c:if>
			</div>
		</div>
	</div>


</t:navigation>