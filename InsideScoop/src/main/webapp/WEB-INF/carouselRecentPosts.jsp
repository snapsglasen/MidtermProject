<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:out value="${fn:length(posts) }"/>
<div id="recentPostCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
	<div class="carousel-indicators my-4">
  		<c:set var="slideNum" value="0" scope="page"/>
  		<c:forEach var="post" items="${posts }">
  			<c:if test="${post.active }">
    			<button
    				type="button"
    				data-bs-target="#recentPostCarousel"
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
  		<c:forEach var="post" items="${posts }">
  			<c:if test="${post.active }">
    			<div class="carousel-item bg-light d-block w-100 <c:if test="${slideNum==0 }">active</c:if>">
    			<img src="img/bananaMania.png" class="d-block">
      					<div class="carousel-caption d-none d-md-block bg-light mb-4">
        					<h5><a href="showPost.do?postId=<c:out value="${post.id }"/>">${post.title }</a></h5>
        					<p class="text-truncate">${post.content }</p>
      					</div>
				</div>
    			<c:set var="slideNum" value="${slideNum+1 }" scope="page"/>
    		</c:if>
    	</c:forEach>
 	</div>
 	<button class="carousel-control-prev" type="button" data-bs-target="#recentPostCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#recentPostCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
