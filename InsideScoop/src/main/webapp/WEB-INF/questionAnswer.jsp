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
<c:choose>
<c:when test="${bool }"><h2>You were correct!</h2></c:when>
<c:otherwise><h2>You were wrong!</h2></c:otherwise>
</c:choose>

${displayQuestion.questionText }<br/>
<c:forEach var="option" items="${displayQuestion.options}">
<c:if test="${option.correct }">${option.optionText }<br/></c:if>
 </c:forEach>
 Total attempts: ${totalAttempt}
 Total correct attempts: ${correctAttempt}
 <form action="randomQuestion.do">
 <button type="submit" class="btn btn-primary">to random question</button>
 </form>
</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>