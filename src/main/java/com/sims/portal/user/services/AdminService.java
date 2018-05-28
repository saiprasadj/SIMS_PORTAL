package com.sims.portal.user.services;

import java.util.Map;

import com.sims.portal.model.user.UserCredentials;

public interface AdminService {
    
    public UserCredentials findUserCredential(int parseInt);

    public Map<String, String> getAllRolesMap();

}
