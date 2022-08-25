<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<jsp:include page="universalNavbar.jsp"/>
<div class="container-fluid">
	<div class="row"></div>
	
	<!-- Header -->
	<div class="row row-header">
		<div class="div-header">
			<div class="row text-center">
			<h1 class="display-3">Questions</h1>
			</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
	</div>
<c:if test="${not empty loginCheck }">

<!-- Search -->
<div class="row m-3">
	<form class="form-inlin" action="searchQuestions.do">
	<div class="form-group row">
				<div class="col"></div>
				<div class="col-7">
				
		<input type="text" class="form-control" name="search" id="postSearch"
			placeholder="Search Questions..." /> 
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
	
	<!-- random/create buttons -->
	<div class="row m-3">
	
	<article>
<a class="btn btn-secondary btn-sm" href="randomQuestion.do">Random Question</a>
<a class="btn btn-secondary btn-sm" href="createQuestionPage.do">Create question</a>
</article>
	</div>
	<!--Questions-->
	<div class="row m-3">
		<div class="col"></div>
		<div class="col-6">
			<jsp:include page="carouselQuestion.jsp"/>
		</div>
		<div class="col"></div>
	</div>
</c:if>
		<br/>
		<br/>
		<br/>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>