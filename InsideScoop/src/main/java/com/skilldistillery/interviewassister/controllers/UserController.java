package com.skilldistillery.interviewassister.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.interviewassister.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
}
