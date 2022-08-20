package com.skilldistillery.interviewassister.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="user_category")
public class UserCategory {
	
	
	public UserCategory() {
		super();
	}
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int id;
	
	private String name;
	
	public UserCategory(String name) {
		super();
		this.name = name;
		if(name.equals("Student")) {this.id=1;}
		else if(name.equals("Alumni")) {this.id=2;}
		else if(name.equals("Instructor")) {this.id=3;}
		else {this.id=4;}
	}
	@OneToMany(mappedBy="userCategory")
	private List<User> users;

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
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

	public UserCategory(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	@Override
	public String toString() {
		return "UserCategory [id=" + id + ", name=" + name + "]";
	}
	
	

}
