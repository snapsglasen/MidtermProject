package com.skilldistillery.interviewassister.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.interviewassister.data.UserDAO;
import com.skilldistillery.interviewassister.entities.Question;
import com.skilldistillery.interviewassister.entities.User;

@Controller
public class QuestionController {
	
	@Autowired
	private UserDAO userDAO;
	
//	@Autowired
//	private QuestionDAO questionDAO;
	
	@RequestMapping(path = "createQuestionPage.do")
	public String createQuestionPage(HttpSession session, Model login, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		model.addAttribute("categories", userDAO.findCategories());
		return "createQuestion";
	}

	@RequestMapping(path = "createQuestion.do", method = RequestMethod.POST)
	public String createQuestion(Model model, HttpSession session, Model login, Model cate, String questionText, Integer[] categories, String description) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		Question question= userDAO.createQuestion(questionText, categories, description, user);
		model.addAttribute("question", question);
		cate.addAttribute("categories", userDAO.findCategories());
		return "updateQuestion";
		
	}

	@RequestMapping(path = "deleteQuestion.do", method=RequestMethod.POST)
	public String deleteQuestion(int id) {
		userDAO.deleteQuestion(id);
		return "redirect:showQuestion.do";
	}
	
	@RequestMapping(path= "updateQuestion.do", method=RequestMethod.GET)
	public String goToQuestionUpdate(int questionId, Model model, Model login, Model cat, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		Question q=userDAO.findQuestionById(questionId);
		model.addAttribute("question", q);
		cat.addAttribute("categories", userDAO.findCategories());
		return "updateQuestion";
	}

	@RequestMapping(path = "updateQuestion.do", method=RequestMethod.POST)
	public String updatedQuestion(HttpSession session, Model model, int id, String questionText, String description, Integer[] categories, Model login) {
		Question question = userDAO.updateQuestion(id, questionText, description, categories);
		model.addAttribute("displayQuestion", question);
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		return "question";
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
	@RequestMapping(path= "randomQuestion.do")
	public String question(Model model, Model login, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		List<Question> questions=userDAO.findAllQuestions();
		int randomId= (int) (Math.random()*questions.size());
		model.addAttribute("displayQuestion", questions.get(randomId));
		return "question";
	}
	
	@RequestMapping(path="questionAndAnswer.do")
	public String questionAndAnswer(Model model, Model login, Model bool, HttpSession session, Integer[] option, int questionId) {
		User user = (User) session.getAttribute("loggedInUser");
		login.addAttribute("loginCheck", user);
		Question question = userDAO.findQuestionById(questionId);
		model.addAttribute("displayQuestion", question);
		bool.addAttribute("bool", userDAO.correct(option, question, user));
		return "questionAnswer";
	}
	
}
