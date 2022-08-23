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
<h1>Update Question</h1>

	<form action="updateQuestion.do" method="POST">
		<div>
		<input type="hidden" name="id" value=${question.id } />
			Question Text <input type="text"class= "form-control" name="questionText" value="${question.questionText }"/>
			Explanation Text:
			<textarea rows="3" cols="40" name="description">${question.description}</textarea>
		</div>

		<button type="submit" class="btn btn-primary">Update Question</button>
	</form>
	<c:forEach var="o" items="${question.options }">
	<li>${o.optionText} correct:${o.correct} </li>
	</c:forEach>

	<form action="addOption.do" method="POST">
	<input type="text" name="optionText">
	<input type="checkbox" name="correct">
	<input type="hidden" name="questionId" value="${question.id}">
	
		<button type="submit" class="btn btn-primary">Add Option</button>
	</form>
	 </main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>