<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>

<!-- Login Modal -->
<jsp:include page="loginModal.jsp"/>

<!-- Register Modal -->
<jsp:include page="registerModal.jsp"/>

<!--  Register Modal -->

<!-- Navbar -->
<jsp:include page="universalNavbar.jsp"/>

<!-- Container for grid -->
<div class="container-fluid">

	<!-- Content -->
	<div class="row row-header">
		<div class="col-sm"></div>
		<div class="col-sm col-header">
			<div class="div-header p-4">
				<jsp:include page="header.jsp"/>
			</div>
		</div>
		<div class="col-sm"></div>
	</div>
	
</div>

<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>
