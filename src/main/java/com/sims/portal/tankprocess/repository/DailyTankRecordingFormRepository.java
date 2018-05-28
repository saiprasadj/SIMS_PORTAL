package com.sims.portal.tankprocess.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.models.tankprocess.beans.DailyTankRecordingForm;

public interface DailyTankRecordingFormRepository extends JpaRepository<DailyTankRecordingForm, Long> {

}
