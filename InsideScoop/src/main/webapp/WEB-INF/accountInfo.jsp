<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<jsp:include page="updateProfileModal.jsp"/>
<jsp:include page="deleteVerifyModal.jsp"/>
<jsp:include page="universalNavbar.jsp"/>

	<main class="container-fluid">
	<div class="row-main">
	<div class="col-main">
		<h1>Account Info</h1>
		</div>
		</div>
	<div class="row-main">
	<div class="col-main">
	<div class="div-content">
	<br/>
		<h3>${account.firstName } ${account.lastName }</h3>
		Username: ${account.username}<br/>
		Email: ${account.email}<br/>
		<br/>
		Connection with Skill Distillery:<br>
		${account.userCategory.name}<br/>
		<br/>
		Company: ${account.company}<br/>
		Role: ${account.workRole}<br/>
		<br/>
		Quiz master:<br/>
		Total questions attempted: ${total}<br/>
		Total correct: ${correct }<br/>
		Total incorrect: ${incorrect }<br>
<br/>
		</div>
		</div>
		</div>
		<br/>
		<div class="row-main">
	<div class="col-main">
		<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateProfileModal">
  		Update
	</button>
		<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteVerifyModal">
  		Delete
	</button>
		</div>
		</div>
</main>
		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>