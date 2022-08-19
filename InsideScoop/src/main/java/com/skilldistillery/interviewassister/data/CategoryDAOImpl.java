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
		em.getTransaction().begin();
		em.persist(category);
		em.flush();
		em.getTransaction().commit();
		em.close();
	}

	@Override
	public Category findById(int id) {
		EntityManager em = emf.createEntityManager();
		Category category = em.find(Category.class, id);
		em.close();
		return category;
	}

	@Override
	public void update(int id, Category category) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Category categoryToUpdate = em.find(Category.class, id);
		categoryToUpdate.setDescription(category.getDescription());
		categoryToUpdate.setName(category.getName());
		categoryToUpdate.setTopics(category.getTopics());
		em.getTransaction().commit();
		em.close();
	}
//SORRY JOE! Just wanted the red X's to go away. continue...
//	@Override
//	public void delete(Category category) {
//
//	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

}
