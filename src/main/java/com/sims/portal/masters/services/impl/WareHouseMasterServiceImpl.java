package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.repository.WareHouseMasterFormRepository;
import com.sims.portal.masters.services.WareHouseMasterService;
import com.sims.portal.model.masters.beans.WareHouseMasterForm;

@Service
public class WareHouseMasterServiceImpl implements WareHouseMasterService {

	@Autowired
	private WareHouseMasterFormRepository repository;

	@Override
	public void saveWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {
		repository.save(wareHouseMasterForm);
	}

	@Override
	public List<WareHouseMasterForm> findWareHouseMasterDetails() {
		return repository.findAll();
	}

	@Override
	public WareHouseMasterForm findWareHouseMasterDetailsByCode(
			String wareHouseMasterCode) {
		List<WareHouseMasterForm> masterForms = repository
				.findByCode(wareHouseMasterCode);
		if (!masterForms.isEmpty()) {
			return masterForms.get(0);
		}
		return new WareHouseMasterForm();
	}

	@Override
	public void updateWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {
		repository.save(wareHouseMasterForm);
	}

	@Override
	public void deleteWareHouseMaster(WareHouseMasterForm wareHouseMasterForm) {
		repository.delete(wareHouseMasterForm);
	}

}
