<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inside Scoop</title>
<jsp:include page="bootstrapHead.jsp" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<jsp:include page="updatePostModal.jsp"/>
<jsp:include page="deleteVerifyPostModal.jsp"/>
<jsp:include page="universalNavbar.jsp"/>

	<main class="container-fluid">
<c:if test="${displayPost.active }">
	<div class="row-main">
	<div class="col-main">
	
		<h1>${displayPost.title }</h1>
	</div>
	</div>

	<div class="row-main">
	<div class="col-main">
	<div class="div-content">

<a href="profile.do?id=${displayPost.user.id }">${displayPost.user.firstName} ${displayPost.user.lastName }</a>

<br/>
${displayPost.createDate}
${displayPost.lastUpdate}
<br/>
${displayPost.content}
<br/>
<br/>
Companies:
<c:forEach var="p" items="${displayPost.companies }">
${p.name }
</c:forEach>
<br/>

Work Roles:
<c:forEach var="p" items="${displayPost.workRoles }">
${p.role }
</c:forEach>
<br/>

Categories:
<c:forEach var="p" items="${displayPost.categories}">
${p.name }
</c:forEach>
<br/>

	<c:if test="${not empty loginCheck}">
		<div class="form-group row">
			<form action="upvotePost.do">
				<input type="hidden" name="userId" value=${loginCheck.id } /> <input
					type="hidden" name="postId" value=${displayPost.id } />
				<button type="submit" class="btn btn-primary"><img alt="Likes" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5IvDeqblUvYW7p51bBuCQciah3vxviSD4BA&usqp=CAU" width="50" height= "50"></button>
			Likes: ${postLikes }
			</form>
			<br/>
			<form action="deleteUpvotePost.do">
				<input type="hidden" name="userId" value=${loginCheck.id } /> <input
					type="hidden" name="postId" value=${displayPost.id } />
				<button type="submit" class="btn btn-primary"><img alt="Dislikes" src="https://img.freepik.com/free-photo/melted-red-ice-cream_23-2147831853.jpg?w=2000" width="50" height= "50"></button>
			Dislikes: ${postDislikes }
			</form>
			
		</div>
		</c:if>
		</div>
		</div>
		</div>
		
<c:if test="${loginCheck==displayPost.user || loginCheck.admin }">

<div class="row-main">
	<div class="col-main">
<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updatePostModal">
  		Update
	</button>
<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteVerifyPostModal">
  		Delete
	</button>
	</div>
	</div>
</c:if>

<c:if test="${not empty loginCheck }">

<form action="createComment.do" method="POST">

			<div class="div-content">Comment:</div>
			<input class= "form-control" type="text" name="content" /> <br />
			<input type="hidden" name="id" value=${displayPost.id } /> <br />
		<button type="submit" class="btn btn-primary">Add comment</button>
	</form>
</c:if>
<c:forEach var="p" items="${displayPost.comments}">
<c:if test="${p.active}">
<br/>
<div class="div-content">
<br/>
<a href="profile.do?id=${p.user.id }">${p.user.firstName} ${p.user.lastName }</a>
<br/>
${p.lastUpdated }
<br/>
${p.content }
<c:if test="${not empty loginCheck}">
<div class="form-group row">
<form action="upvoteComment.do">
			<input type="hidden" name="userId" value=${loginCheck.id } /> 
			<input type="hidden" name="commentId" value=${p.id } /> 
			<input type="hidden" name="postId" value=${displayPost.id } /> 
				<button type="submit" class="btn btn-primary"><img alt="Likes" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5IvDeqblUvYW7p51bBuCQciah3vxviSD4BA&usqp=CAU" width="50" height= "50"></button>
			Likes: ${p.likes }
	</form>
<form action="downvoteComment.do">
			<input type="hidden" name="userId" value=${loginCheck.id } /> 
			<input type="hidden" name="commentId" value=${p.id } /> 
			<input type="hidden" name="postId" value=${displayPost.id } /> 
				<button type="submit" class="btn btn-primary"><img alt="Dislikes" src="https://img.freepik.com/free-photo/melted-red-ice-cream_23-2147831853.jpg?w=2000" width="50" height= "50"></button>
	Dislikes: ${p.dislikes}
	
	</form>
	</div>
</c:if>
<br/>
</div>
	<c:if test="${loginCheck==p.user ||loginCheck.admin }">
	
<form action="updateComment.do" method="POST">
			<input type="hidden" name="id" value=${displayPost.id } />
			<input type="hidden" name="commentId" value=${p.id } /> 
		<button type="submit" class="btn btn-primary">Update</button>
	</form>
	
<form action="deleteComment.do" method="POST">
			<input type="hidden" name="id" value=${displayPost.id } /> <br />
			<input type="hidden" name="commentId" value=${p.id } /> 
		<button type="submit" class="btn btn-primary">Delete</button>
	</form>
</c:if>
<br/>
</c:if>
</c:forEach>

</c:if>
</main>

		<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>