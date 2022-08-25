<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
  	  $("#registerModal").on('shown.bs.modal', function(){
  	      $(this).find('#firstName').focus();
  	  });
	});
</script>

<!-- Container class for modal - Make sure to change the "id" and "aria-labelledby" properties -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <!-- Modal header - Make sure to change the "id" property pf the "modal-title" div -->
      <div class="modal-header">
        <h5 class="modal-title" id="registerModalLabel">Sign Up</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- Modal body - Replace internal components with regular HTML/CSS -->
      <div class="modal-body">
      	<!-- BEGIN REPLACE COMPONENTS -->
      	<form action="registerAttempt.do" method="GET">
      		<div class="form-group">
				<label for="firstName">First Name:</label>
				<input class="form-control" type="text" id="firstName" name="firstName" required />
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label>
				<input class="form-control" type="text" id="lastName" name="lastName" required />
			</div>
			<div class="form-group">
				<label for="email">Email:</label>
				<input class="form-control" type="text" id="email" name="email" required />
			</div>
			<div class="form-group">
				<label for="username">Username:</label>
				<input class="form-control" type="text" id="username" name="username" required />
			</div>
			<div class="form-group">
				<label for="password">Password:</label>
				<input class="form-control" type="password" id="password" name="password" required />
			</div>
			<div class="form-group">
				<label for="category">Account type:</label>
				<select name="category">
					<option value="1">Student</option>
					<option value="2">Instructor</option>
					<option value="3">Alumnus</option>
				</select>
			</div>
			<div class="form-group">
  				<button type="submit" class="btn btn-secondary">Sign up</button>
  			</div>
		</form>
		<!-- END REPLACE COMPONENTS -->
      </div>
      <!-- Modal footer - Can put buttons or little messages to the user here -->
      <div class="modal-footer">
        <div class="signup-section">Already a member?
        	<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#loginModal">
  				Sign in
			</button>
		</div>
      </div>
    </div>
  </div>
</div>