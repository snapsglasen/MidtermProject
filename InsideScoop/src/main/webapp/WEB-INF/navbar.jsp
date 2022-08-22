<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<div>
    <div class="nav"> <a href="index.do">Home</a>  </div>
    <div class="nav"> <a href="allUsers.do">Show Profiles</a>  </div>
    <div class="nav"> <a href="loggedInProfile.do">Profile</a>  </div>
    <div class="nav"> <a href="logout.do">Logout</a>  </div>
    
    <a href="loggedInProfile.do"><img class="topright" src="${loginCheck.profilePicture }" width="50" height="50"/></a>
</div>
