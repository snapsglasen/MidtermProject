package com.skilldistillery.interviewassister.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.interviewassister.data.CategoryDAO;
import com.skilldistillery.interviewassister.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
//	@Autowired
//	private CategoryDAO categoryDAO;
	
	
	
	@RequestMapping(path= {"/","home.do","index.do"})
	public String home(Model model) {
		//method to find List<Post> posts
		model.addAttribute("posts", userDAO.findNewestPost());//Change to List<Post> posts
		return "index";
	}
	
	@RequestMapping(path= "login.do")
	public String Login(Model model) {
		return "login";
	}
	
	@RequestMapping(path= "register.do")
	public String Register(Model model) {
		return "register";
	}
	
	@RequestMapping(path= "account.do")
	public String accountInfo(Model model) {
		//method to find user posts
		model.addAttribute("account", userDAO.findById(1));
		return "accountInfo";
	}
	
	@RequestMapping(path= "profile.do")
	public String profile(Model model) {
		//method to find user posts
		model.addAttribute("profile", userDAO.findById(1));
		return "profile";
	}
}
