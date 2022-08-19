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

class OptionTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Option option;

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
		option = em.find(Option.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		option = null;
	}

	@Test
	void test_Option_not_null() {
		assertNotNull(option);
	}
	
	@Test
	void test_Option_mappings() {
		assertEquals("lambdas", option.getOptionText());
		
	}
	
	@Test
	void test_option_many_to_many_category_mapping() {
		assertEquals("", option.getQuestion().getQuestionText());
	}

}
