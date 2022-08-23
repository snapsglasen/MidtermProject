package com.skilldistillery.interviewassister.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.interviewassister.entities.Option;
import com.skilldistillery.interviewassister.entities.Question;

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
		// TODO Auto-generated method stub
		return false;
	}

}
