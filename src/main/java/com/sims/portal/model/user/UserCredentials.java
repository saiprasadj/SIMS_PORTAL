package com.sims.portal.model.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "user_credential")
public class UserCredentials implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "user_id")
	private int userId;

	@Column(name = "role_name")
	private String role = null;

	private String password = "welcome";

	private int enable = 0;

	@Column(name = "change_password")
	private int changePassword;

}
