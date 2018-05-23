package com.sims.portal.tankprocess.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sims.portal.models.tankprocess.beans.DailyTankRecordingForm;
import com.sims.portal.tankprocess.dao.DailyTankRecordingDao;

@Repository
@Transactional
public class DailyTankRecordingDaoImpl implements DailyTankRecordingDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public DailyTankRecordingForm saveDailyTankRecording(DailyTankRecordingForm dailyTankRecordingForm) {

		entityManager.persist(dailyTankRecordingForm);
		return dailyTankRecordingForm;
	}

	@Override
	public List<DailyTankRecordingForm> findDailyTankRecordingForm() {

		List<DailyTankRecordingForm> dailyTankRecordingFormListData = entityManager
				.createQuery("SELECT dailyTankRecordingForm FROM DailyTankRecordingForm dailyTankRecordingForm ",
						DailyTankRecordingForm.class)
				.getResultList();

		return dailyTankRecordingFormListData;
	}
}
