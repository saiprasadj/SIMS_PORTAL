package com.sims.portal.user.services.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.services.utils.DefaultUserDetails;
import com.sims.portal.user.repository.AdminUserRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("defaultUserDetailsService")
public class DefaultUserDetailsService implements UserDetailsService {

    @Autowired
    private AdminUserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        UserCredentials user = userRepository.findByUserId(Integer.valueOf(username));
        log.debug("User : {}", user);
        if (user == null) {
            log.error("User not found");
            throw new UsernameNotFoundException("User name not found");
        }
        return new DefaultUserDetails(user, getGrantedAuthorities(user));
    }

    private Collection<? extends GrantedAuthority> getGrantedAuthorities(
            UserCredentials user) {
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole()));
        return grantedAuthorities;
    }

}
