<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="deleteVerifyModal" tabindex="-1" aria-labelledby="deleteVerifyModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteVerifyModalLabel">Sign in</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      Are you sure you want to delete your account?
      	<form action="deleteUser.do" method="POST">
			<input type="hidden" name="id" value=${account.id } />
  			<button type="submit" class="btn btn-primary">DELETE</button>
		</form>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>