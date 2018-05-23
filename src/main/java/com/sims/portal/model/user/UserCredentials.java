package com.sims.portal.model.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_credential")
public class UserCredentials implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int userId;
	private String password;
	private int enable;
	private String role;
	private int changePassword;
	
	@Id
	@Column(name = "user_id")
	public int getUserId() {
		return userId;
	}

	@Column(name = "role_name")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	

	@Column(name = "enable")
	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name = "ChangePassword")
	public int getChangePassword() {
		return changePassword;
	}

	public void setChangePassword(int changePassword) {
		this.changePassword = changePassword;
	}


}
