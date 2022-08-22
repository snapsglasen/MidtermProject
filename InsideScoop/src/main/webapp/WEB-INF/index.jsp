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

<div class="navbar">
	<c:choose>
		<c:when test="${not empty loginCheck }">
			<jsp:include page="navbar.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="loggedOutNavbar.jsp"/>
		</c:otherwise>
	</c:choose>
</div>
	
	<main class="container-fluid">
		<h1>Welcome to Inside Scoop</h1>
<form action="searchPosts.do">
Looking for a post?<input type="text" class= "form-control" name="search"/>
<input class="btn btn-secondary btn-sm" type="submit" value="Search post">
</form>
<form action="postByTitle.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Filter by Title">
</form>
</form>
<form action="postByOldest.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Filter by Oldest">
</form>
</form>
<form action="home.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Filter by Newest">
</form>

<c:forEach var="p" items="${posts }" >
<c:if test="${p.active }">
<img src="${p.user.profilePicture }"
width="40" height= "40">
<a href="profile.do?id=${p.user.id }">${p.user.firstName} ${p.user.lastName }</a>
<a href="showPost.do?postId=${p.id }">${p.title }</a>
${p.createDate}
${p.lastUpdate}
<br/>
</c:if>
</c:forEach>
<c:if test="${not empty loginCheck }">
<form action="createPostPage.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Create a Post">
</form>
</c:if>

</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>