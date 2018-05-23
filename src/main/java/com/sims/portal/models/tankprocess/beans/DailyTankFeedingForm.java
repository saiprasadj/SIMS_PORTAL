package com.sims.portal.models.tankprocess.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tank_operation_dailytankfeeding")
public class DailyTankFeedingForm implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long dailytankfeeding_id;
	private String feedName;
	private Double feedQuantity;
	private String medicineName;
	private Double medicineQuantity;
	private Double consumedPercentage;
	private String medicineTimings;

	@ManyToOne
	@JoinColumn(name = "dailytankrecording_id", nullable = false)
	private DailyTankRecordingForm dailyTankRecordingForm;

	public String getFeedName() {
		return feedName;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getDailytankfeeding_id() {
		return dailytankfeeding_id;
	}

	public void setDailytankfeeding_id(Long dailytankfeeding_id) {
		this.dailytankfeeding_id = dailytankfeeding_id;
	}

	public void setFeedName(String feedName) {
		this.feedName = feedName;
	}

	public Double getFeedQuantity() {
		return feedQuantity;
	}

	public void setFeedQuantity(Double feedQuantity) {
		this.feedQuantity = feedQuantity;
	}

	public String getMedicineName() {
		return medicineName;
	}

	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}

	public Double getMedicineQuantity() {
		return medicineQuantity;
	}

	public void setMedicineQuantity(Double medicineQuantity) {
		this.medicineQuantity = medicineQuantity;
	}

	public Double getConsumedPercentage() {
		return consumedPercentage;
	}

	public void setConsumedPercentage(Double consumedPercentage) {
		this.consumedPercentage = consumedPercentage;
	}

	public String getMedicineTimings() {
		return medicineTimings;
	}

	public void setMedicineTimings(String medicineTimings) {
		this.medicineTimings = medicineTimings;
	}

}
