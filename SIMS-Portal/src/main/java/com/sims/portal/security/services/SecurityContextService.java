package com.sims.portal.security.services;

import org.springframework.security.core.userdetails.UserDetails;

public interface SecurityContextService {
	
  boolean isUserAnonymous();
  
  UserDetails getCurrentUser();
}