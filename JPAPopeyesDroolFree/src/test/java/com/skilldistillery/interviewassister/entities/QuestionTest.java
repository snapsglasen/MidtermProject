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

class QuestionTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Question question;

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
		question = em.find(Question.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		question = null;
	}

	@Test
	void test_Comment_not_null() {
		assertNotNull(question);
	}
	
	@Test
	void test_Comment_mappings() {
		assertTrue(question.getQuestionVotes().size() > 0);
		
	}
	
	@Test
	void test_one_to_many_attempt_mapping() {
		assertTrue(question.getAttempts().size() > 0);
	}
	
	@Test
	void test_question_to_active() {
		assertTrue(question.getActive());
	}

}
