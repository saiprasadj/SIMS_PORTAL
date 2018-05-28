package com.sims.portal.models.tankprocess.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tank_operation_dailytankfeeding")
public class DailyTankFeedingForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="dailytankfeeding_id")
    private Long dailytankfeedingId;
    private String feedName;
    private Double feedQuantity;
    private String medicineName;
    private Double medicineQuantity;
    private Double consumedPercentage;
    private String medicineTimings;

    @ManyToOne
    @JoinColumn(name = "dailytankrecording_id", nullable = false)
    private DailyTankRecordingForm dailyTankRecordingForm;
}
