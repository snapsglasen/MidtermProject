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
		<h1>Account Info</h1>
		${account.firstName }<br /> ${account.lastName }

		<form action="updateProfile.do" method="POST">
			<input type="hidden" name="id" value=${account.id } />

			<button type="submit" class="btn btn-primary">Update</button>
		</form>

		<form action="deleteUser.do" method="POST">
			<input type="hidden" name="id" value=${account.id } />

			<button type="submit" class="btn btn-primary">Delete Account</button>
		</form>
</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>