<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pet Finder</title>
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
	<!-- blah blah -->
    </main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>