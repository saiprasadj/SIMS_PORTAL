package com.sims.portal.user.services;

import com.sims.portal.model.user.UserCredentials;

public interface AdminService {
    
    public UserCredentials findUserCredential(int parseInt);
}
