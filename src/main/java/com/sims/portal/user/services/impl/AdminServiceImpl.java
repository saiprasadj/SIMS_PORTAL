package com.sims.portal.user.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.user.repository.AdminUserRepository;
import com.sims.portal.user.services.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminUserRepository userRepository;

	@Override
	public UserCredentials findUserCredential(int userid) {
		log.debug("Calling findUserCredential with userid {}",userid);
		return userRepository.findByUserId(userid);
	}
	
}
