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
<jsp:include page="universalNavbar.jsp"/>
	<main class="container-fluid">
<br/>
	<div class="row row-header">
			<div class="row text-center">
		
<div class="container-fluid">
<div class="row">
<div class="col-sm">
<div class="div-content">
<img src="${profile.profilePicture }" alt="Profile picture"
width="300" height= "300">
</div>
</div>


<div class="col-sm">
<div class="div-content">
<h1 class="display-3">${profile.firstName } ${profile.lastName }</h1>
<h4>Works at: ${profile.company.name }<br/>
Role: ${profile.workRole.role }<br/>
${profile.userCategory.name}<br/><br/>
Total correct quiz questions:<br/> ${correct}<br/></h4>
<c:if test="${loginCheck==profile }">
<form action="account.do">
<input class="btn btn-primary" type="submit" value="Account">
</form>
</c:if>
<c:if test="${profile!=loginCheck && loginCheck.admin }">
<form action="adminAccount.do">
<input type= "hidden" name="id" value="${profile.id }"/>
<input class="btn btn-primary" type="submit" value="To user's account page">
</form>
</c:if>
</div>
<br/>
<br/>
</div>
<div class="col-sm">
<c:forEach var="p" items="${displayPost }">
<div class="div-content">
<div class="div-header p-4">
<div class="text-truncate">
<a href="showPost.do?postId=${p.id }">${p.title }</a>
</div>
<div class="text-truncate">${p.content}</div>
</div>
</div>
<br/><br/>
</c:forEach>
</div>
</div>
</div>
</div>
</div>
</main>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>