package com.skilldistillery.interviewassister.data;

import java.util.List;
import java.util.Set;

import com.skilldistillery.interviewassister.entities.Comment;
import com.skilldistillery.interviewassister.entities.Company;
import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.User;
import com.skilldistillery.interviewassister.entities.WorkRole;

public interface UserDAO {
	
	User findById(int userId);
	List<Post> findAlphabeticalPost();
	List<Post> findNewestPost ();
	List<Post> findOldestPost();
	List<User> findAllUsers();
	Post findByPostId(int postId);
	Comment findByCommentId(int commentId);
	Post createPost(String content, User user, String title, String company);
	User userLogin(String username, String password);
	User registerUser(String firstName, String lastName, String email, String username, String password, int category);
	Comment createComment(String content, User user, int id);
	Comment updateComment(int commentId, String content);
	void deleteComment(int commentId);
	void deletePost(int id);
	void deleteUser(int id);
	User updateProfile(int id, String firstName, String lastName, String email, String username, String password, int category, String workRole, String company, String profilePicture);
	Post updatePost(int id, String title, String content);
	Set<User> searchUsers(String search);
	Set<Post> searchPosts(String search);
	WorkRole workRoleByString(String workRole);
	Company companyByString(String company);
	void addUpvotePost(int userId, int postId);
	void addUpvoteComment(int userId, int commentId);

}
