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
<body class="container">

	<c:choose>
		<c:when test="${not empty loginCheck }">
			<jsp:include page="navbar.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="loggedOutNavbar.jsp"/>
		</c:otherwise>
	</c:choose>


<div class="header">
	<img src="/img/ice-cream.png"/>
	<h1>Inside Scoop</h1>
</div>

<div class="content">
<section class="search">
<form action="searchPosts.do">
Looking for a post?<input type="text" class= "form-control" name="search"/>
<input class="btn btn-secondary btn-sm" type="submit" value="Search post">
</form>
</section>

<section class="sort">
<article>
<a class="btn btn-secondary btn-sm" href="postByTitle.do">Sort by Title</a>
<a class="btn btn-secondary btn-sm" href="postByOldest.do">Sort by Oldest</a>
<a class="btn btn-secondary btn-sm" href="home.do">Sort by Most Recent</a>
</article>
<!--
<form action="postByTitle.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Filter by Title">
</form>

<form action="postByOldest.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Filter by Oldest">
</form>

<form action="home.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Filter by Newest">
</form>
-->
</section>
<section class="posts">
<c:forEach var="p" items="${posts }" >
<c:if test="${p.active }">
<img src="${p.user.profilePicture }"
width="40" height="40">
<a href="profile.do?id=${p.user.id }">${p.user.firstName} ${p.user.lastName }</a>
<a href="showPost.do?postId=${p.id }">${p.title }</a>
${p.createDate}
${p.lastUpdate}
<br/>
</c:if>
</c:forEach>
</section>
<section>
<c:if test="${not empty loginCheck }">
<form action="createPostPage.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Create a Post">
</form>
</c:if>
</section>
</div>
<div class="footer">

</div>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>