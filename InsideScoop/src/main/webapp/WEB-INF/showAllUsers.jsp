<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css" />

</head>
<body>
<jsp:include page="showUsersModal.jsp"/>
<jsp:include page="universalNavbar.jsp"/>
	<div class="container">
		
		<main>
		
			<h1>Inside Scoop Members</h1>

			 <form action="searchUsers.do">
				Need to find someone?<input type="text" class="form-control"
					name="search" /> <input class="btn btn-primary" type="submit"
					value="Search profile">
			</form>

			<%-- <c:forEach var="p" items="${users }">
				<c:if test="${p.active }">
					<a href="profile.do?id=${p.id }">${p.firstName} ${p.lastName }</a>
					<br />
				</c:if>
			</c:forEach> --%>
<!-- Modal -->

		</main>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>