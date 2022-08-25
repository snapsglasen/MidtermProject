<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHead.jsp" />
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
		<a href="profile.do?id=${displayQuestion.user.id }">${displayQuestion.user.firstName}${displayQuestion.user.lastName}</a>
		<br /> ${displayQuestion.questionText }<br />
		<c:forEach var="category" items="${displayQuestion.categories}">
${category.name}
</c:forEach>
		<!-- TAKE THIS OUT LATER -->
		${displayQuestion.description}
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
		Likes: ${likes }
		<br/>
		Dislikes: ${dislikes }
		<c:if test="${not empty loginCheck}">
			<form action="upvoteQuestion.do">
				<input type="hidden" name="userId" value=${loginCheck.id } /> <input
					type="hidden" name="questionId" value=${displayQuestion.id } />
				<button type="submit" class="btn btn-primary">Like</button>
			</form>
			<br />
			<form action="deleteUpvoteQuestion.do">
				<input type="hidden" name="userId" value=${loginCheck.id } /> <input
					type="hidden" name="questionId" value=${displayQuestion.id } />
				<button type="submit" class="btn btn-primary">Dislike</button>
			</form>
		</c:if>

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
		Your total attempts on this question: ${total} <br /> Your correct
		attempts on this question: ${correct}<br /> Your incorrect attempts on
		this question: ${incorrect}
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>