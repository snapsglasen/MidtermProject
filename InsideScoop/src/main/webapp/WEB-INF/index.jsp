<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<!-- Navbar -->
<c:choose>
	<c:when test="${not empty loginCheck }">
		<jsp:include page="navbar.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:include page="loggedOutNavbar.jsp"/>
	</c:otherwise>
</c:choose>
<div class="container-fluid">

	<!-- Posts -->
	<div class="row">
		<div class="col">
			<c:forEach var="post" items="${posts }">
				<c:if test="${post.active }">
				<div class="row d-flex justify-content-center">
						<div class="card body mb-3">
							<div class="d-flex align-items-center">
							<h5 class="card-title me-auto">${post.title }</h5>
							<img class="ms-auto" src="<c:out value="${post.user.profilePicture }"/>" width="30em" height="30em"/>
							<h6 class="card-subtitle ms-1 me-1 text-muted">${post.user.firstName } ${post.user.lastName }</h6>
							</div>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							<a href="#" class="card-link">Card Link</a>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>


<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>