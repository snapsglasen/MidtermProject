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
${displayQuestion.questionText }

<c:forEach var="option" items="${displayQuestion.options}">
${option.optionText}
 <br/>
 </c:forEach>
 
 
</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>