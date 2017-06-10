package com.sims.portal.user.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.sims.portal.model.user.User;
import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.user.dao.UserDao;
import com.sims.portal.user.services.UserService;

@Service("userService")
@Transactional
public class DefaultUserService implements UserService {

	@Autowired
	private UserDao dao;

	public User findById(int id) {
		return dao.findById(id);
	}

	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}

	@Override
	public UserCredentials findUser(String username) {
		// TODO Auto-generated method stub
		return dao.findUser(username);
	}

}
