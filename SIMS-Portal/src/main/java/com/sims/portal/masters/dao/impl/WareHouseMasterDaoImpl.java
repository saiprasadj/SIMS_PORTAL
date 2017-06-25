package com.sims.portal.masters.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.masters.dao.WareHouseMasterDao;
import com.sims.portal.model.masters.beans.WareHouseMasterForm;

@Repository
@Transactional
public class WareHouseMasterDaoImpl implements WareHouseMasterDao {

	@PersistenceContext
	private EntityManager entityManager;

	public WareHouseMasterForm saveWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {

		entityManager.persist(wareHouseMasterForm);

		return wareHouseMasterForm;
	}

	@Override
	public WareHouseMasterForm updateWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {
		
		System.out.println("Merged ID BEFORE ====== "+wareHouseMasterForm.getId());
		entityManager.merge(wareHouseMasterForm);
		System.out.println("Merged ID AFTER ====== "+wareHouseMasterForm.getId());
		
		return wareHouseMasterForm;
	}
	
	
	@Override
	public Boolean deleteWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {
		
		entityManager.remove(entityManager.merge(wareHouseMasterForm));
		return true;
	}
	
	@Override
	public List<WareHouseMasterForm> findWareHouseMasterDetails() {

		List<WareHouseMasterForm> wareHouseMasterFormList = entityManager
				.createQuery("SELECT wareHouseMasterForm FROM WareHouseMasterForm wareHouseMasterForm ",
						WareHouseMasterForm.class)
				.getResultList();

		return wareHouseMasterFormList;
	}

	@Override
	public WareHouseMasterForm findWareHouseMasterDetailsByCode(String code) {

		List<WareHouseMasterForm> wareHouseMasterForm = entityManager.createQuery(
				"SELECT wareHouseMasterForm FROM WareHouseMasterForm wareHouseMasterForm WHERE wareHouseMasterForm.code='"
						+code+"'",
				WareHouseMasterForm.class).getResultList();

		if (wareHouseMasterForm.size() > 0) {

			return wareHouseMasterForm.get(0);
		}

		return new WareHouseMasterForm();
	}
}
