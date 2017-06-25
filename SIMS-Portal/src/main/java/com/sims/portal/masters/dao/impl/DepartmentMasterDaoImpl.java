package com.sims.portal.masters.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.masters.dao.DepartmentMasterDao;
import com.sims.portal.model.masters.beans.DepartmentMasterForm;

@Repository
@Transactional
public class DepartmentMasterDaoImpl implements DepartmentMasterDao {

	@PersistenceContext
	private EntityManager entityManager;

	public DepartmentMasterForm saveDepartmentMaster(DepartmentMasterForm departmentMasterForm) {

		entityManager.persist(departmentMasterForm);

		return departmentMasterForm;
	}

	@Override
	public DepartmentMasterForm updateDepartmentMaster(DepartmentMasterForm departmentMasterForm) {
		
		System.out.println("Merged ID BEFORE ====== "+departmentMasterForm.getId());
		entityManager.merge(departmentMasterForm);
		System.out.println("Merged ID AFTER ====== "+departmentMasterForm.getId());
		
		return departmentMasterForm;
	}
	
	
	@Override
	public Boolean deleteDepartmentMaster(DepartmentMasterForm departmentMasterForm) {
		
		entityManager.remove(entityManager.merge(departmentMasterForm));
		return true;
	}
	
	@Override
	public List<DepartmentMasterForm> findDepartmentMasterDetails() {

		List<DepartmentMasterForm> departmentMasterFormList = entityManager
				.createQuery("SELECT departmentMasterForm FROM DepartmentMasterForm departmentMasterForm ",
						DepartmentMasterForm.class)
				.getResultList();

		return departmentMasterFormList;
	}

	@Override
	public DepartmentMasterForm findDepartmentMasterDetailsByCode(String code) {

		List<DepartmentMasterForm> departmentMasterForm = entityManager.createQuery(
				"SELECT departmentMasterForm FROM DepartmentMasterForm departmentMasterForm WHERE departmentMasterForm.code='"
						+code+"'",
				DepartmentMasterForm.class).getResultList();

		if (departmentMasterForm.size() > 0) {

			return departmentMasterForm.get(0);
		}

		return new DepartmentMasterForm();
	}
}
