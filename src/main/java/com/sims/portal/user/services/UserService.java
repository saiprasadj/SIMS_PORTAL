package com.sims.portal.user.services;

import com.sims.portal.model.user.User;
import com.sims.portal.model.user.UserCredentials;

public interface UserService {

	User findById(int id);

	User findByUsername(String sso);

	UserCredentials findUser(String username);

}