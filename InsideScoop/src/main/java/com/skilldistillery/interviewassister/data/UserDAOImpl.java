package com.skilldistillery.interviewassister.data;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.interviewassister.entities.Category;
import com.skilldistillery.interviewassister.entities.Comment;
import com.skilldistillery.interviewassister.entities.CommentVote;
import com.skilldistillery.interviewassister.entities.CommentVoteId;
import com.skilldistillery.interviewassister.entities.Company;
import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.PostVote;
import com.skilldistillery.interviewassister.entities.PostVoteId;
import com.skilldistillery.interviewassister.entities.Question;
import com.skilldistillery.interviewassister.entities.User;
import com.skilldistillery.interviewassister.entities.UserCategory;
import com.skilldistillery.interviewassister.entities.WorkRole;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	@PersistenceContext
	private EntityManager em;
	private Map<Integer, User> users;

	// ALL SEARCH METHODS

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public Post findByPostId(int postId) {
		return em.find(Post.class, postId);
	}

	@Override
	public Comment findByCommentId(int commentId) {
		return em.find(Comment.class, commentId);
	}

	@Override
	public List<Post> findNewestPost() {
		String jpql = "Select p from Post p ORDER BY lastUpdate DESC";
		System.out.println(em.createQuery(jpql, Post.class).getResultList());
		List<Post> posts = em.createQuery(jpql, Post.class).getResultList();
		return posts;
	}

	@Override
	public List<Category> findCategories() {
		String jpql = "Select c from Category c";
		List<Category> categories = em.createQuery(jpql, Category.class).getResultList();
		return categories;
	}

	@Override
	public List<Post> findOldestPost() {

		String jpql = "Select p from Post p ORDER BY lastUpdate";
		System.out.println(em.createQuery(jpql, Post.class).getResultList());
		List<Post> posts = em.createQuery(jpql, Post.class).getResultList();
		return posts;
	}

	@Override
	public List<Post> findAlphabeticalPost() {
		String jpql = "Select p from Post p ORDER BY title";
		System.out.println(em.createQuery(jpql, Post.class).getResultList());
		List<Post> posts = em.createQuery(jpql, Post.class).getResultList();
		return posts;
	}

	@Override
	public List<User> findAllUsers() {
		String jpql = "Select u from User u ORDER BY firstName";
		List<User> users = em.createQuery(jpql, User.class).getResultList();
		return users;
	}

	@Override
	public User userLogin(String username, String password) {
		String jpql = "SELECT u from User u where u.username = :username AND u.password = :password";
		User user = em.createQuery(jpql, User.class).setParameter("username", username)
				.setParameter("password", password).getSingleResult();
		System.out.println(user);
		return user;
	}

	@Override
	public Set<User> searchUsers(String search) {
		Set<User> users = new HashSet<User>();
		String[] searches = search.split(" ");
		for (String splitSearch : searches) {
			splitSearch = "%" + splitSearch + "%";
			String jpql = "Select u from User u WHERE firstName Like :search OR lastName LIKE :search OR username LIKE :search ORDER BY firstName";
			users.addAll(em.createQuery(jpql, User.class).setParameter("search", splitSearch).getResultList());
		}
		return users;
	}

	@Override
	public Set<Post> searchPosts(String search) {
		Set<Post> posts = new HashSet<Post>();
		String[] searches = search.split(" ");
		for (String splitSearch : searches) {
			Company comp= findCompanyByString(splitSearch);
			WorkRole wr= findWorkRoleByString(splitSearch);
			Category cat= findCategoryByString(splitSearch);
			splitSearch = "%" + splitSearch + "%";
			String jpql = "Select p from Post p WHERE p.title Like :search OR p.content LIKE :search OR p.user.firstName LIKE :search OR p.user.lastName LIKE :search OR p.user.username LIKE :search OR :searchComp MEMBER OF p.companies OR :searchWr MEMBER OF p.workRoles OR :searchCat MEMBER OF p.categories";
			posts.addAll(em.createQuery(jpql, Post.class).setParameter("search", splitSearch).setParameter("searchComp", comp).setParameter("searchWr", wr).setParameter("searchCat", cat).getResultList());
		}
		return posts;
	}

	// ALL CREATE METHODS
	@Override
	public Post createPost(String content, User user, String title, String company, String workRole,
			Integer[] category) {
		Set<Company> companySet = getCompanySet(company);
		Set<WorkRole> workRoleSet = getWorkRoleSet(workRole);
		List<Category> categories = getCategoryList(category);
		Post post = new Post(content, user, title, companySet, workRoleSet, categories);
		post.setActive(true);
		em.persist(post);
		return post;
	}

	@Override
	public Comment createComment(String content, User user, int id) {
		Comment comment = new Comment(content, user, em.find(Post.class, id));
		comment.setActive(true);
		em.persist(comment);
		return comment;
	}

	@Override
	public User registerUser(String firstName, String lastName, String email, String username, String password,
			int category) {
		User user = new User(firstName, lastName, email, username, password, em.find(UserCategory.class, category));
		user.setActive(true);
		user.setProfilePicture(
				"https://images.assetsdelivery.com/compings_v2/anyashalygina/anyashalygina2108/anyashalygina210800036.jpg");
		em.persist(user);
		return user;
	}

	// ALL DELETE METHODS

	@Override
	public void deleteComment(int commentId) {
		Comment comment = findByCommentId(commentId);
		comment.setActive(false);
	}

	@Override
	public void deletePost(int id) {
		Post post = findByPostId(id);
		post.setActive(false);
	}

	@Override
	public void deleteUser(int id) {
		User user = findById(id);
		user.setActive(false);
	}

	// ALL UPDATE METHODS

	@Override
	public Comment updateComment(int commentId, String content) {
		Comment comment = findByCommentId(commentId);
		if (!content.equals("") && content != null) {
			comment.setContent(content);
		}
		return comment;
	}

	@Override
	public Post updatePost(int id, String title, String content, String company, String workRole, Integer[] category) {
		Post post = findByPostId(id);
		if (!title.equals("") && title != null) {
			post.setTitle(title);
		}
		if (!content.equals("") && content != null) {
			post.setContent(content);
		}
		if (!company.equals("")&& company!=null) {
			post.setCompanies(getCompanySet(company));
		}
		if (!workRole.equals("")&& workRole!=null) {
			post.setWorkRoles(getWorkRoleSet(workRole));
		}
		if (category.length>0) {
			post.setCategories(getCategoryList(category));
		}
		System.out.println(post);
		return post;
	}

	@Override
	public User updateProfile(int id, String firstName, String lastName, String email, String username, String password,
			int category, String workRole, String company, String profilePicture) {
		User user = findById(id);
		if (!firstName.equals("") && firstName != null) {
			user.setFirstName(firstName);
		}
		if (!lastName.equals("") && lastName != null) {
			user.setLastName(lastName);
		}
		if (!email.equals("") && email != null) {
			user.setEmail(email);
		}
		if (!username.equals("") && username != null) {
			user.setUsername(username);
		}
		if (!password.equals("") && password != null) {
			user.setPassword(password);
		}
		if (category != 0) {
			System.out.println(category);
			user.setUserCategory(em.find(UserCategory.class, category));
			System.out.println(user.getUserCategory());
		}
		if (!workRole.equals("") && workRole != null) {
			user.setWorkRole(workRoleByString(workRole));
		}
		if (!company.equals("") && company != null) {
			user.setCompany(companyByString(company));
		}
		if (!profilePicture.equals("") && profilePicture != null) {
			user.setProfilePicture(profilePicture);
			;
		}
		System.out.println(user);
		return user;
	}

	@Override
	public WorkRole workRoleByString(String workRole) {
		try {
			String jpql = "SELECT w from WorkRole w WHERE w.role = :workRole";
			WorkRole wr = em.createQuery(jpql, WorkRole.class).setParameter("workRole", workRole).getSingleResult();
			System.out.println(workRole);
			System.out.println(wr);
			return wr;
		} catch (Exception e) {
			e.printStackTrace();
			WorkRole wr = new WorkRole(workRole);
			em.persist(wr);
			return wr;
		}
	}

	private Company findCompanyByString(String company) {
		try {
			String jpql = "SELECT c from Company c WHERE c.name = :company";
			Company comp = em.createQuery(jpql, Company.class).setParameter("company", company).getSingleResult();
			return comp;
		} catch (Exception e) {
			return null;
		}
	}
	private WorkRole findWorkRoleByString(String workRole) {
		try {
			String jpql = "SELECT w from WorkRole w WHERE w.role = :workRole";
			WorkRole wr = em.createQuery(jpql, WorkRole.class).setParameter("workRole", workRole).getSingleResult();
			return wr;
		} catch (Exception e) {
			return null;
		}
	}
	
	private Category findCategoryByString(String category) {
		try {
		String jpql = "Select c from Category c WHERE c.name= :category";
		Category cat = em.createQuery(jpql, Category.class).setParameter("category", category).getSingleResult();
		return cat;
	} catch (Exception e) {
		return null;
	}
	}
	
	@Override
	public Company companyByString(String company) {
		try {
			String jpql = "SELECT c from Company c WHERE c.name = :company";
			Company comp = em.createQuery(jpql, Company.class).setParameter("company", company).getSingleResult();
			System.out.println(company);
			System.out.println(comp);
			return comp;
		} catch (Exception e) {
			e.printStackTrace();
			Company comp = new Company(company);
			em.persist(comp);
			return comp;
		}
	}

	@Override
	public void addUpvotePost(int userId, int postId) {
		System.out.println("********************* METHOD");
		Post post = findByPostId(postId);
		User user = findById(userId);

		String jpql = "SELECT pv FROM PostVote pv WHERE pv.user=:user AND pv.post=:post";
		List<PostVote> testingKeys = em.createQuery(jpql, PostVote.class).setParameter("user", user)
				.setParameter("post", post).getResultList();
		if (testingKeys.isEmpty()) {
			System.out.println("********************* IN IF");
			PostVoteId pvi = new PostVoteId(userId, postId);
			PostVote pv = new PostVote(pvi, true, user, post);
			em.persist(pv);
			post.addPostVote(pv);
		}
	}

	@Override
	public void addUpvoteComment(int userId, int commentId) {
		System.out.println("********************* METHOD");
		Comment comment = findByCommentId(commentId);
		User user = findById(userId);

		String jpql = "SELECT cv FROM CommentVote cv WHERE cv.user=:user AND cv.comment=:comment";
		List<CommentVote> testingKeys = em.createQuery(jpql, CommentVote.class).setParameter("user", user)
				.setParameter("comment", comment).getResultList();
		if (testingKeys.isEmpty()) {
			System.out.println("********************* IN IF");
			CommentVoteId cvi = new CommentVoteId(userId, commentId);
			CommentVote cv = new CommentVote(cvi, true, user, comment);
			em.persist(cv);
			comment.addCommentVote(cv);
		}
	}

	private Set<Company> getCompanySet(String company) {
		Set<Company> companySet = new HashSet<Company>();
		String[] companies = company.split(", ");
		if (companies.length < 2) {
			companies = company.split(" ");
		}
		for (String comp : companies) {
			companySet.add(companyByString(comp));
		}
		return companySet;
	}

	private Set<WorkRole> getWorkRoleSet(String workRole) {
		Set<WorkRole> workRoleSet = new HashSet<WorkRole>();
		String[] workRoles = workRole.split(", ");
		if (workRoles.length < 2) {
			workRoles = workRole.split(" ");
		}
		for (String wr : workRoles) {
			workRoleSet.add(workRoleByString(wr));
		}
		return workRoleSet;
	}


	@Override
	public Question createQuestion(String questionText) {
		Question question = new Question(questionText);
		em.persist(question);
		return question;

	}

	@Override
	public void deleteQuestion(int id) {
		Question question = findQuestionById(id);
		question.setActive(false);
	}

	@Override
	public Question updateQuestion(int id, String questionText) {
		Question question = findQuestionById(id);
		if (!questionText.equals("") && questionText != null) {
			question.setQuestionText(questionText);
		}

		return question;
	}

	@Override
	public Question findQuestionById(int questionId) {
		System.out.println("in the beginning");
		return em.find(Question.class, questionId); }

	private List<Category> getCategoryList(Integer[] category) {
		List<Category> categories = new ArrayList<Category>();
		for (Integer integer : category) {
			Category cat=em.find(Category.class, integer);
			categories.add(cat);
		}
		return categories;

	}
}
