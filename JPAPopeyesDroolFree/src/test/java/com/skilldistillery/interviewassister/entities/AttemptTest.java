package com.skilldistillery.interviewassister.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AttemptTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Attempt attempt;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("InsideScoop");
	}
	
	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}
	
	@BeforeEach
	void setUp() {
		em = emf.createEntityManager();
		attempt = em.find(Attempt.class, 1);
	}
	
	@AfterEach
	void tearDown() {
		em.close();
		attempt = null;
	}
	
	@Test
	void test_Attempt_not_null() {
		assertNotNull(attempt);
	}

	@Test
	void test_Attempt_many_to_one_User_mapping() {
		assertEquals("testy@testaburn.com", attempt.getUser().getEmail());
	}
	
	@Test
	void test_Attempt_many_to_one_Question_mapping() {
		assertEquals("Why is a mouse when it spins?", attempt.getQuestion().getQuestionText());
	}

}
