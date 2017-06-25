package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.dao.WareHouseMasterDao;
import com.sims.portal.masters.services.WareHouseMasterService;
import com.sims.portal.model.masters.beans.WareHouseMasterForm;

@Service
public class WareHouseMasterServiceImpl implements WareHouseMasterService {

	@Autowired
	private WareHouseMasterDao wareHouseMasterDao;

	public WareHouseMasterForm saveWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {

		wareHouseMasterDao.saveWareHouseMaster(wareHouseMasterForm);

		return wareHouseMasterForm;

	}

	@Override
	public WareHouseMasterForm updateWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {

		wareHouseMasterDao.updateWareHouseMaster(wareHouseMasterForm);

		return wareHouseMasterForm;
	}

	@Override
	public Boolean deleteWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {

		return wareHouseMasterDao.deleteWareHouseMaster(wareHouseMasterForm);
	}

	@Override
	public List<WareHouseMasterForm> findWareHouseMasterDetails() {

		return wareHouseMasterDao.findWareHouseMasterDetails();
	}

	@Override
	public WareHouseMasterForm findWareHouseMasterDetailsByCode(String code) {

		return wareHouseMasterDao.findWareHouseMasterDetailsByCode(code);
	}
}
