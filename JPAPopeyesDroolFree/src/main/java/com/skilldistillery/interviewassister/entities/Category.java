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

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	@ManyToMany
	@JoinTable(name = "category_has_topic", joinColumns = @JoinColumn(name = "category_id"), inverseJoinColumns = @JoinColumn(name = "topic_id"))
	private List<Topic> topics;
	@ManyToMany(mappedBy="categories")
	private List<Post> posts;
	

	public Category() {
		super();
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

	public List<Topic> getTopics() {
		return topics;
	}

	public void setTopics(List<Topic> topics) {
		this.topics = topics;
	}

	public List<Post> getPosts() {
		return posts;
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
			post.addCategory(this);
		}
	}

	public void removePost(Post post) {
		if (posts != null && posts.contains(post)) {
			posts.remove(post);
			post.removeCategory(this);
		}
	}

	@Override
	public int hashCode() {
		return Objects.hash(description, id, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		return Objects.equals(description, other.description) && id == other.id && Objects.equals(name, other.name);
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", description=" + description + "]";
	}

}
