package com.skilldistillery.interviewassister.data;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	private Map<Integer, User> users;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public List<Post> findNewestPost() {
		
		String jpql = "Select p from Post p ORDER BY lastUpdate"; //come back to list a certain amount
		System.out.println(em.createQuery(jpql, Post.class).getResultList());
		
		List<Post> posts = em.createQuery(jpql, Post.class).getResultList();
		return posts;
	}

	@Override
	public Post findByPostId(int postId) {
		return em.find(Post.class, postId);
	}

	@Override
	public Post createPost(Post post) {
		em.persist(post);
		return post;
	}

	@Override
	public User userLogin(String username, String password) {
		String jpql = "SELECT u from User u where u.username = :username AND u.password = :password";
		User user = em.createQuery(jpql, User.class).setParameter("username", username).setParameter("password", password).getSingleResult();
		System.out.println(user);
		return user;
	}
	
//	 @Override
//	 public User userLogin(String username, String password) {
//	    User u = null;
//	    Set<Integer> keys = users.keySet();
//	    for (Integer key : keys) {
//	      User user = users.get(key);
//	      if(user.getUsername().equals(username) && user.getPassword().equals(password)) {
//	        u = user;
//	        break;
//	      }
//	    }
//	    return u;
//	  }
		
		

}
