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
<br/>
${profile.firstName }
${profile.lastName }
${profile.workRole.role }<br/>
${profile.company.name }<br/>
Total correct quiz questions: ${correct}
<c:if test="${loginCheck==profile }">
<a href="account.do">account</a>
</c:if>
<c:if test="${loginCheck.admin}">
<form action="adminAccount.do">
<input type= "hidden" name="id" value="${profile.id }"/>
<input class="btn btn-primary" type="submit" value="To user's account page">
</form>
</c:if>
</main>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>