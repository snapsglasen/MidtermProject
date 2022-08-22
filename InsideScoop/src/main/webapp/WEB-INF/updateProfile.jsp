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
		<h1>Update Profile</h1>
		<form action="updateProfileAttempt.do" method="GET">
			<input type="hidden" name="id" value=${profile.id } /> First Name: <input
				class="form-control" type="text" name="firstName"
				placeholder="${profile.firstName }" /> Last Name: <input
				class="form-control" type="text" name="lastName"
				placeholder="${profile.lastName }" /> Email: <input
				class="form-control" type="text" name="email"
				placeholder="${profile.email }" /> UserName: <input
				class="form-control" type="text" name="username"
				placeholder="${profile.username }" /> Password: <input
				class="form-control" type="password" name="password"
				placeholder="${profile.password }" /> 
				Work Role: <input class="form-control" type="text" name="workRole" placeholder="${profile.workRole.role }" />
				Company: <input class="form-control" type="text" name="company" placeholder="${profile.company.name }" />
				Profile picture URL: <input class="form-control" type="text" name="profilePicture" placeholder="${profile.profilePicture }" />
				
			<label for="category">Choose a category:</label> <select
				name="category">
				<option value="1">Student</option>
				<option value="2">Instructor</option>
				<option value="3">Alumni</option>
				
				
			</select> <input class="bttn btn-primary" type="submit" value="update" />
		</form>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>