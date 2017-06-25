package com.sims.portal.tankprocess.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.models.tankprocess.beans.DailyTankRecordingForm;
import com.sims.portal.tankprocess.dao.DailyTankRecordingDao;
import com.sims.portal.tankprocess.services.DailyTankRecordingService;

@Service
public class DailyTankRecordingServiceImpl implements DailyTankRecordingService {

	@Autowired
	private DailyTankRecordingDao dailyTankRecordingDao;

	@Override
	public DailyTankRecordingForm saveDailyTankRecordingForm(DailyTankRecordingForm dailyTankRecordingForm) {

		dailyTankRecordingDao.saveDailyTankRecording(dailyTankRecordingForm);
		return dailyTankRecordingForm;
	}

	@Override
	public List<DailyTankRecordingForm> findDailyTankRecordingForm() {

		List<DailyTankRecordingForm> dailyTankRecordingFormListData = dailyTankRecordingDao.findDailyTankRecordingForm();

		return dailyTankRecordingFormListData;
	}

}
