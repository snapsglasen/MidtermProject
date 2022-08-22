package com.skilldistillery.interviewassister.controllers;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.interviewassister.data.UserDAO;
import com.skilldistillery.interviewassister.entities.Category;
import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.Question;
import com.skilldistillery.interviewassister.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

//	@Autowired
//	private CategoryDAO categoryDAO;

	@RequestMapping(path = { "/", "home.do", "index.do" })
	public String home(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("posts", userDAO.findNewestPost());
		return "index";
	}

	@RequestMapping(path = { "postByTitle.do" })
	public String postByTitle(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("posts", userDAO.findAlphabeticalPost());
		return "index";
	}

	@RequestMapping(path = { "postByOldest.do" })
	public String postByOldest(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("posts", userDAO.findOldestPost());
		return "index";
	}

	@RequestMapping(path = "login.do")
	public String Login(Model model) {
		return "login";
	}

	@RequestMapping(path = "registerAttempt.do")
	public String registerAttempt(Model model, Model login, String firstName, String lastName, String username,
			String password, int category, HttpSession session) {
		try {
			User user = userDAO.registerUser(firstName, lastName, lastName, username, password, category);
			model.addAttribute("profile", user);
			session.setAttribute("loggedInUser", user);
			login.addAttribute("loginCheck", user);
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
	public String accountInfo(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("account", user);
		return "accountInfo";
	}

	@RequestMapping(path = "adminAccount.do")
	public String accountInfo(Model model, Model login, HttpSession session, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("account", userDAO.findById(id));
		return "accountInfo";
	}

	@RequestMapping(path = "profile.do")
	public String profile(Model model, Model login, HttpSession session, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		User profile = userDAO.findById(id);
		model.addAttribute("profile", profile);
		return "profile";
	}

	@RequestMapping(path = "loggedInProfile.do")
	public String profile(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("profile", user);
		return "profile";
	}

	@RequestMapping(path = "showPost.do")
	public String post(Model model, Model login, HttpSession session, int postId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("displayPost", userDAO.findByPostId(postId));
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
	public String createPost(Model model, Model login, String title, String content, String company, String workRole,
			Integer[] category, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("displayPost", userDAO.createPost(content, user, title, company, workRole, category));
		return "showPost";

	}

	@RequestMapping(path = "createComment.do", method = RequestMethod.POST)
	public String createComment(Model model, Model login, String content, int id, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.createComment(content, user, id);
		model.addAttribute("displayPost", userDAO.findByPostId(id));
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
	public String updatecomment(Model model, Model login, HttpSession session, int id, int commentId, String content) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.updateComment(commentId, content);
		model.addAttribute("displayPost", userDAO.findByPostId(id));
		return "showPost";
	}

	@RequestMapping(path = "deleteComment.do")
	public String deleteComment(Model model, Model login, HttpSession session, int id, int commentId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.deleteComment(commentId);
		model.addAttribute("displayPost", userDAO.findByPostId(id));
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
	public String updatedProfile(HttpSession session, Model model, Model login, int id, String firstName,
			String lastName, String email, String username, String password, int category, String workRole,
			String company, String profilePicture) {
		User user = userDAO.updateProfile(id, firstName, lastName, email, username, password, category, workRole,
				company, profilePicture);
		model.addAttribute("profile", user);
		session.setAttribute("loggedInUser", user);
		login.addAttribute("loginCheck", user);
		return "profile";
	}

	@RequestMapping(path = "updatePost.do")
	public String updatePost(HttpSession session, Model model, Model login, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("post", userDAO.findByPostId(id));
		return "updatePost";
	}

	@RequestMapping(path = "updatePostAttempt.do")
	public String updatedPost(HttpSession session, Model model, int id, String title, String content, String company,
			String workRole, Integer[] category, Model login) {
		Post post = userDAO.updatePost(id, title, content, company, workRole, category);
		model.addAttribute("displayPost", post);
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
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
		return "index";
	}

	@RequestMapping(path = "upvotePost.do")
	public String upvotePost(HttpSession session, Model model, Model login, int userId, int postId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.addUpvotePost(userId, postId);
		model.addAttribute("displayPost", userDAO.findByPostId(postId));
		return "showPost";
	}

	@RequestMapping(path = "upvoteComment.do")
	public String upvoteComment(HttpSession session, Model model, Model login, int userId, int commentId, int postId) {
		System.out.println("***********************In controller");
		System.out.println("***********************" + userId + "" + commentId);
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.addUpvoteComment(userId, commentId);
		model.addAttribute("displayPost", userDAO.findByPostId(postId));
		return "showPost";
	}

	@RequestMapping(path = "createQuestionPage.do")
	public String createQuestionPage(HttpSession session, Model login, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("categories", userDAO.findCategories());
		return "createQuestion";
	}

	@RequestMapping(path = "createQuestion.do", method = RequestMethod.POST)
	public String createQuestion(Model model, HttpSession session, Model login, String questionText) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("displayQuestion", userDAO.createQuestion(questionText));
		return "showQuestion";

	}

	

	@RequestMapping(path = "deleteQuestion.do")
	public String deleteQuestion(Model model, Model login, HttpSession session, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		userDAO.deleteQuestion(id);
		return "index";
	}

	
	@RequestMapping(path = "updateQuestion.do")
	public String updateQuestion(HttpSession session, Model model, Model login, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("post", userDAO.findByPostId(id));
		return "updatePost";
	}

	@RequestMapping(path = "updateQuestionAttempt.do")
	public String updatedQuestion(HttpSession session, Model model, int id, String questionText, Model login) {
		Question question = userDAO.updateQuestion(id, questionText);
		model.addAttribute("displayQuestion", question);
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		return "showQuestion";
	}

	@RequestMapping(path = "showQuestion.do")
	public String displayQuestion(Model model, Model display, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("displayQuestion", userDAO.findQuestionById(1));
		display.addAttribute("questions", userDAO.findAllQuestions());
		return "showQuestion";
	}
	
	@RequestMapping(path= "question.do")
	public String question(Model model, Model login, HttpSession session, int id) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("displayQuestion", userDAO.findQuestionById(id));
		return "question";
	}
	
	@RequestMapping(path="questionAndAnswer")
	public String questionAndAnswer(Model model, Model login, HttpSession session, Integer[] id, int questionId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		Question question = userDAO.findQuestionById(questionId);
		model.addAttribute("displayQuestion", question);
		
		return "question";
		
		
	}
}
