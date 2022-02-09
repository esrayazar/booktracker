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
<title>Ideas!!!</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
</head>
<body>
<section class="vh-100 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Sign In</h2>

              <form action="/login" method="post">
	<p>${loginError}</p>
                <div class="form-outline mb-4">
                  <input class="form-control form-control-lg" id="email" name="loginEmail"/>
                  <label  for="email" class="form-label">Email</label>
                </div>
               
                <div class="form-outline mb-4">
                  <input type="password"  class="form-control form-control-lg" id="password" name="loginPassword" />
                  <label for="password"  class="form-label" >Password</label>
              
                </div>
                <div class="d-flex justify-content-center">
                  <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Sign In</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Don't have an account? <a href="/register" class="fw-bold text-body"><u>Register</u></a></p>

              </form>
 
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


</body>
</html>