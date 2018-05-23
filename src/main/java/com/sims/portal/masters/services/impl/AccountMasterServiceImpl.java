package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.dao.AccountMasterDao;
import com.sims.portal.masters.services.AccountMasterService;
import com.sims.portal.model.masters.beans.AccountMasterForm;

@Service
public class AccountMasterServiceImpl implements AccountMasterService {

	@Autowired
	private AccountMasterDao accountMasterDao;

	public AccountMasterForm saveAccountMaster(AccountMasterForm accountMasterForm) {

		accountMasterDao.saveAccountMaster(accountMasterForm);

		return accountMasterForm;

	}

	@Override
	public AccountMasterForm updateAccountMaster(AccountMasterForm accountMasterForm) {

		accountMasterDao.updateAccountMaster(accountMasterForm);

		return accountMasterForm;
	}

	@Override
	public Boolean deleteAccountMaster(AccountMasterForm accountMasterForm) {

		return accountMasterDao.deleteAccountMaster(accountMasterForm);
	}

	@Override
	public List<AccountMasterForm> findAccountMasterDetails() {

		return accountMasterDao.findAccountMasterDetails();
	}

	@Override
	public AccountMasterForm findAccountMasterDetailsByCode(String code) {

		return accountMasterDao.findAccountMasterDetailsByCode(code);
	}
}
