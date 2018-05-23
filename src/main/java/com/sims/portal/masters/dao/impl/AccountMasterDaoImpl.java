package com.sims.portal.masters.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.masters.dao.AccountMasterDao;
import com.sims.portal.model.masters.beans.AccountMasterForm;

@Repository
@Transactional
public class AccountMasterDaoImpl implements AccountMasterDao {

	@PersistenceContext
	private EntityManager entityManager;

	public AccountMasterForm saveAccountMaster(AccountMasterForm accountMasterForm) {

		entityManager.persist(accountMasterForm);

		return accountMasterForm;
	}

	@Override
	public AccountMasterForm updateAccountMaster(AccountMasterForm accountMasterForm) {
		
		System.out.println("Merged ID BEFORE ====== "+accountMasterForm.getId());
		entityManager.merge(accountMasterForm);
		System.out.println("Merged ID AFTER ====== "+accountMasterForm.getId());
		
		return accountMasterForm;
	}
	
	
	@Override
	public Boolean deleteAccountMaster(AccountMasterForm accountMasterForm) {
		
		entityManager.remove(entityManager.merge(accountMasterForm));
		return true;
	}
	
	@Override
	public List<AccountMasterForm> findAccountMasterDetails() {

		List<AccountMasterForm> accountMasterFormList = entityManager
				.createQuery("SELECT accountMasterForm FROM AccountMasterForm accountMasterForm ",
						AccountMasterForm.class)
				.getResultList();

		return accountMasterFormList;
	}

	@Override
	public AccountMasterForm findAccountMasterDetailsByCode(String code) {

		List<AccountMasterForm> accountMasterForm = entityManager.createQuery(
				"SELECT accountMasterForm FROM AccountMasterForm accountMasterForm WHERE accountMasterForm.code='"
						+code+"'",
				AccountMasterForm.class).getResultList();

		if (accountMasterForm.size() > 0) {

			return accountMasterForm.get(0);
		}

		return new AccountMasterForm();
	}
}
