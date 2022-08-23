package com.skilldistillery.interviewassister.data;

import java.util.List;

import com.skilldistillery.interviewassister.entities.Attempt;
import com.skilldistillery.interviewassister.entities.Option;
import com.skilldistillery.interviewassister.entities.Question;
import com.skilldistillery.interviewassister.entities.User;

public interface OptionDAO {

	Option createOption(Option option, int questionId);
	Option updateOption(int optionId, Option option);
	boolean deleteOption(int optionId);
	List<Attempt> totalAttemptsOnQuestion(Question question);
	List<Attempt> totalCorrectAttemptsOnQuestion(Question question);
	List<Attempt> usersTotalAttemptsOnQuestion(Question question, User user);
	List<Attempt> userTotalCorrectAttemptsOnQuestion(Question question, User user);
	List<Attempt> userTotalIncorrectQuestion(Question question, User user);
	List<Attempt> usersTotalAttempts(User user);
	List<Attempt> userTotalCorrectAttempts(User user);
	List<Attempt> userTotalIncorrectAttempts(User user);
}
