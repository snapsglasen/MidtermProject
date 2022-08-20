package com.skilldistillery.interviewassister.data;

import java.util.List;

import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.User;

public interface UserDAO {
	
	User findById(int userId);
	List<Post> findNewestPost ();
	Post findByPostId(int postId);
	Post createPost (Post post);
	User userLogin(String username, String password);
	User registerUser(String firstName, String lastName, String email, String username, String password);

}
