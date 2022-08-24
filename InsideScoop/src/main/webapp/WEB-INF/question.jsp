<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<a href="profile.do?id=${displayQuestion.user.id }">${displayQuestion.user.firstName}${displayQuestion.user.lastName}</a>
<br/>
${displayQuestion.questionText }<br/>
<c:forEach var="category" items="${displayQuestion.categories}">
${category.name}
</c:forEach>
<!-- TAKE THIS OUT LATER -->
${displayQuestion.description}
<form action="questionAndAnswer.do">
<c:forEach var="option" items="${displayQuestion.options}">

 <input type="checkbox" id="option" value="${option.id}" name="option">
			<label for="option">${option.optionText }</label>

 <br/>
 </c:forEach>
 <input type="hidden" value="${displayQuestion.id }" name="questionId" /> 
 <button type="submit" class="btn btn-primary">Submit answer</button>
 </form>
 Likes: ${displayPost.likes }
<c:if test="${not empty loginCheck}">
<form action="upvotePost.do">
			<input type="hidden" name="userId" value=${loginCheck.id } /> 
			<input type="hidden" name="postId" value=${displayPost.id } /> 
		<button type="submit" class="btn btn-primary">Like</button>
	</form>
</c:if>
 
 <c:if test="${loginCheck==displayQuestion.user || loginCheck.admin }">
 <form action="updateQuestion.do" method="GET">
			<input type="hidden" name="questionId" value="${displayQuestion.id }" /> <br />
			<button type="submit" class="btn btn-primary">Update</button>
		</form>

		<form action="deleteQuestion.do" method="POST">
			<input type="hidden" name="id" value=${displayQuestion.id } /> <br />
			<button type="submit" class="btn btn-primary">Delete</button>
		</form>
 </c:if>
 <form action="randomQuestion.do">
 <button type="submit" class="btn btn-primary">to random question</button>
 </form>
 Your total attempts on this question: ${total} <br/>
 Your correct attempts on this question: ${correct}<br/>
 Your incorrect attempts on this question: ${incorrect}
</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>