package com.skilldistillery.interviewassister.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.interviewassister.data.OptionDAO;
import com.skilldistillery.interviewassister.data.UserDAO;
import com.skilldistillery.interviewassister.entities.Attempt;
import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private OptionDAO optionDAO;

	@RequestMapping(path = { "/", "home.do", "index.do" })
	public String home(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("posts", userDAO.findNewestPost());
		return "index";
	}
	
	@RequestMapping(path = "postByRecent.do")
	public String postByRecent(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("posts", userDAO.findNewestPost());
		return "viewPosts";
	}

	@RequestMapping(path = { "postByTitle.do" })
	public String postByTitle(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("posts", userDAO.findAlphabeticalPost());
		return "viewPosts";
	}

	@RequestMapping(path = { "postByOldest.do" })
	public String postByOldest(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("posts", userDAO.findOldestPost());
		return "viewPosts";
	}

	@RequestMapping(path = "login.do")
	public String Login(Model model) {
		return "login";
	}

	@RequestMapping(path = "registerAttempt.do")
	public String registerAttempt(Model model, Model login, Model correct, Model userPosts, String firstName, String lastName, String username,
			String password, int category, HttpSession session) {
		try {
			User user = userDAO.registerUser(firstName, lastName, lastName, username, password, category);
			model.addAttribute("profile", user);
			session.setAttribute("loggedInUser", user);
			login.addAttribute("loginCheck", user);
			List<Attempt> totalCor= optionDAO.userTotalCorrectAttempts(user);
			correct.addAttribute("correct", totalCor.size());
			userPosts.addAttribute("displayPost", userDAO.postsFromUser(user));
		} catch (Exception e) {
			e.printStackTrace();
			return "register";
		}
		return "profile";
	}

	@RequestMapping(path = "register.do")
	public String Register(Model model) {
		return "register";
	}

	@RequestMapping(path = "account.do")
	public String accountInfo(Model model, Model login, Model total, Model correct, Model incorrect, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("account", user);
		List<Attempt> totalAt= optionDAO.usersTotalAttempts(user);
		total.addAttribute("total", totalAt.size());
		List<Attempt> totalCor= optionDAO.userTotalCorrectAttempts(user);
		correct.addAttribute("correct", totalCor.size());
		List<Attempt> totalInc= optionDAO.userTotalIncorrectAttempts(user);
		incorrect.addAttribute("incorrect", totalInc.size());
		return "accountInfo";
	}

	@RequestMapping(path = "adminAccount.do")
	public String accountInfo(Model model, Model login, Model total, Model correct, Model incorrect, HttpSession session, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		User profile=userDAO.findById(id);
		model.addAttribute("account", profile);
		List<Attempt> totalAt= optionDAO.usersTotalAttempts(profile);
		total.addAttribute("total", totalAt.size());
		List<Attempt> totalCor= optionDAO.userTotalCorrectAttempts(profile);
		correct.addAttribute("correct", totalCor.size());
		List<Attempt> totalInc= optionDAO.userTotalIncorrectAttempts(profile);
		incorrect.addAttribute("incorrect", totalInc.size());
		return "accountInfo";
	}

	@RequestMapping(path = "profile.do")
	public String profile(Model model, Model login, Model correct, Model userPosts, HttpSession session, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		User profile = userDAO.findById(id);
		model.addAttribute("profile", profile);
		List<Attempt> totalCor= optionDAO.userTotalCorrectAttempts(profile);
		correct.addAttribute("correct", totalCor.size());
		userPosts.addAttribute("displayPost", userDAO.postsFromUser(profile));
		return "profile";
	}

	@RequestMapping(path = "loggedInProfile.do")
	public String profile(Model model, Model login, Model correct, Model userPosts, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("profile", user);
		List<Attempt> totalCor= optionDAO.userTotalCorrectAttempts(user);
		correct.addAttribute("correct", totalCor.size());
		userPosts.addAttribute("displayPost", userDAO.postsFromUser(user));
		return "profile";
	}

	@RequestMapping(path = "showPost.do")
	public String post(Model model, Model login, Model like, Model dislike, HttpSession session, int postId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		Post post=userDAO.findByPostId(postId);
		model.addAttribute("displayPost", post);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		dislike.addAttribute("postDislikes", userDAO.countPostDislike(post));
		return "showPost";
	}

	@RequestMapping(path = "createPostPage.do")
	public String createPostPage(HttpSession session, Model login, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("categories", userDAO.findCategories());
		return "createPost";
	}

	@RequestMapping(path = "createPost.do", method = RequestMethod.POST)
	public String createPost(Model model, Model login, Model like, Model dislike, String title, String content, String company, String workRole,
			Integer[] category, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		Post post=userDAO.createPost(content, user, title, company, workRole, category);
		model.addAttribute("displayPost", post);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		dislike.addAttribute("postDislikes", userDAO.countPostDislike(post));
		return "showPost";

	}

	@RequestMapping(path = "createComment.do", method = RequestMethod.POST)
	public String createComment(Model model, Model login, Model like, Model dislike, String content, int id, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.createComment(content, user, id);
		Post post=userDAO.findByPostId(id);
		model.addAttribute("displayPost", post);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		dislike.addAttribute("postDislikes", userDAO.countPostDislike(post));
		return "showPost";
	}

	@RequestMapping(path = "attemptLogin.do")
	public String attemptLogin(String username, String password, Model model, Model login, HttpSession session) {
		try {
			User user = userDAO.userLogin(username, password);
			if (user.isActive()) {

				model.addAttribute("attemptLogin", user);
				session.setAttribute("loggedInUser", user);

				User loggedInUser = (User) session.getAttribute("loggedInUser");
				login.addAttribute("loginCheck", loggedInUser);
				model.addAttribute("posts", userDAO.findNewestPost());

				return "index";
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return "loginFailed";

	}

	@RequestMapping(path = "updateComment.do")
	public String updateComment(HttpSession session, Model model, Model comment, Model login, int id, int commentId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("displayPost", userDAO.findByPostId(id));
		comment.addAttribute("comment", userDAO.findByCommentId(commentId));
		return "commentUpdate";
	}

	@RequestMapping(path = "updateCommentAttempt.do")
	public String updatecomment(Model model, Model login, Model like, Model dislike, HttpSession session, int id, int commentId, String content) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.updateComment(commentId, content);
		Post post=userDAO.findByPostId(id);
		model.addAttribute("displayPost", post);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		dislike.addAttribute("postDisikes", userDAO.countPostDislike(post));
		return "showPost";
	}

	@RequestMapping(path = "deleteComment.do")
	public String deleteComment(Model model, Model login, Model like, Model dislike, HttpSession session, int id, int commentId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.deleteComment(commentId);
		Post post=userDAO.findByPostId(id);
		model.addAttribute("displayPost", post);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		dislike.addAttribute("postDislikes", userDAO.countPostDislike(post));
		return "showPost";
	}

	@RequestMapping(path = "deletePost.do")
	public String deletePost(Model model, Model login, HttpSession session, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.deletePost(id);
		return "index";
	}

	@RequestMapping(path = "deleteUser.do")
	public String deleteUser(Model model, Model login, HttpSession session, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user.getId() == id) {
			session.invalidate();
		} else {
			login.addAttribute("loginCheck", user);
		}
		userDAO.deleteUser(id);
		model.addAttribute("posts", userDAO.findNewestPost());
		return "index";
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("posts", userDAO.findNewestPost());
		return "index";
	}

	@RequestMapping(path = "updateProfile.do")
	public String updateProfile(HttpSession session, Model model, Model login, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("profile", userDAO.findById(id));
		return "updateProfile";

	}

	@RequestMapping(path = "updateProfileAttempt.do")
	public String updatedProfile(HttpSession session, Model model, Model login, Model correct,int id, String firstName,
			String lastName, String email, String username, String password, int category, String workRole,
			String company, String profilePicture) {
		User user = userDAO.updateProfile(id, firstName, lastName, email, username, password, category, workRole,
				company, profilePicture);
		model.addAttribute("profile", user);
		session.setAttribute("loggedInUser", user);
		login.addAttribute("loginCheck", user);
		List<Attempt> totalCor= optionDAO.userTotalCorrectAttempts(user);
		correct.addAttribute("correct", totalCor.size());
		return "profile";
	}

	@RequestMapping(path = "updatePost.do")
	public String updatePost(HttpSession session, Model model, Model login, Model cat, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("post", userDAO.findByPostId(id));
		cat.addAttribute("categories", userDAO.findCategories());
		return "updatePost";
	}

	@RequestMapping(path = "updatePostAttempt.do")
	public String updatedPost(HttpSession session, Model model, Model like, Model dislike, int id, String title, String content, String company,
			String workRole, Integer[] category, Model login) {
		Post post = userDAO.updatePost(id, title, content, company, workRole, category);
		model.addAttribute("displayPost", post);
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		dislike.addAttribute("postDislikes", userDAO.countPostDislike(post));
		return "showPost";
	}

	@RequestMapping(path = "allUsers.do")
	public String allUsers(HttpSession session, Model model, Model login) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("users", userDAO.findAllUsers());
		return "showAllUsers";
	}

	@RequestMapping(path = "searchUsers.do")
	public String searchUsers(HttpSession session, Model model, Model login, String search) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("users", userDAO.searchUsers(search));
		return "showAllUsers";
	}

	@RequestMapping(path = "searchPosts.do")
	public String searchPosts(HttpSession session, Model model, Model login, String search) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("posts", userDAO.searchPosts(search));
		return "viewPosts";
	}

	@RequestMapping(path = "upvotePost.do")
	public String upvotePost(HttpSession session, Model model, Model login, Model like, Model dislike, int userId, int postId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.addUpvotePost(userId, postId);
		Post post=userDAO.findByPostId(postId);
		model.addAttribute("displayPost", post);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		like.addAttribute("postDislikes", userDAO.countPostDislike(post));		
		return "showPost";
	}
	@RequestMapping(path = "deleteUpvotePost.do")
	public String deleteUpvotePost(HttpSession session, Model model, Model login, Model like, Model dislike, int userId, int postId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.deleteUpvotePost(userId, postId);
		Post post=userDAO.findByPostId(postId);
		model.addAttribute("displayPost", post);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		like.addAttribute("postDislikes", userDAO.countPostDislike(post));		
		return "showPost";
	}

	@RequestMapping(path = "upvoteComment.do")
	public String upvoteComment(HttpSession session, Model model, Model login, Model like, Model dislike, int userId, int commentId, int postId) {
		System.out.println("***********************In controller");
		System.out.println("***********************" + userId + "" + commentId);
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.addUpvoteComment(userId, commentId);
		Post post=userDAO.findByPostId(postId);
		model.addAttribute("displayPost", post);
		like.addAttribute("postLikes", userDAO.countPostLike(post));
		like.addAttribute("postDislikes", userDAO.countPostDislike(post));
		return "showPost";
	}
	
	@RequestMapping(path = "searchQuestions.do")
	public String searchQuestions(HttpSession session, Model model, Model login, String search) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("questions", userDAO.searchQuestions(search));
		return "showQuestion";

	}
}
