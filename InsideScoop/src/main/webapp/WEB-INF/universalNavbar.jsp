<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${not empty loginCheck }">
		<jsp:include page="navbar.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:include page="loggedOutNavbar.jsp"/>
	</c:otherwise>
</c:choose>