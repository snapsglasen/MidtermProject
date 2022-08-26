<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<c:if test="${popup }">
<script type="text/javascript">
	$(window).on('load', function() {
		$("#updateQuestionModal").modal('show');
	});
</script>
</c:if>


<div class="modal fade" id="updateQuestionModal" tabindex="-1" aria-labelledby="updateQuestionModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateQuestionModalLabel">Create Post</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      	<form action="updateQuestion.do" method="POST">
      	
      		<input type="hidden" name="popup" value="false">
      		<input type="hidden" name="id" value="${displayQuestion.id }">
      		
      	
      		<div class="form-group">
				<label for="questionText">Question:</label>
				<input type="text" class= "form-control" id="questionText"  name="questionText" value="${displayQuestion.questionText }" />
			</div>
			<div class="form-group">
				<label for="content">Explanation of answer:</label>
				<input type="text" class= "form-control" id="description" name="description" value="${displayQuestion.description }"/>
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
		
		<c:forEach var="o" items="${displayQuestion.options }">
	<form action="deleteOption.do" method="POST">
	<input type="hidden" name="optionId" value="${o.id}">
	<input type="hidden" name="questionId" value="${displayQuestion.id}">
	<input type="hidden" name="popup" value="true">
		<button type="submit" class="btn btn-primary">${o.optionText} correct:${o.correct}</button>
	</form>
	
	</c:forEach>
	
	<form action="addOption.do" method="POST">
	<input type="text" name="optionText" required>
	<input type="checkbox" name="correct">
	<input type="hidden" name="questionId" value="${displayQuestion.id}">
	<input type="hidden" name="popup" value="true">
	
		<button type="submit" class="btn btn-primary">Add Option</button>
	</form>
		
      </div>
      <div class="modal-footer">
      
      </div>
    </div>
  </div>
</div>
			

	 