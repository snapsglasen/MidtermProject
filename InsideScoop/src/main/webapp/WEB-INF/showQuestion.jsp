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
	<form action="searchQuestions.do">
		<input type="text" name="search" id="postSearch"
			placeholder="Search Questions..." /> <input type="submit"
			value="Search" />

	</form>
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

		<form action="randomQuestion.do">
			<button type="submit" class="btn btn-primary">to random
				question</button>
		</form>
		<c:forEach var="question" items="${questions}">

			<a href="question.do?id=${question.id }">
				${question.questionText}</a>

			<br />
		</c:forEach>
		<br/>
		
		<%--  Likes: ${displayQuestion.likes } 
<c:if test="${not empty loginCheck}">
<form action="upvoteQuestion.do">
			<input type="hidden" name="userId" value=${loginCheck.id } /> 
			<input type="hidden" name="questionId" value=${displayQuestion.id } /> 
		<button type="submit" class="btn btn-primary">Like</button>
	</form>
</c:if> --%>

		<%-- <c:if test="${loginCheck==displayQuestion.user || loginCheck.admin }"> --%>
		<br />
		<form action="createQuestionPage.do" method="POST">
			<button type="submit" class="btn btn-primary">Create
				Question</button>
		</form>
		<%-- </c:if> --%>









	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>