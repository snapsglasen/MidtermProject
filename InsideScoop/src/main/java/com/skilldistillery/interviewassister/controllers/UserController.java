package com.skilldistillery.interviewassister.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.interviewassister.data.UserDAO;
import com.skilldistillery.interviewassister.entities.Comment;
import com.skilldistillery.interviewassister.entities.Post;
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

	@RequestMapping(path = "login.do")
	public String Login(Model model) {
		return "login";
	}

	@RequestMapping(path = "registerAttempt.do")
	public String registerAttempt(Model model, String firstName, String lastName, String username, String password,
			int category, HttpSession session) {
		try {
			User user = userDAO.registerUser(firstName, lastName, lastName, username, password, category);
			model.addAttribute("profile", user);
			session.setAttribute("loggedInUser", user);
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
	public String accountInfo(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		model.addAttribute("account", user);
		return "accountInfo";
	}

	@RequestMapping(path = "profile.do")
	public String profile(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
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
	public String createPostPage() {
		return "createPost";
	}

	@RequestMapping(path = "createPost.do", method = RequestMethod.POST)
	public String createPost(Model model, String title, String content, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		Post post = new Post(content, user, title);
		model.addAttribute("displayPost", userDAO.createPost(post));
		return "postAdded";

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
	public String attemptLogin(String username, String password, Model model, HttpSession session) {
		try {
			User user = userDAO.userLogin(username, password);
			if (user.isActive()) {

				model.addAttribute("attemptLogin", user);
				session.setAttribute("loggedInUser", user);
				return "index";
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return "loginFailed";

	}

	@RequestMapping(path = "updateComment.do")
	public String updateComment(Model model, Model comment, int id, int commentId) {

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
		session.invalidate();
		userDAO.deleteUser(id);
		return "index";
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@RequestMapping(path = "updateProfile.do")
	public String updateProfile(HttpSession session, Model model, int id) {
		model.addAttribute("profile", userDAO.findById(id));
		return "updateProfile";

	}

	@RequestMapping(path = "updateProfileAttempt.do")
	public String updatedProfile(HttpSession session, Model model, int id, String firstName, String lastName,
			String email, String username, String password, int category) {
		User user = userDAO.updateProfile(id, firstName, lastName, email, username, password, category);
		model.addAttribute("profile", user);
		session.setAttribute("loggedInUser", user);
		return "profile";
	}

	@RequestMapping(path = "updatePost.do")
	public String updatePost(HttpSession session, Model model, int id) {
		model.addAttribute("post", userDAO.findByPostId(id));
		return "updatePost";
	}

	@RequestMapping(path = "updatePostAttempt.do")
	public String updatedPost(HttpSession session, Model model, int id, String title, String content, Model login) {
		Post post = userDAO.updatePost(id, title, content);
		model.addAttribute("displayPost", post);
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		return "showPost";

	}

}
