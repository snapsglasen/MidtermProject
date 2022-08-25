<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="updateCommentModal" tabindex="-1" aria-labelledby="updateCommentModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateCommentModalLabel">Edit comment</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      	<form action="updateCommentAttempt.do" method="POST">
      	<div class="form-group">
				<label for="content">content:</label>
				<input type="text" class= "form-control" id="content"  name="content" value="${p.content}"/>
			</div>
			<input type="hidden" name="id" value="${displayPost.id }" />
			<input type="hidden" name="commentId" value="${p.id }" /> 
  			<button type="submit" class="btn btn-primary">Update</button>
		</form>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>