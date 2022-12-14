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
<h1>LOGIN</h1>
<form action="attemptLogin.do" method="GET">
  UserName: <input class= "form-control" type="text" name="username" required/>
  Password: <input class="form-control" type="password" name="password" required/>
 <input class="bttn btn-primary" type="submit" value="Login" />
</form>
<a href="register.do">register?</a>
</main>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>