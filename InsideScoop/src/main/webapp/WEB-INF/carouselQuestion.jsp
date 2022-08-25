<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div id="questionCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
	<div class="carousel-indicators my-4">
  		<c:set var="slideNum" value="0" scope="page"/>
  		<c:forEach var="question" items="${questions}">
  			<c:if test="${question.active }">
    			<button
    				type="button"
    				data-bs-target="#questionCarousel"
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
    			<div class="carousel-item <c:if test="${slideNum==0 }">active</c:if>">
      				<!-- <img class="d-block w-100 center-cropped" src="https://www.ffxnow.com/files/2022/04/Ice-cream-cones-1260x840.jpg"> -->
      				<img class="d-block w-100 center-cropped" src="https://media.gettyimages.com/videos/pastel-subtle-looping-ice-cream-bokeh-background-video-id858591902?s=640x640">
      					<div class="carousel-caption d-none d-md-block bg-light mb-4">
        					<h5 class="text-truncate">><a href="question.do?questionId=<c:out value="${question.id }"/>">${question.questionText }</a></h5>
        					<p class="text-truncate">${question.description } <br>
        					<c:forEach var="c" items="${question.categories}" >
        					${c.name }
        					</c:forEach>
        					</p>
      					</div>
				</div>
    			<c:set var="slideNum" value="${slideNum+1 }" scope="page"/>
    		</c:if>
    	</c:forEach>
 	</div>
 	
 	
 	<button class="carousel-control-prev" type="button" data-bs-target="#questionCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#questionCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
