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
<jsp:include page="updateProfileModal.jsp"/>
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
		${account.firstName }${account.lastName }<br/>
		Total questions attempted: ${total}<br/>
		Total correct: ${correct }<br/>
		Total incorrect: ${incorrect }<br>

		<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateProfileModal">
  		Update
	</button>

		<form action="deleteUser.do" method="POST">
			<input type="hidden" name="id" value=${account.id } />

			<button type="submit" class="btn btn-primary">Delete Account</button>
		</form>
</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>