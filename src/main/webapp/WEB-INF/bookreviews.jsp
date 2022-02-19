<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>



<t:navigation>
	<script>
		AOS.init();
	</script>
	
	<div class="col-lg-7">
	<hr>
		<div class="container d-flex justify-content-center mt-5 mb-5">
			<div class="d-flex flex-column">
				<c:forEach items="${book.reviews}" var="review">

					<div class="card p-2 mb-2" data-aos="flip-right"
						style="background-color: #fff">
						<div class="card-body">
							<p>${review.review.trim()}</p>							
							
						</div>
						<div class="card-footer">
							By ${review.reviewedBy.firstName} ${review.reviewedBy.lastName}
							<c:if test="${review.reviewedBy.id eq user.id}">
						(<a href="/books/addreview?book_id=${book.id}">Edit</a>)
				(<a href="/books/${book.id}/review/${review.id}/delete/bookprofile">Delete</a>)
			</c:if>
						</div>


					</div>
<hr>
				</c:forEach>
			</div>
		</div>

		<!--  <div class="card p-2 mb-2" data-aos="fade-bottom">
            <h5>Internet are about things</h5>
            <p>Aliquam ultrices sagittis orci a scelerisque purus semper. Suspendisse in est ante in. Tortor pretium viverra suspendisse potenti nullam ac. Gravida quis blandit turpis cursus in. Nunc sed id semper risus in hendrerit gravida.</p>
            <div class="width-button align-items-center"> <button class="btn btn-sm btn-danger g-2"> Browse </button> <button class="btn btn-sm btn-success"> View </button> </div>
        </div>
        <div class="card p-2 mb-2" data-aos="fade-bottom">
            <h5>Google is designing for web vitals</h5>
            <p>Aliquam ultrices sagittis orci a scelerisque purus semper. Suspendisse in est ante in. Tortor pretium viverra suspendisse potenti nullam ac. Gravida quis blandit turpis cursus in. Nunc sed id semper risus in hendrerit gravida.</p>
            <div class="width-button align-items-center"> <button class="btn btn-sm btn-danger g-2"> Browse </button> <button class="btn btn-sm btn-success"> View </button> </div>
        </div>
        <div class="card p-2 mb-2" data-aos="fade-top">
            <h5>Apple is launching electric car</h5>
            <p>Nibh tortor id aliquet lectus proin nibh nisl. Diam maecenas sed enim ut sem viverra aliquet eget. Ullamcorper dignissim cras tincidunt lobortis feugiat vivamus. Nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque. Eget nunc scelerisque viverra mauris.</p>
            <div class="width-button align-items-center"> <button class="btn btn-sm btn-danger g-2"> Browse </button> <button class="btn btn-sm btn-success"> View </button> </div>
        </div>
        </div>
 -->




		<%-- <c:forEach items="${book.reviews}" var="review">
			<div>
				<c:out value="${review.review }"></c:out>
			</div>
			<c:if test="${review.reviewedBy.id eq user.id}">
				<c:set var="rewivedbyUser" value="true" /> (<a href="/books/addreview?book_id=${book.id}">Edit</a>)
				(<a href="/books/${book.id}/review/${review.id}/delete/bookprofile">Delete</a>)
			</c:if>
			
		</c:forEach>  --%>
	</div>
</t:navigation>



