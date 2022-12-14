package com.skilldistillery.interviewassister.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="work_role")
public class WorkRole {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String role;
	
	private String description;
	
	
	

	@ManyToMany
	@JoinTable(name = "post_has_work_role", joinColumns = @JoinColumn(name = "work_role_id"), inverseJoinColumns = @JoinColumn(name = "post_id"))
	private List<Post> posts;
	
	@OneToMany(mappedBy="workRole")
	private List<User> users;

	public WorkRole() {
		super();
	}
	public WorkRole(String role) {
		super();
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	public void addPost(Post post) {
		if (posts == null) {
			posts = new ArrayList<>();
		}

		if (!posts.contains(post)) {
			posts.add(post);
			post.addWorkRole(this);
		}
	}

	public void removePost(Post post) {
		if (posts != null && posts.contains(post)) {
			posts.remove(post);
			post.removeWorkRole(this);
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
		WorkRole other = (WorkRole) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return role+" ";
	}

}
