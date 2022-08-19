package com.skilldistillery.interviewassister.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
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

class CommentVoteTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private CommentVote commentVote;

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
		CommentVoteId pid = new CommentVoteId();
		pid.setUserId(1);
		pid.setCommentId(1);
		commentVote = em.find(CommentVote.class, pid);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		commentVote = null;
	}

	@Test
	void test_CommentVote_not_null() {
		assertNotNull(commentVote);
	}
	
	@Test
	void test_CommentVote_mappings() {
		assertEquals(true, commentVote.getLiked());
	}
	
//	@Test
//	void test_CommentVote_Post_Relationship() {
//		assertNotNull(commentVote.getPosts());
//		assertTrue(commentVote.getPosts().size()>0);
//	}
	
}
