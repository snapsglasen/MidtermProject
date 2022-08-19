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

class TopicTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Topic topic;

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
		topic = em.find(Topic.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		topic = null;
	}

	@Test
	void test_Topic_not_null() {
		assertNotNull(topic);
	}
	
	@Test
	void test_Topic_mappings() {
		assertEquals("lambdas", topic.getName());
		
	}
	
	@Test
	void test_topic_many_to_many_category_mapping() {
		assertTrue(topic.getCategories().size() > 0);
	}

}
