<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#loginModal").on('shown.bs.modal', function(){
        $(this).find('#username').focus();
    });
});
</script>

<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">Sign in</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form action="attemptLogin.do" method="POST">
			<div class="form-group">
    			<label for="username">User Name:</label>
    			<input type="text" class="form-control" id="username" name="username" required aria-describedby="emailHelp" placeholder="Enter username">
			</div>
			<div class="form-group">
   				 <label for="password">Password:</label>
   				 <input type="password" class="form-control" id="password" name="password" required placeholder="Enter password">
 			 </div>
  			<button type="submit" class="btn btn-primary">Sign in</button>
		</form>
      </div>
      <div class="modal-footer">
        <div class="signup-section">
        	Not a member yet?
        	<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#registerModal">
  				Sign up
			</button>
		</div>
      </div>
    </div>
  </div>
</div>