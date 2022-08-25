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
<script>
	$(document).ready(function(){
		$("#updateQuestionModal").modal('show');
	});
</script>
</head>
<body>
<jsp:include page="updateQuestionModal.jsp"/>
<jsp:include page="universalNavbar.jsp"/>


	<main class="container-fluid">
		
		<div class="row row-header">
		<div class="div-header">
		<div class="div-header p-4">
			<div class="row text-center">
			<h1 class="display-3">${displayQuestion.questionText }</h1>
		<a href="profile.do?id=${displayQuestion.user.id }">${displayQuestion.user.firstName} ${displayQuestion.user.lastName}</a>
				<label for="category">Categories:</label>
				<c:forEach var="category" items="${displayQuestion.categories}">
<div class="text-center">${category.name}</div>
</c:forEach>
			</div>
			</div>
			</div>
		</div>
		
		<div class="row">
<div class="col-sm">
		<div class="row text-center">
		<form action="questionAndAnswer.do">
			<c:forEach var="option" items="${displayQuestion.options}">

				<input type="checkbox" id="option" value="${option.id}"
					name="option">
				<label for="option">${option.optionText }</label>
				<br />
			</c:forEach>
			<input type="hidden" value="${displayQuestion.id }" name="questionId" />
			<button type="submit" class="btn btn-primary">Submit answer</button>
		</form>
		<br/>
		<br/>
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
		</div>
		</div>

		<div class="col-sm">
		<c:if test="${loginCheck==displayQuestion.user || loginCheck.admin }">
			<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateQuestionModal">
  		Update
	</button>

			<form action="deleteQuestion.do" method="POST">
				<input type="hidden" name="id" value=${displayQuestion.id } /> <br />
				<button type="submit" class="btn btn-primary">Delete</button>
			</form>
		</c:if>
		<form action="randomQuestion.do">
			<button type="submit" class="btn btn-primary">to random
				question</button>
		</form>
		Your total attempts on this question: ${total} <br /> 
		Your correct attempts on this question: ${correct}<br /> 
		Your incorrect attempts on this question: ${incorrect}
		</div>
		</div>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>