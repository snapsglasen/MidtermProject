<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Post</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<c:choose>
<c:when test="${not empty loginCheck }">
	<jsp:include page="navbar.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
	<jsp:include page="loggedOutNavbar.jsp"></jsp:include>
	</c:otherwise>
	</c:choose>
	<main class="container-fluid">


	<form action="createPost.do" method="POST">
		<div>
			Title <input type="text"class= "form-control" name="title" /><br/>
			Content of Post <input type="text" class= "form-control" name="content" /> <br /> 
			Does this post have to deal with any companies in particular? <br/>
			<input type="text" class= "form-control" name="company" /> <br /> 
			<!-- Does this post have to deal with any specific work role? <br/>
			<input type="text" class= "form-control" name="workRole" /> <br />  -->
		</div>

		<button type="submit" class="btn btn-primary">Add Post</button>
	</form>
	 </main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>