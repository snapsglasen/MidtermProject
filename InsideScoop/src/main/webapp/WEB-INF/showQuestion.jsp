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
	<jsp:include page="createQuestionModal.jsp" />
	<jsp:include page="universalNavbar.jsp" />





	<div class="container-fluid">
		<div class="row row-main">








			<div class="col-sm">
				<div class="row p-4 m-4 justify-content-center">
					<div class="col-sm col-main d-flex justify-content-center">
						<div class="div-content p-4 justify-self-center">
							<div class="col-main">
								<h1>Question</h1>
							</div>
						</div>
					</div>
				</div>
				<div class="row p-4 justify-content-evenly">
					<div class="col-sm col-main d-flex justify-content-center">
						<div
							class="div-content p-4 m-4 justify-self-center align-items-center">
							<c:if test="${not empty loginCheck }">


								<form class="form-inlin" action="searchQuestions.do">


									<input type="text" class="form-control" name="search"
										id="postSearch" placeholder="Search Questions..." /> <input
										class="btn btn-secondary btn-search" type="submit"
										value="Search">

								</form>


	<br/>
								<a class="btn btn-secondary btn-sm" href="randomQuestion.do">Random
									Question</a>
								<button type="button" class="btn btn-primary btn-sm"
									data-bs-toggle="modal" data-bs-target="#createQuestionModal">
									Create</button>



							</c:if>
						</div>
					</div>

				</div>
			</div>
		</div>

</div>


		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>