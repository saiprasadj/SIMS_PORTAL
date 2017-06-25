package com.sims.portal.model.user;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "user_details")
public class UserDetails implements Serializable {
	private static final long serialVersionUID = 1761412022140183954L;

	private Integer userId;
	private String salesExecode;
	private String description;
	private String name;
	private Long phone;
	private int nextApprover;
	private int  alternativeEmp;
	private int activeFlag;
	private String email;
	private String roleName;
	private Integer managerID;
	@Id
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getSalesExecode() {
		return salesExecode;
	}
	public void setSalesExecode(String salesExecode) {
		this.salesExecode = salesExecode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public int getNextApprover() {
		return nextApprover;
	}
	public void setNextApprover(int nextApprover) {
		this.nextApprover = nextApprover;
	}
	public int getAlternativeEmp() {
		return alternativeEmp;
	}
	public void setAlternativeEmp(int alternativeEmp) {
		this.alternativeEmp = alternativeEmp;
	}
	public int getActiveFlag() {
		return activeFlag;
	}
	public void setActiveFlag(int activeFlag) {
		this.activeFlag = activeFlag;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Integer getManagerID() {
		return managerID;
	}
	public void setManagerID(Integer managerID) {
		this.managerID = managerID;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
