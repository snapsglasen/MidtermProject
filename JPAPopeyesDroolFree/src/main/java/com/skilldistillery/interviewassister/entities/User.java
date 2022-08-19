package com.skilldistillery.interviewassister.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	private boolean admin;
	private boolean active;
	private String email;
	
	@ManyToOne
	@JoinColumn(name="user_category_id")
	private UserCategory userCategory;
	
	@Column(name="create_date")
	private LocalDateTime createDate;
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	private String username;
	private String password;
	@OneToMany(mappedBy="user")
	private List<Post> posts;
	@ManyToOne
	@JoinColumn(name="work_role_id")
	private WorkRole workRole;
	
	@ManyToOne
	@JoinColumn(name="company_id")
	private Company company;
	
	@OneToMany(mappedBy="user")
	private List<PostVote> postVotes;
	
	@OneToMany(mappedBy="user")
	private List<CommentVote> commentVotes;
	
	@OneToMany(mappedBy="user")
	private List<QuestionVote> questionVote;
	
	public int getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	
	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	
	public UserCategory getUserCategory() {
		return userCategory;
	}

	public void setUserCategory(UserCategory userCategory) {
		this.userCategory = userCategory;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public WorkRole getWorkRole() {
		return workRole;
	}

	public void setWorkRole(WorkRole workRole) {
		this.workRole = workRole;
	}
	
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
	
	public List<PostVote> getPostVotes() {
		return postVotes;
	}

	public void setPostVotes(List<PostVote> postVotes) {
		this.postVotes = postVotes;
	}
	
	public List<CommentVote> getCommentVotes() {
		return commentVotes;
	}

	public void setCommentVotes(List<CommentVote> commentVotes) {
		this.commentVotes = commentVotes;
	}
	
	public List<QuestionVote> getQuestionVote() {
		return questionVote;
	}

	public void setQuestionVote(List<QuestionVote> questionVote) {
		this.questionVote = questionVote;
	}

	public void addPost(Post post) {
		if (posts == null) {
			posts = new ArrayList<>();
		}
		if (!posts.contains(post)) {
			posts.add(post);
			if (post.getUser() != null) {
				post.getUser().getPosts().remove(post);
			}
			post.setUser(this);
			;
		}
	}

	public void removePost(Post post) {
		post.setUser(null);
		if (posts != null) {
			posts.remove(post);
		}
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
				+ ", password=" + password + ", email=" + email + "]";
	}

}
