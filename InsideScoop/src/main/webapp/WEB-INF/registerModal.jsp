<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="registerModalLabel">Sign Up</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="registerAttempt.do" method="GET">
			<label for="">First Name:</label>
			<input class="form-control" type="text" name="firstName"
				required /> Last Name: <input class="form-control" type="text"
				name="lastName" required /> Email: <input class="form-control"
				type="text" name="email" required /> UserName: <input
				class="form-control" type="text" name="username" required />
			Password: <input class="form-control" type="password" name="password"
				required /> Category:
			<label for="category">Choose a category:</label> <select
				name="category">
				<option value="1">Student</option>
				<option value="2">Instructor</option>
				<option value="3">Alumni</option>
			</select> <input class="bttn btn-primary" type="submit" value="register" />
		</form>
      	<form action="attemptLogin.do" method="GET">
			<div class="form-group">
    			<label for="username">User Name:</label>
    			<input type="text" class="form-control" id="username" name="username" required aria-describedby="emailHelp" placeholder="Enter username">
			</div>
			<div class="form-group">
   				 <label for="password">Password</label>
   				 <input type="password" class="form-control" id="password" name="password" required placeholder="Enter password">
 			 </div>
  			<button type="submit" class="btn btn-primary">Login</button>
			</form>
      </div>
      <div class="modal-footer">
        <div class="signup-section">Not a member yet? <a href="register.do" class="text-info"> Sign Up</a></div>
      </div>
    </div>
  </div>
</div>