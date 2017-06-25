package com.sims.portal.services.utils;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.sims.portal.model.user.UserCredentials;

public class DefaultUserDetails extends User {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String firstname;
	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	private String lastname;

	public DefaultUserDetails(UserCredentials user, Collection<? extends GrantedAuthority> authorities) {
		super(String.valueOf(user.getUserId()), user.getPassword(), authorities);
		firstname = String.valueOf(user.getUserId());
		lastname = user.getRole();
		password = user.getPassword();
	}

}