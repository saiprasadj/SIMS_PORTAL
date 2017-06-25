package com.sims.portal.tankprocess.services;

import java.util.List;

import com.sims.portal.models.tankprocess.beans.DailyTankRecordingForm;

public interface DailyTankRecordingService {

	public DailyTankRecordingForm saveDailyTankRecordingForm(DailyTankRecordingForm dailyTankRecordingForm);

	public List<DailyTankRecordingForm> findDailyTankRecordingForm();
}
