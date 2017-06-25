package com.sims.portal.tankprocess.dao;

import java.util.List;

import com.sims.portal.models.tankprocess.beans.DailyTankRecordingForm;

public interface DailyTankRecordingDao {

	public DailyTankRecordingForm saveDailyTankRecording(DailyTankRecordingForm dailyTankRecordingForm);

	public List<DailyTankRecordingForm> findDailyTankRecordingForm();
	
}
