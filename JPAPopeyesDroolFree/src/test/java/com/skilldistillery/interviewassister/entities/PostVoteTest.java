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

class PostVoteTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PostVote postVote;

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
		PostVoteId pid = new PostVoteId();
		pid.setUserId(1);
		pid.setPostId(1);
		postVote = em.find(PostVote.class, pid);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		postVote = null;
	}

	@Test
	void test_PostVote_not_null() {
		assertNotNull(postVote);
	}
	
	@Test
	void test_PostVote_mappings() {
		assertEquals(true, postVote.getLiked());
	}
	
//	@Test
//	void test_PostVote_Post_Relationship() {
//		assertNotNull(postVote.getPosts());
//		assertTrue(postVote.getPosts().size()>0);
//	}
	
}
