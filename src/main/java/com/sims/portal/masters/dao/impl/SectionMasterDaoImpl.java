package com.sims.portal.masters.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.masters.dao.SectionMasterDao;
import com.sims.portal.model.masters.beans.SectionMasterForm;

@Repository
@Transactional
public class SectionMasterDaoImpl implements SectionMasterDao {

	@PersistenceContext
	private EntityManager entityManager;

	public SectionMasterForm saveSectionMaster(SectionMasterForm sectionMasterForm) {

		entityManager.persist(sectionMasterForm);

		return sectionMasterForm;
	}

	@Override
	public SectionMasterForm updateSectionMaster(SectionMasterForm sectionMasterForm) {
		
		System.out.println("Merged ID BEFORE ====== "+sectionMasterForm.getId());
		entityManager.merge(sectionMasterForm);
		System.out.println("Merged ID AFTER ====== "+sectionMasterForm.getId());
		
		return sectionMasterForm;
	}
	
	
	@Override
	public Boolean deleteSectionMaster(SectionMasterForm sectionMasterForm) {
		
		entityManager.remove(entityManager.merge(sectionMasterForm));
		return true;
	}
	
	@Override
	public List<SectionMasterForm> findSectionMasterDetails() {

		List<SectionMasterForm> sectionMasterFormList = entityManager
				.createQuery("SELECT sectionMasterForm FROM SectionMasterForm sectionMasterForm ",
						SectionMasterForm.class)
				.getResultList();

		return sectionMasterFormList;
	}

	@Override
	public SectionMasterForm findSectionMasterDetailsByCode(String code) {

		List<SectionMasterForm> sectionMasterForm = entityManager.createQuery(
				"SELECT sectionMasterForm FROM SectionMasterForm sectionMasterForm WHERE sectionMasterForm.code='"
						+code+"'",
				SectionMasterForm.class).getResultList();

		if (sectionMasterForm.size() > 0) {

			return sectionMasterForm.get(0);
		}

		return new SectionMasterForm();
	}
}
