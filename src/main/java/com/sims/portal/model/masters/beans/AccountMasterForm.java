package com.sims.portal.model.masters.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "account_master", uniqueConstraints = { @UniqueConstraint(columnNames = "code") })
public class AccountMasterForm implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String alias;
	private String emailid;
	private String code;
	private String billingaddress;
	private String typeofcustomer;
	private String deliveryaddress;
	private String locality;
	private String pannumber;
	private String state;
	private String phonenumber;
	private String tin;
	private String contactperson;
	private String contactpersonmobilenumber;
	private String contactpersonemailid;

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

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getBillingaddress() {
		return billingaddress;
	}

	public void setBillingaddress(String billingaddress) {
		this.billingaddress = billingaddress;
	}

	public String getTypeofcustomer() {
		return typeofcustomer;
	}

	public void setTypeofcustomer(String typeofcustomer) {
		this.typeofcustomer = typeofcustomer;
	}

	public String getDeliveryaddress() {
		return deliveryaddress;
	}

	public void setDeliveryaddress(String deliveryaddress) {
		this.deliveryaddress = deliveryaddress;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getPannumber() {
		return pannumber;
	}

	public void setPannumber(String pannumber) {
		this.pannumber = pannumber;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getTin() {
		return tin;
	}

	public void setTin(String tin) {
		this.tin = tin;
	}

	public String getContactperson() {
		return contactperson;
	}

	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}

	public String getContactpersonmobilenumber() {
		return contactpersonmobilenumber;
	}

	public void setContactpersonmobilenumber(String contactpersonmobilenumber) {
		this.contactpersonmobilenumber = contactpersonmobilenumber;
	}

	public String getContactpersonemailid() {
		return contactpersonemailid;
	}

	public void setContactpersonemailid(String contactpersonemailid) {
		this.contactpersonemailid = contactpersonemailid;
	}

}
