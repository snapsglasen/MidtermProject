<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="createPostModal" tabindex="-1" aria-labelledby="createPostModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createPostModalLabel">Sign Up</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form action="createPost.do" method="POST">
      	
      		<div class="form-group">
				<label for="title">Title:</label>
				<input type="text" class= "form-control" id="title"  name="title" required />
			</div>
			<div class="form-group">
				<label for="content">Content of post:</label>
				<input type="text" class= "form-control" id="content" name="content" required />
			</div>

			<div class="form-group">
  				<button type="submit" class="btn btn-secondary">Sign up</button>
  			</div>
		</form>
      </div>
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

<!-- 
		<div>
			Title <br/>
			Content of Post <input type="text" class= "form-control" name="content" /> <br /> 
			Does this post have to deal with any companies in particular? <br/>
			<input type="text" class= "form-control" name="company" /> <br /> 
			Does this post have to deal with any specific work role? <br/>
			<input type="text" class= "form-control" name="workRole" /> <br />
			Which category does this post fall into?
			<c:forEach var="p" items="${categories }">
			<input type="checkbox" id="category" value="${p.id}" name="category">
			<label for="category">${p.name }</label>
			</c:forEach>
		</div>

		<button type="submit" class="btn btn-primary">Add Post</button>
	</form>
	 -->