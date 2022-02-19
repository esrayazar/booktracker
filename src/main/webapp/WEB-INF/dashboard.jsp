<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>

<t:navigation>

	<!-- 	 style="background-image: url('/img/bookback.jpeg');height: auto;" -->
	
	<div class="col-sm-6 " style="background-image: url('/img/photo.jpeg');height: auto;">
	
		<div class="card center" >
			<div class="card-body" >
			
				<div class="col-xs-6">
					<p>
						You have <a href="/wishlist"><c:out
								value="${user.wishedBooks.size()}"></c:out> books</a> in your wish
						list.
					</p>
				</div>


				<div class="col-xs-6">
					<p>
						You have read <a href="/books/completedbook"><c:out
								value="${user.completedBooks.size()}"></c:out> books</a> so far!
					</p>

				</div>

				<div class="col-xs-6">
					<p>
						You have provided
						<c:out value="${user.reviews.size()}"></c:out>
						reviews so far!
					</p>
				</div>
			</div>
		</div>
	</div>
	</div>

</t:navigation>