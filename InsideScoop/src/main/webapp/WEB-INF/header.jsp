<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row text-center">
	<c:choose>
		<c:when test="${empty loginCheck }">
			<h3 class="display-5">
			<a href="#loginModal" data-bs-toggle="modal" data-bs-target="#loginModal">
				Sign in
			</a>
			 or 
			<a href="register.do" class="text-info">
				Sign up
			</a>
			 to</h3>
			<h1 class="display-3">Get the Inside Scoop</h1>
		</c:when>
		<c:otherwise>
			<h1 class="display-3">Inside Scoop</h1>
		</c:otherwise>
	</c:choose>
</div>