package com.skilldistillery.interviewassister.data;

import com.skilldistillery.interviewassister.entities.Category;

public interface CategoryDAO {
	void create(Category category);
	Category findById(int id);
	void update(int id, Category category);
	void delete(int id);
}
