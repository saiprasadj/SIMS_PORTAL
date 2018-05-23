package com.sims.portal.models.tankprocess.beans;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tank_operation_dailytankrecording")
public class DailyTankRecordingForm implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long dailytankrecording_id;
	private String siteName;
	private String tankName;
	private String documentDate;
	private Long doc;
	private String supervisor;
	private String remarks;
	private String phAM;
	private String phPM;
	private Integer doNumber;
	private String mortality;
	private String labreportAttachment;

	@OneToMany(mappedBy = "dailyTankRecordingForm")
	private Set<DailyTankFeedingForm> dailyTankFeeding;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getDailytankrecording_id() {
		return dailytankrecording_id;
	}

	public void setDailytankrecording_id(Long dailytankrecording_id) {
		this.dailytankrecording_id = dailytankrecording_id;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getTankName() {
		return tankName;
	}

	public void setTankName(String tankName) {
		this.tankName = tankName;
	}

	public String getDocumentDate() {
		return documentDate;
	}

	public void setDocumentDate(String documentDate) {
		this.documentDate = documentDate;
	}

	public Long getDoc() {
		return doc;
	}

	public void setDoc(Long doc) {
		this.doc = doc;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getPhAM() {
		return phAM;
	}

	public void setPhAM(String phAM) {
		this.phAM = phAM;
	}

	public String getPhPM() {
		return phPM;
	}

	public void setPhPM(String phPM) {
		this.phPM = phPM;
	}

	public Integer getDoNumber() {
		return doNumber;
	}

	public void setDoNumber(Integer doNumber) {
		this.doNumber = doNumber;
	}

	public String getMortality() {
		return mortality;
	}

	public void setMortality(String mortality) {
		this.mortality = mortality;
	}

	public String getLabreportAttachment() {
		return labreportAttachment;
	}

	public void setLabreportAttachment(String labreportAttachment) {
		this.labreportAttachment = labreportAttachment;
	}

}
