package com.skilldistillery.interviewassister.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.interviewassister.data.OptionDAO;
import com.skilldistillery.interviewassister.entities.Option;

@Controller
public class OptionController {
	
	@Autowired
	private OptionDAO optionDAO;
	
	@RequestMapping(path="addOption.do", method=RequestMethod.POST)
	public String addOption(Integer questionId, Option option) {
		option=optionDAO.createOption(option, questionId);
		return "redirect:updateQuestion.do?questionId="+questionId;
	}

}
