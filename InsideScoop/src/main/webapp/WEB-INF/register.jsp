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
<h1>LOGIN</h1>
<form action="" method="GET">
  First Name: <input class= "form-control" type="text" name="firstName" required/>
  Last Name: <input class= "form-control" type="text" name="lastName" required/>
  Email: <input class= "form-control" type="text" name="email" required/>
  UserName: <input class= "form-control" type="text" name="username" required/>
  Password: <input class="form-control" type="password" name="password" required/>
 <input class="bttn btn-primary" type="submit" value="register" />
</form>
<a href="login.do">login?</a>
</main>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>