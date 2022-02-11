<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    <%@ page isErrorPage="true"%>
    <%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:navigation>
<body>
<div class="container">

<p> First Name: <c:out value="${user.firstName}"/></p>
<p> Last Name: <c:out value="${user.lastName}"/></p>
<p> DOB <c:out value="${user.dateOfBirth}"/></p>
<p> Location <c:out value="${user.city}"/>, <c:out value="${user.state}"/>,<c:out value="${user.country}"/></p>
<p> Bio <c:out value="${user.bio}"/></p>
</div>
<a href="/user/edit/${user.id}" >Edit</a>
</t:navigation>
</body>
