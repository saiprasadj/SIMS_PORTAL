package com.sims.portal.masters.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.masters.dao.EmployeeMasterDao;
import com.sims.portal.model.masters.beans.EmployeeMasterForm;

@Repository
@Transactional
public class EmployeeMasterDaoImpl implements EmployeeMasterDao {

	@PersistenceContext
	private EntityManager entityManager;

	public EmployeeMasterForm saveEmployeeMaster(EmployeeMasterForm employeeMasterForm) {

		entityManager.persist(employeeMasterForm);

		return employeeMasterForm;
	}

	@Override
	public EmployeeMasterForm updateEmployeeMaster(EmployeeMasterForm employeeMasterForm) {
		
		System.out.println("Merged ID BEFORE ====== "+employeeMasterForm.getId());
		entityManager.merge(employeeMasterForm);
		System.out.println("Merged ID AFTER ====== "+employeeMasterForm.getId());
		
		return employeeMasterForm;
	}
	
	
	@Override
	public Boolean deleteEmployeeMaster(EmployeeMasterForm employeeMasterForm) {
		
		entityManager.remove(entityManager.merge(employeeMasterForm));
		return true;
	}
	
	@Override
	public List<EmployeeMasterForm> findEmployeeMasterDetails() {

		List<EmployeeMasterForm> employeeMasterFormList = entityManager
				.createQuery("SELECT employeeMasterForm FROM EmployeeMasterForm employeeMasterForm ",
						EmployeeMasterForm.class)
				.getResultList();

		return employeeMasterFormList;
	}

	@Override
	public EmployeeMasterForm findEmployeeMasterDetailsByCode(String code) {

		List<EmployeeMasterForm> employeeMasterForm = entityManager.createQuery(
				"SELECT employeeMasterForm FROM EmployeeMasterForm employeeMasterForm WHERE employeeMasterForm.code='"
						+code+"'",
				EmployeeMasterForm.class).getResultList();

		if (employeeMasterForm.size() > 0) {

			return employeeMasterForm.get(0);
		}

		return new EmployeeMasterForm();
	}
}
