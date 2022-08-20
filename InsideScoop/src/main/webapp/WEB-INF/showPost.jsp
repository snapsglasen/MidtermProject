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
	<jsp:include page="navbar.jsp"></jsp:include>
	<main class="container-fluid">
		<h1>${displayPost.title }</h1>


${displayPost.user.firstName}
${displayPost.user.lastName }
${displayPost.createDate}
${displayPost.lastUpdate}
${displayPost.content}

<c:forEach var="p" items="${displayPost.companies }">
${p }
</c:forEach>
<c:forEach var="p" items="${displayPost.workRoles }">
${p }
</c:forEach>
<c:forEach var="p" items="${displayPost.categories}">
${p }
</c:forEach>

<form action="createComment.do" method="POST">
		<div>
			Comment:<input class= "form-control" type="text" name="content" /> <br />
			<input type="hidden" name="id" value=${displayPost.id } /> <br />
		</div>

		<button type="submit" class="btn btn-primary">Add comment</button>
	</form>

<c:forEach var="p" items="${displayPost.comments}">
${p }
</c:forEach>



</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>