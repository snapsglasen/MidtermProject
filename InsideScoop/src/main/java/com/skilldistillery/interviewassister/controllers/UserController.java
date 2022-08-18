package com.skilldistillery.interviewassister.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.interviewassister.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path= {"/","home.do","index.do"})
	public String home(Model model) {
		model.addAttribute("SmokeTest", userDAO.findById(1));//DELETE ME
		return "index";
	}
}
