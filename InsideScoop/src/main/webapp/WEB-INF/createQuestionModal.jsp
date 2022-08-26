<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="createQuestionModal" tabindex="-1" aria-labelledby="createQuestionModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createQuestionModalLabel">Create Question</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      	<form action="createQuestion.do" method="POST">
      	
      		<div class="form-group">
				<label for="questionText">Question:</label>
				<input type="text" class= "form-control" id="questionText"  name="questionText" required />
			</div>
			<div class="form-group">
				<label for="content">Explanation of answer:</label>
				<input type="text" class= "form-control" id="description" name="description"/>
			</div>
			<div class="form-group">
				<label for="category">What category would this be?:</label>
				<c:forEach var="p" items="${categories }">
			<input type="checkbox" id="category" value="${p.id}" name="category">
			<label for="category">${p.name }</label>
			</c:forEach>
			</div>
			
			

			<div class="form-group">
  				<button type="submit" class="btn btn-secondary">Post</button>
  			</div>
		</form>
      </div>
      <div class="modal-footer">
      
      </div>
    </div>
  </div>
</div>
			

	 