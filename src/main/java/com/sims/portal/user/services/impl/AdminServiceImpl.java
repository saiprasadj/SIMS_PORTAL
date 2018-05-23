package com.sims.portal.user.services.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.user.dao.AdminDao;
import com.sims.portal.user.services.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	AdminDao adminDao;


	@Override
	public UserCredentials findUserCredential(int userid) {
		
		logger.debug("Calling findUserCredential with userid"+userid);
		return adminDao.findUserCredential(userid);
	}


	
}
