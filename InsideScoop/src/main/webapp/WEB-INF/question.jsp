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
 
 <form action="randomQuestion.do">
 <button type="submit" class="btn btn-primary">to random question</button>
 </form>
</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>