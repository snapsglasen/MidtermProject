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
<jsp:include page="navbar.jsp"></jsp:include>
	<main class="container-fluid">


	<form action="createPost.do" method="POST">
		<div>
			Title <input type="text"class= "form-control" name="title" /><br/>
			Content of Post <input type="text" class= "form-control" name="content" /> <br /> 
		</div>

		<button type="submit" class="btn btn-primary">Add Post</button>
	</form>
	 </main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>