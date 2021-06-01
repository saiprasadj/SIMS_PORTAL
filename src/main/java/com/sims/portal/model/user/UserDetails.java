package com.sims.portal.model.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "user_details")
@Getter
@Setter
public class UserDetails {

	@Id
	@Column(name = "user_id")
	private Integer userId;

	@Column(name = "sales_execode")
	private String salesExecode;

	private String description;

	private String name;

	private Long phone;

	@Column(name = "next_approver")
	private int nextApprover;

	@Column(name = "alternative_emp")
	private int alternativeEmp;

	@Column(name = "active_flag")
	private int activeFlag;

	private String email;

	@Column(name = "role_name")
	private String roleName;

	private Integer managerID;

}
