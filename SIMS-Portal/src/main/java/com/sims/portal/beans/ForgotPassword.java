package com.sims.portal.beans;

import org.hibernate.validator.constraints.NotEmpty;

public class ForgotPassword {
	@NotEmpty(message = "{login.username.empty}")
	private String userId;
	private String password;
	private String changePassword;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getChangePassword() {
		return changePassword;
	}

	public void setChangePassword(String changePassword) {
		this.changePassword = changePassword;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@NotEmpty(message = "{login.email.empty}")
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
