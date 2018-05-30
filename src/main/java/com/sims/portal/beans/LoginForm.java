package com.sims.portal.beans;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginForm {

	@NotEmpty(message = "{login.username.empty}")
	private String username;

	@NotEmpty(message = "{login.password.empty}")
	private String password;

	private String email;

}
