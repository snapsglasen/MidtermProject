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
import com.skilldistillery.interviewassister.entities.Option;
import com.skilldistillery.interviewassister.entities.Question;
import com.skilldistillery.interviewassister.entities.User;

@Controller
public class OptionController {
	
	@Autowired
	private OptionDAO optionDAO;
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path="addOption.do", method=RequestMethod.POST)
	public String addOption(Integer questionId, Option option, Boolean popup, HttpSession session, Model login, Model model, Model total, Model correct, Model incorrect, Model likes, Model dislikes, Model popupModel) {
		option=optionDAO.createOption(option, questionId);
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		Question question = userDAO.findQuestionById(questionId);
		model.addAttribute("displayQuestion", question);
		List<Attempt> totalAt = optionDAO.usersTotalAttemptsOnQuestion(question, user);
		total.addAttribute("total", totalAt.size());
		List<Attempt> totalCor = optionDAO.userTotalCorrectAttemptsOnQuestion(question, user);
		correct.addAttribute("correct", totalCor.size());
		List<Attempt> totalInc = optionDAO.userTotalIncorrectQuestion(question, user);
		incorrect.addAttribute("incorrect", totalInc.size());
		likes.addAttribute("likes", userDAO.countLikes(question));
		dislikes.addAttribute("dislikes", userDAO.countDislikes(question));
		popupModel.addAttribute("popup", popup);
		return "question";
	}

}
