<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="trendingQuestionCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
	<div class="carousel-indicators my-4">
  		<c:set var="slideNum" value="0" scope="page"/>
  		<c:forEach var="question" items="${questions }">
  			<c:if test="${question.active }">
    			<button
    				type="button"
    				data-bs-target="#trendingQuestionCarousel"
    				data-bs-slide-to="<c:out value="${slideNum }"/>"
    				aria-label="Slide <c:out value="${slideNum+1 }"/>"
    				<c:if test="${slideNum==0 }">class="active" aria-current="true"</c:if>>
    			</button>
    			<c:set var="slideNum" value="${slideNum+1 }" scope="page"/>
    		</c:if>
    	</c:forEach>
 	</div>
 	<div class="carousel-inner">
 		<c:set var="slideNum" value="0" scope="page"/>
  		<c:forEach var="question" items="${questions }">
  			<c:if test="${question.active }">
  				<a href="question.do?questionId=<c:out value="${question.id }"/>">
    			<div class="carousel-item <c:if test="${slideNum==0 }">active</c:if>">
    				<div class="d-flex h-100 align-items-center justify-content-center">
    				<img src="img/cream.png" class="d-block w-100">
      					<div class="carousel-caption h-75 pb-4 mb-4">
        					<h5>${question.description }</h5>
      					</div>
      				</div>
				</div>
    			<c:set var="slideNum" value="${slideNum+1 }" scope="page"/>
    			</a>
    		</c:if>
    	</c:forEach>
 	</div>
 	<button class="carousel-control-prev" type="button" data-bs-target="#trendingQuestionCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#trendingQuestionCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
