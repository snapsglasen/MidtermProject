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
<jsp:include page="universalNavbar.jsp"/>
<div class="container">
	<div class="row-1"></div>
	<!-- Header -->
	<div class="row m-3">
		<div class="col"></div>
		<div class="col-8">
			<div class="row text-center">
				<h1 class="display-3">Get the Inside Scoop</h1>
			</div>
		</div>
		<div class="col"></div>
	</div>
	<div class="row-1"></div>
	<!-- Search -->
	<div class="row m-3">
		<form class="form-inline" action="searchPosts.do">
			<div class="form-group row">
				<div class="col"></div>
				<div class="col-7">
					<input type="text" class="form-control" name="search" id="postSearch" placeholder="Search posts"/>
				</div>
				<div class="col-1">
				<div class="row">
						<input class="btn btn-secondary btn-search" type="submit" value="Search">
						</div>
				</div>
				<div class="col"></div>
			</div>
		</form>
	</div>
	<div class="row-1"></div>
	<!-- Most Popular Posts -->
	<div class="row m-3">
		<div class="col"></div>
		<div class="col-6">
			<jsp:include page="carousel.jsp"/>
		</div>
		<div class="col"></div>
	</div>
<!-- 
	<!-- Sort --
	<div class="row m-3">
		<div class="col"></div>
			<div class="col-2"></div>
			<div class="col-6">
				<div class="row">
					<a class="col m-1 btn btn-secondary btn-sm me-auto" href="postByTitle.do">Sort by Title</a>
					<a class="col m-1 btn btn-secondary btn-sm me-auto" href="postByOldest.do">Sort by Oldest</a>
					<a class="col m-1 btn btn-secondary btn-sm me-auto" href="home.do">Sort by Most Recent</a>
				</div>
			</div>
		<div class="col"></div>
	</div>

	<!-- Posts --
	<div class="row m-3">
		<div class="col">
			<c:forEach var="post" items="${posts }">
				<c:if test="${post.active }">
					<div class="row d-flex justify-content-center">
							<div class="card body mb-3">
								<div class="d-flex align-items-center">
									<h5 class="card-title me-auto">
										<a href="profile.do?id=<c:out value="${p.user.id }"/>">
											${post.title }
										</a>
									</h5>
									<img class="ms-auto" src="<c:out value="${post.user.profilePicture }"/>" width="30em" height="30em"/>
									<h6 class="card-subtitle ms-1 me-1 text-muted">${post.user.firstName } ${post.user.lastName }</h6>
								</div>
								<p class="card-text text-truncate">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

</div>
--></div>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>
