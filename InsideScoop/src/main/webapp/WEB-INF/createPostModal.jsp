<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="createPostModal" tabindex="-1" aria-labelledby="createPostModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createPostModalLabel">Create Post</h5>
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
				<label for="company">Does this relate to a company?:</label>
				<input type="text" class= "form-control" id="company" name="company" />
			</div>
			<div class="form-group">
				<label for="workRole">Does this relate to a work role?:</label>
				<input type="text" class= "form-control" id="workRole" name="workRole" />
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
        <div class="signup-section">Already a member?
        	<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#loginModal">
  				Sign in
			</button>
		</div>
      </div>
    </div>
  </div>
</div>
			

	 