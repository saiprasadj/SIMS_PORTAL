package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.AccountMasterForm;

public interface AccountMasterService {

	public AccountMasterForm saveAccountMaster(AccountMasterForm accountMasterForm);

	public AccountMasterForm updateAccountMaster(AccountMasterForm accountMasterForm);

	public Boolean deleteAccountMaster(AccountMasterForm accountMasterForm);

	public List<AccountMasterForm> findAccountMasterDetails();

	public AccountMasterForm findAccountMasterDetailsByCode(String code);

}
