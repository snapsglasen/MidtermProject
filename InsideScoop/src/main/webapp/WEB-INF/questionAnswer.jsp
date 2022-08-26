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
	<div class="row-main">
	<div class="col-main">
	
<br/>
<br/>
<br/>
<div class="div-content">
		<c:choose>
			<c:when test="${bool }">
				<h2 class="text-center">You were correct!</h2>
			</c:when>
			<c:otherwise>
				<h2 class="text-center">You were wrong!</h2>
			</c:otherwise>
		</c:choose>
		
		<br/>
		<h5>${displayQuestion.questionText}</h5>
		<br/>
		<strong><em>Correct answer:</em></strong>
		<br/>
		<c:forEach var="option" items="${displayQuestion.options}">
			<c:if test="${option.correct }">${option.optionText }<br />
			</c:if>
		</c:forEach>
		<br/>
		<strong><em>Explanation:</em></strong>
		<br/>
		${displayQuestion.description}
		<br/>
		<br/>

		<c:if test="${not empty loginCheck}">
		<div class="form-group row">
			<form action="upvoteQuestionAnswer.do">
				<input type="hidden" name="userId" value=${loginCheck.id } /> <input
					type="hidden" name="questionId" value=${displayQuestion.id } />
					<input type="hidden" name="bool" value=${bool } />
				<button type="submit" class="btn btn-primary"><img alt="Likes" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5IvDeqblUvYW7p51bBuCQciah3vxviSD4BA&usqp=CAU" width="50" height= "50"></button>
			Likes: ${likes }
			</form>
			<br/>
			<form action="deleteUpvoteQuestionAnswer.do">
				<input type="hidden" name="userId" value=${loginCheck.id } /> <input
					type="hidden" name="questionId" value=${displayQuestion.id } />
					<input type="hidden" name="bool" value=${bool } />
				<button type="submit" class="btn btn-primary"><img alt="Dislikes" src="https://img.freepik.com/free-photo/melted-red-ice-cream_23-2147831853.jpg?w=2000" width="50" height= "50"></button>
			Dislikes: ${dislikes }
			</form>
			
		</div>
		</c:if>
		
		Total attempts: ${totalAttempt} <br/>
		Total correct attempts: ${correctAttempt}
		<form action="randomQuestion.do">
			<button type="submit" class="btn btn-primary">to random
				question</button>
		</form>
		</div>
		</div>
		</div>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>