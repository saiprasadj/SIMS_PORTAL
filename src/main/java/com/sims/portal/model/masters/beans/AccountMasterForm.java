package com.sims.portal.model.masters.beans;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "account_master", uniqueConstraints = { @UniqueConstraint(columnNames = "code") })
public class AccountMasterForm {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
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
}
