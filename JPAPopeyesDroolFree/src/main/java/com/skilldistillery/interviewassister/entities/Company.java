package com.skilldistillery.interviewassister.entities;

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
import javax.persistence.OneToMany;

@Entity
public class Company {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private String description;
	
	@Column(name="site_url")
	private String siteUrl;
	
	@Column(name="logo_url")
	private String Logo;
	
	@ManyToMany
	@JoinTable(name = "post_has_company", joinColumns = @JoinColumn(name = "company_id"), inverseJoinColumns = @JoinColumn(name = "post_id"))
	private List<Post> posts;

	@OneToMany(mappedBy="company")
	private List<User> users;

	public Company() {
		super();
	}

	

	public Company(String name) {
		super();
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSiteUrl() {
		return siteUrl;
	}

	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}

	public String getLogo() {
		return Logo;
	}

	public void setLogo(String logo) {
		Logo = logo;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public void addPost(Post post) {
		if (posts == null) {
			posts = new ArrayList<>();
		}

		if (!posts.contains(post)) {
			posts.add(post);
			post.addCompany(this);
		}
	}

	public void removePost(Post post) {
		if (posts != null && posts.contains(post)) {
			posts.remove(post);
			post.removeCompany(this);
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
		Company other = (Company) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return name+" ";
	}

}
