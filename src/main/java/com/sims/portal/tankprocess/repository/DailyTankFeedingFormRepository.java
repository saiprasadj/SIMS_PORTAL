package com.sims.portal.tankprocess.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.models.tankprocess.beans.DailyTankFeedingForm;

public interface DailyTankFeedingFormRepository
		extends JpaRepository<DailyTankFeedingForm, Long> {

}
