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
		<h1>Welcome to Inside Scoop</h1>

<c:forEach var="p" items="${posts }" >

${p.user.firstName}
${p.user.lastName }
<a href="showPost.do?postId=${p.id }">${p.title }</a>
${p.createDate}
${p.lastUpdate}
<br/>
</c:forEach>
<form action="createPostPage.do">
<input class="btn btn-primary" type="submit" value="Create a Post">
</form>
</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>