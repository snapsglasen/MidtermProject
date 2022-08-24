package com.skilldistillery.interviewassister.data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.interviewassister.entities.Attempt;
import com.skilldistillery.interviewassister.entities.Category;
import com.skilldistillery.interviewassister.entities.Comment;
import com.skilldistillery.interviewassister.entities.CommentVote;
import com.skilldistillery.interviewassister.entities.CommentVoteId;
import com.skilldistillery.interviewassister.entities.Company;
import com.skilldistillery.interviewassister.entities.Option;
import com.skilldistillery.interviewassister.entities.Post;
import com.skilldistillery.interviewassister.entities.PostVote;
import com.skilldistillery.interviewassister.entities.PostVoteId;
import com.skilldistillery.interviewassister.entities.Question;
import com.skilldistillery.interviewassister.entities.QuestionVote;
import com.skilldistillery.interviewassister.entities.QuestionVoteId;
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


	
	// ASK ABOUT THIS! How to make a jpql statement that orders by most of an entity
	@Override
	public List<Post> findMostPopularPost() {
		String jpql = "Select p.id, avg(pv.liked), p from Post p LEFT OUTER JOIN p.postVotes pv GROUP BY p.id HAVING p.active=true ORDER BY avg(pv.liked) DESC";
		List<Object[]> obj = em.createQuery(jpql, Object[].class).getResultList();
		List<Post> post= new ArrayList<>();
		
		try {
			for(int i=0; i<5; i++) {
				post.add((Post) obj.get(i)[2]);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
		}
		
		return post;
	}
	@Override
	public List<Post> findAllMostPopularPost() {
		String jpql = "Select p from Post p LEFT OUTER JOIN p.postVotes pv GROUP BY p.id HAVING p.active=true ORDER BY avg(pv.liked) DESC";
		List<Post> post = em.createQuery(jpql, Post.class).getResultList();
		
		return post;
	}

	@Override
	public List<Post> findNewestPost() {
		String jpql = "Select p from Post p ORDER BY lastUpdate DESC";
		List<Post> post= em.createQuery(jpql, Post.class).getResultList();
		return post;
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

		String jpql = "Select u from User u WHERE u.active=true ORDER BY firstName";
		List<User> users = em.createQuery(jpql, User.class).getResultList();
		return users;
	}

	@Override
	public List<User> adminFindAllUsers() {

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
			Company comp = findCompanyByString(splitSearch);
			WorkRole wr = findWorkRoleByString(splitSearch);
			Category cat = findCategoryByString(splitSearch);
			splitSearch = "%" + splitSearch + "%";
			String jpql = "Select p from Post p WHERE p.title Like :search OR p.content LIKE :search OR p.user.firstName LIKE :search OR p.user.lastName LIKE :search OR p.user.username LIKE :search OR :searchComp MEMBER OF p.companies OR :searchWr MEMBER OF p.workRoles OR :searchCat MEMBER OF p.categories";
			posts.addAll(em.createQuery(jpql, Post.class).setParameter("search", splitSearch)
					.setParameter("searchComp", comp).setParameter("searchWr", wr).setParameter("searchCat", cat)
					.getResultList());
		}
		return posts;
	}

	// ALL CREATE METHODS
	@Override
	public Post createPost(String content, User user, String title, String company, String workRole,
			Integer[] category) {
		Set<Company> companySet = getCompanySet(company);
		Set<WorkRole> workRoleSet = getWorkRoleSet(workRole);
		boolean check = (category == null);
		List<Category> categories = new ArrayList<>();
		if (check) {
		} else {
			categories = getCategoryList(category);
		}
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
	public Post updatePost(int id, String title, String content, String company, String workRole,
			Integer[] categories) {
		Post post = findByPostId(id);
		if (!title.equals("") && title != null) {
			post.setTitle(title);
		}
		if (!content.equals("") && content != null) {
			post.setContent(content);
		}
		if (!company.equals("") && company != null) {
			post.setCompanies(getCompanySet(company));
		}
		if (!workRole.equals("") && workRole != null) {
			post.setWorkRoles(getWorkRoleSet(workRole));
		}
		boolean check = (categories == null);
		if (check) {
			List<Category> cates = new ArrayList<>();
			post.setCategories(cates);
		} else if (categories.length > 0) {

			post.setCategories(getCategoryList(categories));
		}

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
		Post post = findByPostId(postId);
		User user = findById(userId);

		String jpql = "SELECT pv FROM PostVote pv WHERE pv.user=:user AND pv.post=:post";
		List<PostVote> testingKeys = em.createQuery(jpql, PostVote.class).setParameter("user", user)
				.setParameter("post", post).getResultList();
		if (testingKeys.isEmpty()) {
			PostVoteId pvi = new PostVoteId(userId, postId);
			PostVote pv = new PostVote(pvi, true, user, post);
			em.persist(pv);
			post.addPostVote(pv);
		} else {
			for (PostVote postVote : testingKeys) {
				try {
					if (postVote.getLiked() == true) {
						postVote.setLiked(null);
					} else {
						postVote.setLiked(true);
					}
				} catch (Exception e) {
					postVote.setLiked(true);
					e.printStackTrace();
				}

			}
		}
	}
	
	@Override
	public void deleteUpvotePost(int userId, int postId) {
		Post post = findByPostId(postId);
		User user = findById(userId);

		String jpql = "SELECT pv FROM PostVote pv WHERE pv.user=:user AND pv.post=:post";
		List<PostVote> testingKeys = em.createQuery(jpql, PostVote.class).setParameter("user", user)
				.setParameter("post", post).getResultList();
		if (testingKeys.isEmpty()) {
			PostVoteId pvi = new PostVoteId(userId, postId);
			PostVote pv = new PostVote(pvi, false, user, post);
			em.persist(pv);
			post.addPostVote(pv);
		} else {
			for (PostVote postVote : testingKeys) {
				try {
					if (postVote.getLiked() == false) {
						postVote.setLiked(null);
					} else {
						postVote.setLiked(false);
					}
				} catch (Exception e) {
					postVote.setLiked(false);
					e.printStackTrace();
				}

			}
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
		}else {
			for (CommentVote commentVote : testingKeys) {
				try {
					if (commentVote.getLiked() == true) {
						commentVote.setLiked(null);
					} else {
						commentVote.setLiked(true);
					}
				} catch (Exception e) {
					commentVote.setLiked(true);
					e.printStackTrace();
				}

			}
		}
	}
	
	@Override
	public void addDownvoteComment(int userId, int commentId) {
		System.out.println("********************* METHOD");
		Comment comment = findByCommentId(commentId);
		User user = findById(userId);

	String jpql = "SELECT cv FROM CommentVote cv WHERE cv.user=:user AND cv.comment=:comment";
	List<CommentVote> testingKeys = em.createQuery(jpql, CommentVote.class).setParameter("user", user)
			.setParameter("comment", comment).getResultList();
	if (testingKeys.isEmpty()) {
		System.out.println("********************* IN IF");
		CommentVoteId cvi = new CommentVoteId(userId, commentId);
		CommentVote cv = new CommentVote(cvi, false, user, comment);
		em.persist(cv);
		comment.addCommentVote(cv);
	}else {
		for (CommentVote commentVote : testingKeys) {
			try {
				if (commentVote.getLiked() == false) {
					commentVote.setLiked(null);
				} else {
					commentVote.setLiked(false);
				}
			} catch (Exception e) {
				commentVote.setLiked(false);
				e.printStackTrace();
			}

		}
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
	public Question createQuestion(String questionText, Integer[] categories, String description, User user) {
		boolean check = (categories == null);
		List<Category> category = new ArrayList<>();
		if (check) {
		} else {
			category = getCategoryList(categories);
		}
		Question question = new Question(questionText, description, category, user);
		question.setActive(true);
		em.persist(question);
		return question;
	}

	@Override
	public void deleteQuestion(int id) {
		Question question = findQuestionById(id);
		question.setActive(false);
	}

	@Override
	public Question updateQuestion(int id, String questionText, String description, Integer[] categories) {
		Question question = findQuestionById(id);
		if (!questionText.equals("") && questionText != null) {
			question.setQuestionText(questionText);
		}
		if (!description.equals("") && description != null) {
			question.setDescription(description);
		}
		boolean check = (categories == null);
		if (check) {
			List<Category> cates = new ArrayList<>();
			question.setCategories(cates);
		} else if (categories.length > 0) {

			question.setCategories(getCategoryList(categories));
		}

		return question;
	}

	@Override
	public Question findQuestionById(int questionId) {
		System.out.println("in the beginning");
		return em.find(Question.class, questionId);
	}

	private List<Category> getCategoryList(Integer[] category) {
		List<Category> categories = new ArrayList<Category>();
		for (Integer integer : category) {
			Category cat = em.find(Category.class, integer);
			categories.add(cat);
		}
		return categories;

	}

	@Override
	public List<Question> findAllQuestions() {
		Question q = em.find(Question.class, 1);
		System.out.println(q.getActive());
		String jpql = "Select q from Question q WHERE q.active=true";
		List<Question> questions = em.createQuery(jpql, Question.class).getResultList();
		System.out.println(questions);
		return questions;
	}

	@Override
	public Boolean correct(Integer[] selectedOptions, Question question, User user) {
		List<Integer> userSelectedOption = new ArrayList<>(Arrays.asList(selectedOptions));
		for (Option option : question.getOptions()) {
			if (userSelectedOption.contains(option.getId())) {
				if (option.isCorrect()) {
				} else {
					Attempt at = new Attempt(user, question, false);
					em.persist(at);
					return false;
				}
			} else {
				if (option.isCorrect()) {
					Attempt at = new Attempt(user, question, false);
					em.persist(at);
					return false;
				}
			}
		}
		Attempt at = new Attempt(user, question, true);
		em.persist(at);
		return true;
	}

	@Override
	public Set<Question> searchQuestions(String search) {
		Set<Question> questions = new HashSet<Question>();
		String[] searches = search.split(" ");
		for (String splitSearch : searches) {
			Category cat = findCategoryByString(splitSearch);
			splitSearch = "%" + splitSearch + "%";
			String jpql = "Select q from Question q WHERE (q.questionText Like :search "
					+ "OR q.description LIKE :search OR q.user.firstName LIKE :search OR q.user.lastName LIKE :search OR q.user.username LIKE :search OR :searchCat MEMBER OF q.categories) AND q.active=true";
			questions.addAll(em.createQuery(jpql, Question.class).setParameter("search", splitSearch)
					.setParameter("searchCat", cat).getResultList());
		}
		return questions;
	}

	@Override
	public void addUpvoteQuestion(int userId, int questionId) {
		Question question = findQuestionById(questionId);
		User user = findById(userId);

		String jpql = "SELECT qv FROM QuestionVote qv WHERE qv.user=:user AND qv.question=:question";
		List<QuestionVote> testingKeys = em.createQuery(jpql, QuestionVote.class).setParameter("user", user)
				.setParameter("question", question).getResultList();
		if (testingKeys.isEmpty()) {

			QuestionVoteId qvi = new QuestionVoteId(userId, questionId);
			QuestionVote qv = new QuestionVote(qvi, true, user, question);
			em.persist(qv);
			question.addQuestionVote(qv);

		} else {
			for (QuestionVote questionVote : testingKeys) {
				try {
					if (questionVote.getLiked() == true) {
						questionVote.setLiked(null);
					} else {
						questionVote.setLiked(true);
					}
				} catch (Exception e) {
					questionVote.setLiked(true);
					e.printStackTrace();
				}

			}
		}
	}
	
	

	@Override
	public void deleteQuestionLike(int userId, int questionId) {
		Question question = findQuestionById(questionId);
		User user = findById(userId);

		String jpql = "SELECT qv FROM QuestionVote qv WHERE qv.user=:user AND qv.question=:question";
		List<QuestionVote> testingKeys = em.createQuery(jpql, QuestionVote.class).setParameter("user", user)
				.setParameter("question", question).getResultList();
		if (testingKeys.isEmpty()) {

			QuestionVoteId qvi = new QuestionVoteId(userId, questionId);
			QuestionVote qv = new QuestionVote(qvi, false, user, question);
			em.persist(qv);
			question.addQuestionVote(qv);

		} else {
			for (QuestionVote questionVote : testingKeys) {
				try {
					if (questionVote.getLiked() == false) {
						questionVote.setLiked(null);
					} else {
						questionVote.setLiked(false);
					}
				} catch (Exception e) {
					questionVote.setLiked(false);
					e.printStackTrace();
				}

			}
		}
	}

	@Override
	public int countLikes(Question question) {
		String jpql = "Select qv from QuestionVote qv WHERE qv.question = :question AND qv.liked = true";
		List<QuestionVote> qv = em.createQuery(jpql, QuestionVote.class).setParameter("question", question)
				.getResultList();

		return qv.size();
	}

	@Override
	public int countDislikes(Question question) {
		String jpql = "Select qv from QuestionVote qv WHERE qv.question = :question AND qv.liked = false";
		List<QuestionVote> qv = em.createQuery(jpql, QuestionVote.class).setParameter("question", question)
				.getResultList();

		return qv.size();
	}
	
	
	@Override
	public int countPostLike(Post post) {
		String jpql = "Select pv from PostVote pv WHERE pv.post = :post AND pv.liked = true";
		List<PostVote> pv = em.createQuery(jpql, PostVote.class).setParameter("post", post)
				.getResultList();
		
		return pv.size();
	}
	
	@Override
	public int countPostDislike(Post post) {
		String jpql = "Select pv from PostVote pv WHERE pv.post = :post AND pv.liked = false";
		List<PostVote> pv = em.createQuery(jpql, PostVote.class).setParameter("post", post)
				.getResultList();
		
		return pv.size();
	}
	
	@Override
	public List<Post> postsFromUser(User user){
		String jpql= "SELECT p FROM Post p WHERE p.user=:user AND p.active=true ORDER BY lastUpdate DESC";
		List<Post> posts= em.createQuery(jpql, Post.class).setParameter("user", user).setMaxResults(5).getResultList();
		return posts;
	}
	
	

}
