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
		<h1>Inside scoop customers</h1>

<form action="searchUsers.do">
Need to find someone?<input type="text" class= "form-control" name="search"/>
<input class="btn btn-primary" type="submit" value="Search profile">
</form>

<c:forEach var="p" items="${users }" >
<c:if test="${p.active }">
<a href="profile.do?id=${p.id }">${p.firstName} ${p.lastName }</a>
<br/>
</c:if>
</c:forEach>


</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>