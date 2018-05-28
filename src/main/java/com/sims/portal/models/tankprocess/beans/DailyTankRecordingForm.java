package com.sims.portal.models.tankprocess.beans;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tank_operation_dailytankrecording")
public class DailyTankRecordingForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long dailytankrecordingId;
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
    
}
