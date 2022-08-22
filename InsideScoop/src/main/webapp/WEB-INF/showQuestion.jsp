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

		<h1>${displayQuestion.questionText }</h1>

		<%-- <a href="profile.do?id=${displayPost.user.id }">${displayPost.user.firstName}
				${displayPost.user.lastName }</a>
 --%>


		<%-- <c:if test="${loginCheck==displayQuestion.user || loginCheck.admin }"> --%>
		<form action="updateQuestion.do" method="POST">
			<input type="hidden" name="id" value=${displayQuestion.id } /> <br />
			<button type="submit" class="btn btn-primary">Update</button>
		</form>

		<form action="deleteQuestion.do" method="POST">
			<input type="hidden" name="id" value=${displayQuestion.id } /> <br />
			<button type="submit" class="btn btn-primary">Delete</button>
		</form>
		<%-- </c:if> --%>









	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>