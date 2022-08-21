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
<form action="searchUsers.do">
<input type="text" class= "form-control" name="search"/>
<input class="btn btn-primary" type="submit" value="Search">
</form>
<c:choose>
<c:when test="${not empty loginCheck }">
	<jsp:include page="navbar.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
	<jsp:include page="loggedOutNavbar.jsp"></jsp:include>
	</c:otherwise>
	</c:choose>
	<main class="container-fluid">
		<h1>Welcome to Inside Scoop</h1>

<c:forEach var="p" items="${posts }" >
<c:if test="${p.active }">
${p.user.firstName}
${p.user.lastName }
<a href="showPost.do?postId=${p.id }">${p.title }</a>
${p.createDate}
${p.lastUpdate}
<br/>
</c:if>
</c:forEach>
<c:if test="${not empty loginCheck }">
<form action="createPostPage.do">
<input class="btn btn-primary" type="submit" value="Create a Post">
</form>
</c:if>

</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>