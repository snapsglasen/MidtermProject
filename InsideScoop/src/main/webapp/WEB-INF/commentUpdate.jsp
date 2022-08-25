<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update comment</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<jsp:include page="universalNavbar.jsp"/>

	<main class="container-fluid">
	<div class="div-content"></div>

	<form action="updateCommentAttempt.do" method="POST">
		<div>
		<input type="hidden" name="id" value=${displayPost.id } />
		<input type="hidden" name="commentId" value=${comment.id } />
			Comment: <input type="text" class="form-control" name="content" placeholder="${comment.content }"/> <br /> 
		</div>

		<button type="submit" class="btn btn-primary">Post comment</button>
	</form>
	</div>
</main>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>