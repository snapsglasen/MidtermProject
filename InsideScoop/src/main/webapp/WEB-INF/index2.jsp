<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<div class="container">

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
<div class="search">
<form action="searchPosts.do"><label for="postSearch">Looking for a post?</label>
<input type="text" class="form-control" name="search" id="postSearch"/>
<input class="btn btn-secondary btn-sm btn-search" type="submit" value="Search">
</form>
</div>

<div class="sort">
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
</div>
	<div class="posts">
		<c:forEach var="p" items="${posts }" >
			<c:if test="${p.active }">
			<div class="post-container">
			<div class="post-bg-white">
			<div class="post">
				<img src="<c:out value="${p.user.profilePicture }"/>" width="40px" height="40px">
				<h3><a href="showPost.do?postId=${p.id }">${p.title }</a></h3>
				<h5><a href="profile.do?id=${p.user.id }">by ${p.user.firstName} ${p.user.lastName }</a></h5>
				${p.createDate}
				${p.lastUpdate}
			</div>
			</div>
			</div>
			</c:if>
		</c:forEach>
	</div>
<div>
<c:if test="${not empty loginCheck }">
<form action="createPostPage.do">
<input class="btn btn-secondary btn-sm" type="submit" value="Create a Post">
</form>
</c:if>
</div>
</div>
<div class="footer">

</div>
</div>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>