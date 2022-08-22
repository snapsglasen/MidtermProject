<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
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
<h1>Update Post</h1>

	<form action="updatePostAttempt.do" method="POST">
		<div>
		<input type="hidden" name="id" value=${post.id } />
			Title <input type="text"class= "form-control" name="title" placeholder="${post.title }"/><br/>
			Content of Post <input type="text" class= "form-control" name="content" placeholder="${post.content }"/> <br /> 
			Does this post have to deal with any companies in particular? <br/>
			<input type="text" class= "form-control" name="company" placeholder="${post.company }"/> <br /> 
			Does this post have to deal with any specific work role? <br/>
			<input type="text" class= "form-control" name="workRole" placeholder="${post.workRole }"/> <br />
		</div>

		<button type="submit" class="btn btn-primary">Update Post</button>
	</form>
	 </main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>