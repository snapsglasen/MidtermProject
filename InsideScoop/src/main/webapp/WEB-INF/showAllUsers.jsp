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
	<jsp:include page="showUsersModal.jsp" />
	<jsp:include page="universalNavbar.jsp" />
	<div class="container-fluid">
		<div class="row row-main">

		





			
				<div class="col-sm" >
					<div class="row p-4 m-4 justify-content-center">
						<div class="col-sm col-main d-flex justify-content-center">
							<div class="div-content p-4 justify-self-center">
								<div class="col-main">
									<h1>Inside Scoop Members</h1>
								</div>
							</div>
						</div>
					</div>
					<div class="row p-4 justify-content-evenly">
						<div class="col-sm col-main d-flex justify-content-center">
							<div
								class="div-content p-4 m-4 justify-self-center align-items-center">
								<form action="searchUsers.do">
									Need to find someone?<input type="text" class="form-control"
										name="search" /> <input class="btn btn-primary" type="submit"
										value="Search profile">
											</form>
							</div>
						</div>

					</div>
				</div>
			</div>


		</div>

	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>