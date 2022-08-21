package com.skilldistillery.interviewassister.data;

import java.util.List;

import com.skilldistillery.interviewassister.entities.Comment;
import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.User;

public interface UserDAO {
	
	User findById(int userId);
	List<Post> findNewestPost ();
	Post findByPostId(int postId);
	Comment findByCommentId(int commentId);
	Post createPost(Post post);
	User userLogin(String username, String password);
	User registerUser(String firstName, String lastName, String email, String username, String password, int category);
	Comment createComment(String content, User user, int id);
	Comment updateComment(int commentId, String content);
	void deleteComment(int commentId);
	void deletePost(int id);
	void deleteUser(int id);
	User updateProfile(int id, String firstName, String lastName, String email, String username, String password, int category);
	

}
