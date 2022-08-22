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
<c:if test="${displayQuestion.active }">
		<h1>${displayQuestion.questionText }</h1>

<a href="profile.do?id=${displayPost.user.id }">${displayPost.user.firstName} ${displayPost.user.lastName }</a>



<c:if test="${loginCheck==displayQuestion.user || loginCheck.admin }">
<form action="updatePost.do" method="POST">
			<input type="hidden" name="id" value=${displayPost.id } /> <br />
		<button type="submit" class="btn btn-primary">Update</button>
	</form>
	
<form action="deletePost.do" method="POST">
			<input type="hidden" name="id" value=${displayPost.id } /> <br />
		<button type="submit" class="btn btn-primary">Delete</button>
	</form>
</c:if>


<c:forEach var="p" items="${displayPost.comments}">
<c:if test="${p.active}">
<br/>
${p.user.firstName }
${p.user.lastName }
<br/>
${p.lastUpdated }
<br/>
${p.content }
Likes: ${p.likes }

</c:if>
	<c:if test="${loginCheck==p.user ||loginCheck.admin }">
<form action="updateComment.do" method="POST">
			<input type="hidden" name="id" value=${displayPost.id } />
			<input type="hidden" name="commentId" value=${p.id } /> 
		<button type="submit" class="btn btn-primary">Update</button>
	</form>
	
<form action="deleteComment.do" method="POST">
			<input type="hidden" name="id" value=${displayPost.id } /> <br />
			<input type="hidden" name="commentId" value=${p.id } /> 
		<button type="submit" class="btn btn-primary">Delete</button>
	</form>
</c:if>
<br/>
</c:if>
</c:forEach>

</c:if>

</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>