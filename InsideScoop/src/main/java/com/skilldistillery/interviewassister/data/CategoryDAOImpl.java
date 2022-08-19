package com.skilldistillery.interviewassister.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.interviewassister.entities.Category;

public class CategoryDAOImpl implements CategoryDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("InsideScoop");

	@Override
	public void create(Category category) {
		EntityManager em = emf.createEntityManager();
		
	}

	@Override
	public Category findById(int id) {
		return null;
	}

	@Override
	public void update(Category category) {

	}

	@Override
	public void delete(Category category) {

	}

}
