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
<h1>Profile</h1>
<img src="${profile.profilePicture }" alt="Profile picture"
width="50" height= "50">
${profile.firstName }<br/>
${profile.lastName }
${profile.workRole.role }
${profile.company.name }

<c:if test="${loginCheck==profile }">
<a href="account.do">account</a>
</c:if>
</main>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>