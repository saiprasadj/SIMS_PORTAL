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
import com.sims.portal.model.user.Role;
import com.sims.portal.model.user.User;
import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.services.utils.DefaultUserDetails;
import com.sims.portal.user.services.UserService;

@Service("defaultUserDetailsService")
public class DefaultUserDetailsService implements UserDetailsService {

	@Autowired
	private UserService userService;

	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserCredentials user = userService.findUser(username);
		System.out.println("User : " + user);
		if (user == null) {
			System.out.println("User not found");
			throw new UsernameNotFoundException("User name not found");
		}
		return (UserDetails) new DefaultUserDetails(user, getGrantedAuthorities(user));
	}

	private Collection<? extends GrantedAuthority> getGrantedAuthorities(UserCredentials user) {
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole()));

		/*
		 * for (Role role : user.getRoles()){ grantedAuthorities.add(new
		 * SimpleGrantedAuthority(role.getName())); }
		 */

		System.out.print("authorities :" + grantedAuthorities);
		return grantedAuthorities;
	}

	private List<GrantedAuthority> getGrantedAuthorities(User user) {
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();

		for (Role role : user.getRoles()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
		}
		System.out.print("authorities :" + grantedAuthorities);
		return grantedAuthorities;
	}

}
