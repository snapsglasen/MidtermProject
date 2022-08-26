<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${empty loginCheck }">
		<div class="row h-100 align-items-center">
		<div class="col-sm col-main d-flex justify-content-center">
			<div class="div-content p-4">
				<div class="text-center">
					<h1 class="display-5">
						Get the Inside Scoop
					</h1>
					<br/>
					<button type="button" class="btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#registerModal">
 						Sign up
					</button>
				</div>
			</div>
		</div>
		</div>
		</c:when>
	<c:otherwise>
		<div class="row align-items-center">
			<div class="col-sm">
				<div class="row p-4 mt-4 justify-content-center">
					<div class="col-sm col-main d-flex justify-content-center">
						<div class="div-content p-4 justify-self-center">
							<div class="text-center">
								<h1 class="display-5">Welcome, <c:out value="${loginCheck.firstName } ${loginCheck.lastName }"/></h1>
							</div>
						</div>
					</div>
				</div>
				<div class="row p-4 justify-content-evenly">
					<div class="col-sm col-main d-flex justify-content-center">
						<div class="div-content p-4 m-4 justify-self-center align-items-center">
							<div class="text-center pb-4">
								Trending Posts
							</div>
							<jsp:include page="carouselRecentPosts.jsp"/>
						</div>
					</div>
					<div class="col-sm col-main d-flex justify-content-center">
						<div class="div-content p-4 m-4 justify-self-center align-items-center">
							<div class="text-center pb-4">
								Recent Questions
							</div>
							<jsp:include page="carouselTrendingQuestions.jsp"/>
						</div>
					</div>
					<div class="col-sm col-main d-flex justify-content-center">
						<div class="div-content p-4 m-4 justify-self-center align-items-center">
							<div class="text-center pb-4">
								New Users
							</div>
							<jsp:include page="carouselNewUsers.jsp"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>