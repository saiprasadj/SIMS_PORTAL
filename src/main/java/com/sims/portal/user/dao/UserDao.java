package com.sims.portal.user.dao;

import com.sims.portal.model.user.User;
import com.sims.portal.model.user.UserCredentials;

public interface UserDao {

	User findById(int id);
	
	User findByUsername(String username);

	UserCredentials findUser(String username);
	
}

