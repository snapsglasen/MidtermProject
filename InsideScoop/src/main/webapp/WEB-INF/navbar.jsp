<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="navbar">
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
    	<!-- <li> <a href="loggedInProfile.do"><img class="topright" src="${loginCheck.profilePicture }" width="50" height="50"/></a></li> -->
	</ul>
</section>
</div>
	
