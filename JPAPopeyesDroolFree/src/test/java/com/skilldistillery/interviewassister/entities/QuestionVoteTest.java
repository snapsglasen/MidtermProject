package com.skilldistillery.interviewassister.entities;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class QuestionVoteTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private QuestionVote questionVote;

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
		QuestionVoteId pid = new QuestionVoteId();
		pid.setUserId(1);
		pid.setQuestionId(1);
		questionVote = em.find(QuestionVote.class, pid);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		questionVote = null;
	}

	@Test
	void test_QuestionVote_not_null() {
		assertNotNull(questionVote);
	}
	
	@Test
	void test_QuestionVote_mappings() {
		assertFalse(questionVote.getLiked());
	}
	
//	@Test
//	void test_QuestionVote_Post_Relationship() {
//		assertNotNull(questionVote.getPosts());
//		assertTrue(questionVote.getPosts().size()>0);
//	}
	
}
