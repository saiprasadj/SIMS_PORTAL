package com.sims.portal.model.masters.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="employee_master", uniqueConstraints = { @UniqueConstraint(columnNames = "code") })
public class EmployeeMasterForm implements Serializable{

	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;
	private String code;
	private String alias;
	private String dateOfJoining;
	private String proofAttachment;
	private String photoAttachment;
	private String departmentCode;
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getProofAttachment() {
		return proofAttachment;
	}
	public void setProofAttachment(String proofAttachment) {
		this.proofAttachment = proofAttachment;
	}
	public String getPhotoAttachment() {
		return photoAttachment;
	}
	public void setPhotoAttachment(String photoAttachment) {
		this.photoAttachment = photoAttachment;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public String getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	
	
}
