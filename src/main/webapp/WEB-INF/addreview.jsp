<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>
	<body>
	<div class="container">
		<%--  <div class="row">
				<div class="d-sm-table-cell p-2 bd-highlight">
					Title
					<c:out value="${book.title}" />
				</div>
				<div class="d-sm-table-cell p-2 bd-highlight">
					Year
					<c:out value="${book.year}" />
				</div>
				<div class="d-sm-inline-block p-2 bd-highlight">
					Genre
					<c:out value="${book.genre}" />
				</div>
			</div> --%>
			
			<div class="row">
    <div class="col-sm-4" style="background-color:lavender;">	Title
					<c:out value="${book.title}" /></div>
    <div class="col-sm-4" style="background-color:lavenderblush;">	Year
					<c:out value="${book.year}" /></div>
    <div class="col-sm-4" style="background-color:lavender;">		Genre
					<c:out value="${book.genre}" /></div>
  </div>
			
			<div class="d-flex flex-row">
				<div class="d-sm-inline-block p-2 bd-highlight">
					Author
					<c:out value="${book.author}" />
				</div>
				<div class="d-flex flex-row">
				<div class="d-sm-inline-block p-2 bd-highlight">
					ISBN
					<c:out value="${book.isbn}" />
				</div>
				<div class="d-sm-inline-block p-2 bd-highlight">
					Description
					<c:out value="${book.description}" />
					</div>
				</div>
				<div class="d-sm-inline-block p-2 bd-highlight">${book.likers.size()} Likes</div>
			</div>
		</div>
	
	<c:if test="${not reviewedbyUser eq true}">
<form:form action="/books/submitreview" method="post" modelAttribute="newReview">
      <div class="form-group">
	        <form:label path="review">Review</form:label>
	        <form:errors class="text-danger" path="review"/>
	        <form:input class="form-control" path="review"/>
	    </div>
	    <form:input type="hidden" value="${newReview.id}" path="id"/>
	      <!-- Hidden Input for userId -->
	     <form:input type="hidden" value="${user.id}" path="reviewedBy"/>
	       <!-- Hidden Input for BookId -->
	     <form:input type="hidden" value="${book.id}" path="reviewedBook"/>
	     <button>Review it!!</button>
</form:form>
</c:if>
	
	
	

</body>
</t:navigation>