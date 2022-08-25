<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${empty loginCheck }">
		<div class="row row-main">
		<div class="col-sm col-main d-flex justify-content-center">
			<div class="div-content p-4">
				<div class="text-center">
					<h1 class="display-3">
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
		<div class="row row-main">
		<div class="col-sm col-main d-flex justify-content-center">
			<div class="div-content p-4 justify-self-center">
				<div class="text-center">
					<h1 class="display-3">Welcome, <c:out value="${loginCheck.firstName } ${loginCheck.lastName }"/></h1>
				</div>
			</div>
		</div>
		</div>
	</c:otherwise>
</c:choose>