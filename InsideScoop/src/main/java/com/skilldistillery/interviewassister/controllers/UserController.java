package com.skilldistillery.interviewassister.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.interviewassister.data.UserDAO;
import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

//	@Autowired
//	private CategoryDAO categoryDAO;

	@RequestMapping(path = { "/", "home.do", "index.do" })
	public String home(Model model) {
		// method to find List<Post> posts
		model.addAttribute("posts", userDAO.findNewestPost());// Change to List<Post> posts
		return "index";
	}

	@RequestMapping(path = "login.do")
	public String Login(Model model) {
		return "login";
	}

	@RequestMapping(path = "register.do")
	public String Register(Model model) {
		return "register";
	}

	@RequestMapping(path = "account.do")
	public String accountInfo(Model model) {
		// method to find user posts
		model.addAttribute("account", userDAO.findById(1));
		return "accountInfo";
	}

	@RequestMapping(path = "profile.do")
	public String profile(Model model) {
		// method to find user posts
		model.addAttribute("profile", userDAO.findById(1));
		return "profile";
	}

	@RequestMapping(path = "showPost.do")
	public String post(Model model, int postId) {
		model.addAttribute("displayPost", userDAO.findByPostId(postId));
		return "showPost";
	}

	@RequestMapping(path = "createPostPage.do")
	public String Login() {
		return "createPost";
	}

	@RequestMapping(path = "createPost.do", method = RequestMethod.POST)
	public String createPost(Model model, String title, String content, HttpSession session) {
		User user=(User) session.getAttribute("loggedInUser");
		Post post = new Post(content, user, title);
		model.addAttribute("displayPost", userDAO.createPost(post));
		return "postAdded";

	}

	@RequestMapping(path = "attemptLogin.do")
	public String attemptLogin(String username, String password, Model model, HttpSession session) {
		try {
			User user = userDAO.userLogin(username, password);
			model.addAttribute("attemptLogin", user);
			session.setAttribute("loggedInUser", user);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			return "loginFailed";
		}

	}

}
