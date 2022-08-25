<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Container class for modal - Make sure to change the "id" and "aria-labelledby" properties -->
<div class="modal fade" id="updateProfileModal" tabindex="-1" aria-labelledby="updateProfileModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <!-- Modal header - Make sure to change the "id" property pf the "modal-title" div -->
      <div class="modal-header">
        <h5 class="modal-title" id="updateProfileModalLabel">Update Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- Modal body - Replace internal components with regular HTML/CSS -->
      <div class="modal-body">
      	<!-- BEGIN REPLACE COMPONENTS -->
      	<form action="updateProfileAttempt.do" method="GET">
      	
      	<input type="hidden" name="id" value=${account.id } />
      	
      		<div class="form-group">
				<label for="firstName">First Name:</label>
				<input class="form-control" type="text" id="firstName" name="firstName" value="${account.firstName }" />
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label>
				<input class="form-control" type="text" id="lastName" name="lastName" value="${account.lastName }" />
			</div>
			<div class="form-group">
				<label for="email">Email:</label>
				<input class="form-control" type="text" id="email" name="email" value="${account.email }" />
			</div>
			<div class="form-group">
				<label for="username">Username:</label>
				<input class="form-control" type="text" id="username" name="username" placeholder="${account.username }" />
			</div>
			<div class="form-group">
				<label for="password">Password:</label>
				<input class="form-control" type="password" id="password" name="password"/>
			</div>
			<div class="form-group">
				<label for="workRole">Work Role:</label>
				<input class="form-control" type="text" id="workRole" name="workRole" placeholder="${account.workRole.role }" />
			</div>
			<div class="form-group">
				<label for="company">Company:</label>
				<input class="form-control" type="text" id="company" name="company" placeholder="${account.company.name }" />
			</div>
			<div class="form-group">
				<label for="company">Profile picture URL:</label>
				<input class="form-control" type="text" id="profilePicture" name="profilePicture" placeholder="${account.profilePicture }" />
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
  				<button type="submit" class="btn btn-secondary">Update</button>
  			</div>
		</form>
		<!-- END REPLACE COMPONENTS -->
      </div>
      <!-- Modal footer - Can put buttons or little messages to the user here -->
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>