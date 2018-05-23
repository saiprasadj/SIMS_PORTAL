package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.WareHouseMasterForm;

public interface WareHouseMasterService {

	public WareHouseMasterForm saveWareHouseMaster(WareHouseMasterForm wareHouseMasterForm);

	public WareHouseMasterForm updateWareHouseMaster(WareHouseMasterForm wareHouseMasterForm);

	public Boolean deleteWareHouseMaster(WareHouseMasterForm wareHouseMasterForm);

	public List<WareHouseMasterForm> findWareHouseMasterDetails();

	public WareHouseMasterForm findWareHouseMasterDetailsByCode(String code);

}
