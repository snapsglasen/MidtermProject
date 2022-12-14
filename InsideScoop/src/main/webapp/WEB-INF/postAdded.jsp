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
		<h1>${displayPost.title }</h1>
<h1>Post Successfully Created</h1>

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
<c:forEach var="p" items="${displayPost.comments}">
${p }
</c:forEach>



</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>