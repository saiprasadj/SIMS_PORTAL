package com.sims.portal.tankprocess.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.models.tankprocess.beans.DailyTankRecordingForm;
import com.sims.portal.tankprocess.repository.DailyTankRecordingFormRepository;
import com.sims.portal.tankprocess.services.DailyTankRecordingService;

@Service
public class DailyTankRecordingServiceImpl implements DailyTankRecordingService {

	@Autowired
	private DailyTankRecordingFormRepository repository;

	@Override
	public void saveDailyTankRecordingForm(
			DailyTankRecordingForm dailyTankRecordingForm) {
		repository.save(dailyTankRecordingForm);
	}

	@Override
	public List<DailyTankRecordingForm> findDailyTankRecordingForm() {
		return repository.findAll();
	}

}
