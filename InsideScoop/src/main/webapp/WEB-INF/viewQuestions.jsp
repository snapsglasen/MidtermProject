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
<jsp:include page="createQuestionModal.jsp"/>
<jsp:include page="universalNavbar.jsp"/>
<div class="container align-items-center">
	<div class="row"></div>
	
	<!-- Header -->
	<div class="row m-3">
		<div class="col"></div>
		<div class="col-8">
			<jsp:include page="header.jsp"/>
		</div>
		<div class="col"></div>
	</div>
	</div>
	<div class="row"></div>
	
<!-- Search -->
<div class="container-fluid">
<div class="content">
<div class="search">
<div class="row m-3">
	<form class="form-inlin" action="searchQuestions.do"><label for="questionSearch"> Looking for a question?</label>
		<input type="text" class="form-control" name="search" id="postSearch"
			placeholder="Search Questions" />
		<input class="btn btn-secondary btn-search" type="submit" value="Search">
	</form>
	</div>
	</div>
	<div class="row m-3">
	<article>
<a class="btn btn-secondary btn-sm" href="randomQuestion.do">Random Question</a>
<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#createQuestionModal">
  		Create
	</button>
</article>
</div>
	<br/>
	<!--Questions-->
	<div class="row m-3">
	
	<div class="posts">
		<c:forEach var="question" items="${questions}">
		<c:if test="${question.active }">
			<div class="post-container">
			<div class="post-bg-white">
			<div class="post">
			<div class="div-content">
			<img src="<c:out value="${question.user.profilePicture }"/>" width="40px" height="40px">
			<h3><a href="question.do?questionId=${question.id}">${question.questionText}</a></h3>
			<h5><a href="profile.do?id=${question.user.id }">by ${question.user.firstName} ${question.user.lastName }</a></h5>
			</div>
			</div>
			</div>
			</div>
			<br/>
			<br/>
			</c:if>
		</c:forEach>
		<br/>
		
		<c:if test="${not empty loginCheck }">
		<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#createQuestionModal">
  		Create
	</button>
		</c:if>
</div>
</div>
<div class="footer">

</div>
</div>
</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>