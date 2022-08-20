<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Post</title>
</head>
<body>


	<form action="createPost.do" method="POST">
		<div>
			Title <input type="text"class= "form-control" name="title" /><br/>
			Content of Post <input type="text" class= "form-control" name="content" /> <br /> 
		</div>

		<button type="submit" class="btn btn-primary">Add Post</button>
	</form>
</body>
</html>