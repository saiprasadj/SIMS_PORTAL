package com.sims.portal.security.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.sims.portal.security.services.SecurityContextService;

@Service("securityContextService")
public final class DefaultSecurityContextService implements SecurityContextService {

    @Autowired
    private AuthenticationTrustResolver authenticationTrustResolver;
    
    @Override
    public boolean isUserAnonymous() {
        final Authentication authentication =
                SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }

    @Override
    public UserDetails getCurrentUser() {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            return ((UserDetails)principal);
        } else {
            return null;
        }
    }

}
