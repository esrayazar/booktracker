<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    <%@ page isErrorPage="true"%>
    <%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
</head>
<body>
<section class="vh-100 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100 ">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>

              <form:form action="/register" method="post" modelAttribute="user">

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
                  <form:input type="password"  class="form-control form-control-lg" path="password" />
                  <form:label path="password"  class="form-label" >Password</form:label>
                  <form:errors path="password"/>
                </div>

                <div class="form-outline mb-4">
                  <form:input type="password" class="form-control form-control-lg" path="confirmPassword" />
                  <form:label class="form-label" path="confirmPassword" >Repeat your password</form:label>
                  <form:errors path="confirmPassword"/>
                </div>

                <div class="d-flex justify-content-center">
                  <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="/login" class="fw-bold text-body"><u>Login here</u></a></p>

              </form:form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


</body>
</html>