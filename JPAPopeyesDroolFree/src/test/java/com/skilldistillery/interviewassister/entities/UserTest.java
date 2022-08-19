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

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_not_null() {
		assertNotNull(user);
	}
	
	@Test
	void test_User_mappings() {
		assertEquals(user.getFirstName(), "Testy");
		assertEquals(user.getLastName(), "Testaburn");
	}
	
	@Test
	void test_User_Post_Relationship() {
		assertNotNull(user.getPosts());
		assertTrue(user.getPosts().size()>0);
	}
	
	@Test
	void test_User_WorkRole_Relationship() {
		assertNotNull(user.getWorkRole());
		assertEquals(1, user.getWorkRole().getId());
//		assertEquals("database administrator", user.getWorkRole().getRole);
	}
	
	@Test
	void test_User_Company_Relationship() {
		assertNotNull(user.getCompany());
		assertEquals(1, user.getCompany().getId());
//		assertEquals("google", user.getCompany().getName);
	}
	

}
