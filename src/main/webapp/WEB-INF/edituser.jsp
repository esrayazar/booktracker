<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:navigation>
		<h1>Edit Your Profile </h1>
		<form:form action="/user/edit/${user.id}" method="post" modelAttribute="user">

                <div class="form-outline mb-4">
                  <form:input class="form-control form-control-lg" path="firstName"/>
                  <form:label  path="firstName" class="form-label">First Name</form:label>
                  <form:errors path="firstName"/>
                </div>
                <div class="form-outline mb-4">
                  <form:input class="form-control form-control-lg" path="lastName"/>
                  <form:label  path="lastName" class="form-label" >Last Name</form:label>
                  <form:errors path="lastName"/>
                </div>

                <div class="form-outline mb-4">
                  <form:input type="email" class="form-control form-control-lg" path="email" />
                  <form:label path="email"  class="form-label">Email</form:label>
                  <form:errors path="email"/>
                </div>

                <div class="form-outline mb-4">
                  <form:input type="dateOfBirth"  class="form-control form-control-lg" path="dateOfBirth" />
                  <form:label path="dateOfBirth"  class="form-label" >DOB</form:label>
                  <form:errors path="dateOfBirth"/>
                </div>

                <div class="form-outline mb-4">
                  <form:input type="city" class="form-control form-control-lg" path="city" />
                  <form:label class="form-label" path="city" >City</form:label>
                  <form:errors path="city"/>
                </div>
                   <div class="form-outline mb-4">
                  <form:input type="state" class="form-control form-control-lg" path="state" />
                  <form:label class="form-label" path="state" >State</form:label>
                  <form:errors path="state"/>
                </div>
                   <div class="form-outline mb-4">
                  <form:input type="country" class="form-control form-control-lg" path="country" />
                  <form:label class="form-label" path="city" >Country</form:label>
                  <form:errors path="country"/>
                </div>
                   <div class="form-outline mb-4">
                  <form:input type="bio" class="form-control form-control-lg" path="bio" />
                  <form:label class="form-label" path="city" >Bio</form:label>
                  <form:errors path="bio"/>
                </div>

                <div class="d-flex justify-content-center">
                  <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Save</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="/login" class="fw-bold text-body"><u>Login here</u></a></p>

              </form:form>

</t:navigation>

<body>

</body>
</html>