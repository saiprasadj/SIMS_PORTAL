package com.sims.portal.user.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.model.user.Role;
import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.user.repository.AdminUserRepository;
import com.sims.portal.user.repository.RolesRepository;
import com.sims.portal.user.services.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminUserRepository userRepository;

	@Autowired
	private RolesRepository rolesRepository;

	@Override
	public UserCredentials findUserCredential(int userid) {
		log.debug("Calling findUserCredential with userid {}", userid);
		return userRepository.findByUserId(userid);
	}

	@Override
	public Map<String, String> getAllRolesMap() {
		List<Role> rolesList = rolesRepository.findAll();
		Map<String, String> rolesMap = new HashMap<>();
		for (Role role : rolesList) {
			rolesMap.put(role.getName(), role.getName());
		}
		return rolesMap;
	}

}
