<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="index.do">
		<img src="/img/ice-cream.png" class="d-inline-block align-center" width="40" height="40" alt="smiling ice cream cone"/>
		Inside Scoop
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<li class="nav-item">
				<a class="nav-link" href="allUsers.do">User Profiles</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="showQuestion.do">Questions</a>
			</li>
		</ul>
		<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
			<li class="nav-item">
				<a class="nav-link" href="logout.do">Logout</a>
			</li>
			<li>
			<a class="navbar-brand" href="loggedInProfile.do">
				<img class="rounded-circle" src="${loginCheck.profilePicture }" width="40" height="40" alt="profile picture"/>
				
			</a>
			</li>
		</ul>
	</div>
</nav>
	<!--
<section class="navleft">
	<ul>
		<li class="item-left"> <a href="index.do">Home</a></li>
   		<li class="item-left"> <a href="allUsers.do">Show Profiles</a></li>
    	<li class="item-left"> <a href="showQuestion.do">Questions</a></li>
    </ul>
</section>
<section class="navright">
	<ul>
    	<li class="item-right"> <a href="logout.do">Logout</a></li>
    	<li class="item-right"> <a href="loggedInProfile.do">Profile</a></li>
    	<li> <a href="loggedInProfile.do"><img class="topright" src="${loginCheck.profilePicture }" width="50" height="50"/></a></li>
	</ul>
</section>
-->
