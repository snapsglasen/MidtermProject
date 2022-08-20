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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Post {
	
	
	public Post(String content, User user, String title) {
		super();
		this.content = content;
		this.user = user;
		this.title = title;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String content;
	@CreationTimestamp
	@Column(name = "create_date")
	private LocalDateTime createDate;
	@UpdateTimestamp
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	private boolean active;
	private String title;
	@ManyToMany
	@JoinTable(name = "post_has_company", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "company_id"))
	private List<Company> companies;
	@ManyToMany
	@JoinTable(name = "post_has_work_role", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "work_role_id"))
	private List<WorkRole> workRoles;
	
	@Column(name="interview_date")
	private LocalDateTime interviewDate;

	@OneToMany(mappedBy="post")
	private List<PostVote> postVotes;
	
	@OneToMany(mappedBy="post")
	private List<Comment> comments;
	
	@ManyToMany
	@JoinTable(name = "post_has_category", joinColumns=@JoinColumn(name="post_id"), inverseJoinColumns=@JoinColumn(name="category_id"))
	private List<Category> categories;
	
	public Post() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Company> getCompanies() {
		return companies;
	}

	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}

	public List<WorkRole> getWorkRoles() {
		return workRoles;
	}

	public void setWorkRoles(List<WorkRole> workRoles) {
		this.workRoles = workRoles;
	}

	public LocalDateTime getInterviewDate() {
		return interviewDate;
	}

	public void setInterviewDate(LocalDateTime interviewDate) {
		this.interviewDate = interviewDate;
	}
	
	public List<PostVote> getPostVotes() {
		return postVotes;
	}

	public void setPostVotes(List<PostVote> postVotes) {
		this.postVotes = postVotes;
	}
	
	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public void addComment(Comment comment) {
		if (comments == null) {
			comments = new ArrayList<>();
		}
		
		if (!comments.contains(comment)) {
			comments.add(comment);
		}
	}
	public void removeComment(Comment comment) {
		if (comments != null && comments.contains(comment)) {
			comments.remove(comment);
		}
	}
	
	public void addCompany(Company company) {
		if (companies == null) {
			companies = new ArrayList<>();
		}

		if (!companies.contains(company)) {
			companies.add(company);
			company.addPost(this);
		}
	}

	public void removeCompany(Company company) {
		if (companies != null && companies.contains(company)) {
			companies.remove(company);
			company.removePost(this);
		}
	}
	
	public void addWorkRole(WorkRole workRole) {
		if (workRoles == null) {
			workRoles = new ArrayList<>();
		}

		if (!workRoles.contains(workRole)) {
			workRoles.add(workRole);
			workRole.addPost(this);
		}
	}

	public void removeWorkRole(WorkRole workRole) {
		if (workRoles != null && workRoles.contains(workRole)) {
			workRoles.remove(workRole);
			workRole.removePost(this);
		}
	}
	
	
	

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
	public void addCategory(Category category) {
		if (categories == null) {
			categories = new ArrayList<>();
		}

		if (!categories.contains(category)) {
			categories.add(category);
			category.addPost(this);
		}
	}

	public void removeCategory(Category category) {
		if (categories != null && categories.contains(category)) {
			categories.remove(category);
			category.removePost(this);
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
		Post other = (Post) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", content=" + content + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate
				+ "]";
	}

}
