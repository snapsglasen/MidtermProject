<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<jsp:include page="universalNavbar.jsp"/>
	<main class="container-fluid">
	<div class="row text-center">
	
<br/>
<br/>
<br/>
		<c:choose>
			<c:when test="${bool }">
				<h2>You were correct!</h2>
			</c:when>
			<c:otherwise>
				<h2>You were wrong!</h2>
			</c:otherwise>
		</c:choose>
		
		<div class="div-header p-4">${displayQuestion.questionText}</div>
		<c:forEach var="option" items="${displayQuestion.options}">
			<c:if test="${option.correct }"><div class="div-header p-4">${option.optionText }</div><br />
			</c:if>
		</c:forEach>
		<div class="div-header p-4">${displayQuestion.description}</div>
		<br/>

		<c:if test="${not empty loginCheck}">
		<div class="form-group row">
			<form action="upvoteQuestion.do">
				<input type="hidden" name="userId" value=${loginCheck.id } /> <input
					type="hidden" name="questionId" value=${displayQuestion.id } />
				<button type="submit" class="btn btn-primary"><img alt="Likes" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5IvDeqblUvYW7p51bBuCQciah3vxviSD4BA&usqp=CAU" width="50" height= "50"></button>
			Likes: ${likes }
			</form>
			<br/>
			<form action="deleteUpvoteQuestion.do">
				<input type="hidden" name="userId" value=${loginCheck.id } /> <input
					type="hidden" name="questionId" value=${displayQuestion.id } />
				<button type="submit" class="btn btn-primary"><img alt="Dislikes" src="https://img.freepik.com/free-photo/melted-red-ice-cream_23-2147831853.jpg?w=2000" width="50" height= "50"></button>
			Dislikes: ${dislikes }
			</form>
			
		</div>
		</c:if>
		<div class="row text-center">
		Total attempts: ${totalAttempt} Total correct attempts:
		${correctAttempt}
		</div>
		<form action="randomQuestion.do">
			<button type="submit" class="btn btn-primary">to random
				question</button>
		</form>
		</div>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>