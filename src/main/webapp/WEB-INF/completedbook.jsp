<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:navigation>
<form action="/books/complete" method="get" >
<input type="text" name="isbn">
<button type="submit">Complete Book Reading</button>
</form>
<c:if test="${not empty error}">
<c:out value="${error}"/>
<a href ="/books/create">Add This Book Manually</a>
</c:if>

</t:navigation>