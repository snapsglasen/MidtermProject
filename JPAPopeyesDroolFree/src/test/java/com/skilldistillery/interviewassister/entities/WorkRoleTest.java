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

class WorkRoleTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private WorkRole workRole;

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
		workRole = em.find(WorkRole.class, 1);
	}
	
	@AfterEach
	void tearDown() {
		em.close();
		workRole = null;
	}
	
	@Test
	void test_WorkRole_not_null() {
		assertNotNull(workRole);
	}

	@Test
	void test_WorkRole_many_to_many_() {
		assertTrue(workRole.getPosts().size() > 0);
	}
	
	@Test
	void test_WorkRole_one_to_many_User_mapping() {
		
		assertTrue(workRole.getUsers().size() > 0);
		
	}

}
