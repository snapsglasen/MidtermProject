<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<main class="container-fluid">
		<h1>Account Info</h1>
		${account.firstName }<br /> ${account.lastName }

		<form action="updateProfile.do" method="POST">
			<input type="hidden" name="id" value=${account.id } />

			<button type="submit" class="btn btn-primary">Update</button>
		</form>

		<form action="deleteUser.do" method="POST">
			<input type="hidden" name="id" value=${account.id } />

			<button type="submit" class="btn btn-primary">Delete Account</button>
		</form>

		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>