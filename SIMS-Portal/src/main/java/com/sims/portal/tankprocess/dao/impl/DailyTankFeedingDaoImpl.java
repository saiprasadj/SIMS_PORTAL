package com.sims.portal.tankprocess.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.models.tankprocess.beans.DailyTankFeedingForm;
import com.sims.portal.tankprocess.dao.DailyTankFeedingDao;

@Repository
@Transactional
public class DailyTankFeedingDaoImpl implements DailyTankFeedingDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public DailyTankFeedingForm saveDailyTankFeedingForm(DailyTankFeedingForm dailyTankFeedingForm) {

		entityManager.persist(dailyTankFeedingForm);
		return dailyTankFeedingForm;
	}

}
