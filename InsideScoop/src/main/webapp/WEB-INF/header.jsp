<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="text-center">
	<c:choose>
		<c:when test="${empty loginCheck }">
			<h1 class="display-3">Get the Inside Scoop</h1><br/>
				<button type="button" class="btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#registerModal">
  					Sign up
				</button>
		</c:when>
		<c:otherwise>
			<h1 class="display-3">Inside Scoop</h1>
		</c:otherwise>
	</c:choose>
</div>