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
<!-- Modal -->
<jsp:include page="loginModal.jsp"/>

<!-- Navbar -->
<jsp:include page="universalNavbar.jsp"/>
<div class="container align-items-center">
	<div class="row"></div>
	
	<!-- Header -->
	<div class="row m-3">
		<div class="col"></div>
		<div class="col-8">
			<h1 class="display-3">Inside Scoop</h1>
		</div>
		<div class="col"></div>
	</div>
	<div class="row"></div>
<c:if test="${not empty loginCheck }">
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
</c:if>

</div>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>
