package com.sims.portal.tankprocess.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.models.tankprocess.beans.DailyTankFeedingForm;
import com.sims.portal.tankprocess.dao.DailyTankFeedingDao;
import com.sims.portal.tankprocess.services.DailyTankFeedingService;

@Service
public class DailyTankFeedingServiceImpl implements DailyTankFeedingService {

	@Autowired
	private DailyTankFeedingDao dailyTankFeedingDao;

	@Override
	public DailyTankFeedingForm saveDailyTankFeedingForm(DailyTankFeedingForm dailyTankFeedingForm) {
		dailyTankFeedingDao.saveDailyTankFeedingForm(dailyTankFeedingForm);
		return dailyTankFeedingForm;
	}

}
