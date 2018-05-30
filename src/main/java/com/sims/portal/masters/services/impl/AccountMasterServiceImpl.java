package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.repository.AccountMasterFormRepository;
import com.sims.portal.masters.services.AccountMasterService;
import com.sims.portal.model.masters.beans.AccountMasterForm;

@Service
public class AccountMasterServiceImpl implements AccountMasterService {

	@Autowired
	private AccountMasterFormRepository repository;

	@Override
	public AccountMasterForm saveAccountMaster(AccountMasterForm accountMasterForm) {
		return repository.save(accountMasterForm);
	}

	@Override
	public AccountMasterForm updateAccountMaster(AccountMasterForm accountMasterForm) {
		return repository.save(accountMasterForm);
	}

	@Override
	public Boolean deleteAccountMaster(AccountMasterForm accountMasterForm) {
		repository.delete(accountMasterForm);
		return true;
	}

	@Override
	public List<AccountMasterForm> findAccountMasterDetails() {
		return repository.findAll();
	}

	@Override
	public AccountMasterForm findAccountMasterDetailsByCode(String code) {
		List<AccountMasterForm> accountMasterForm = repository.findByCode(code);
		if (!accountMasterForm.isEmpty()) {

			return accountMasterForm.get(0);
		}

		return new AccountMasterForm();
	}

}
