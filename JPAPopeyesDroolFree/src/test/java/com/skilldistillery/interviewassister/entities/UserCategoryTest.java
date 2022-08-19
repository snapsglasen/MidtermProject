package com.skilldistillery.interviewassister.entities;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserCategoryTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserCategory userCategory;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("InsideScoop");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		userCategory = em.find(UserCategory.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userCategory = null;
	}

	@Test
	void test_UserCategory_not_null() {
		assertNotNull(userCategory);
	}
	
	@Test
	void test_UserCategory_mappings() {
		assertTrue(userCategory.getUsers().size() > 0);
		
	}

}
