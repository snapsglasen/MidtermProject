package com.skilldistillery.interviewassister.data;

import com.skilldistillery.interviewassister.entities.User;

public interface UserDAO {
	
	User findById(int userId);

}
