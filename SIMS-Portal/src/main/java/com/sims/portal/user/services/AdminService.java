package com.sims.portal.user.services;

import org.springframework.stereotype.Component;

import com.sims.portal.model.user.UserCredentials;

@Component
public interface AdminService {

	public UserCredentials findUserCredential(int parseInt);

}
