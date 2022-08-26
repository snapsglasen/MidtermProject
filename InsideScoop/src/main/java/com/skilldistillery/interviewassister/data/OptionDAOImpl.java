package com.skilldistillery.interviewassister.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.interviewassister.entities.Attempt;
import com.skilldistillery.interviewassister.entities.Option;
import com.skilldistillery.interviewassister.entities.Question;
import com.skilldistillery.interviewassister.entities.User;

@Service
@Transactional
public class OptionDAOImpl implements OptionDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Option createOption(Option option, int questionId) {
		Question q=em.find(Question.class, questionId);
		if(q!=null) {
			option.setQuestion(q);
			em.persist(option);
			return option;
		}
		return null;
	}

	@Override
	public Option updateOption(int optionId, Option option) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteOption(int optionId) {
		Option option=em.find(Option.class, optionId);
		
		try {
			em.remove(option);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<Attempt> totalAttemptsOnQuestion(Question question) {
		String jpql = "Select a from Attempt a WHERE a.question=:question";
		List<Attempt> attempts = em.createQuery(jpql, Attempt.class).setParameter("question", question).getResultList();
		return attempts;
	}

	@Override
	public List<Attempt> totalCorrectAttemptsOnQuestion(Question question) {
		String jpql = "Select a from Attempt a WHERE a.question= :question AND a.correct=true";
		List<Attempt> attempts = em.createQuery(jpql, Attempt.class).setParameter("question", question).getResultList();
		return attempts;
	}
	
	@Override
	public List<Attempt> usersTotalAttemptsOnQuestion(Question question, User user) {
		String jpql = "Select a from Attempt a WHERE a.question=:question AND a.user=:user";
		List<Attempt> attempts = em.createQuery(jpql, Attempt.class).setParameter("question", question).setParameter("user", user).getResultList();
		return attempts;
	}
	@Override
	public List<Attempt> userTotalCorrectAttemptsOnQuestion(Question question, User user) {
		String jpql = "Select a from Attempt a WHERE a.question= :question AND a.user=:user AND a.correct=true";
		List<Attempt> attempts = em.createQuery(jpql, Attempt.class).setParameter("question", question).setParameter("user", user).getResultList();
		return attempts;
	}
	@Override
	public List<Attempt> userTotalIncorrectQuestion(Question question, User user) {
		String jpql = "Select a from Attempt a WHERE a.question= :question AND a.user=:user AND a.correct=false";
		List<Attempt> attempts = em.createQuery(jpql, Attempt.class).setParameter("question", question).setParameter("user", user).getResultList();
		return attempts;
	}
	
	@Override
	public List<Attempt> usersTotalAttempts(User user) {
		String jpql = "Select a from Attempt a WHERE a.user=:user";
		List<Attempt> attempts = em.createQuery(jpql, Attempt.class).setParameter("user", user).getResultList();
		return attempts;
	}
	@Override
	public List<Attempt> userTotalCorrectAttempts(User user) {
		String jpql = "Select a from Attempt a WHERE a.user=:user AND a.correct=true";
		List<Attempt> attempts = em.createQuery(jpql, Attempt.class).setParameter("user", user).getResultList();
		return attempts;
	}
	@Override
	public List<Attempt> userTotalIncorrectAttempts(User user) {
		String jpql = "Select a from Attempt a WHERE a.user=:user AND a.correct=false";
		List<Attempt> attempts = em.createQuery(jpql, Attempt.class).setParameter("user", user).getResultList();
		return attempts;
	}
	

}
