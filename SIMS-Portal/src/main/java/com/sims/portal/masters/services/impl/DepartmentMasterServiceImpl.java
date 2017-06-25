package com.sims.portal.masters.services.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.dao.DepartmentMasterDao;
import com.sims.portal.masters.services.DepartmentMasterService;
import com.sims.portal.model.masters.beans.DepartmentMasterForm;

@Service
public class DepartmentMasterServiceImpl implements DepartmentMasterService {

	@Autowired
	private DepartmentMasterDao departmentMasterDao;

	public DepartmentMasterForm saveDepartmentMaster(DepartmentMasterForm departmentMasterForm) {

		departmentMasterDao.saveDepartmentMaster(departmentMasterForm);

		return departmentMasterForm;

	}

	@Override
	public DepartmentMasterForm updateDepartmentMaster(DepartmentMasterForm departmentMasterForm) {

		departmentMasterDao.updateDepartmentMaster(departmentMasterForm);

		return departmentMasterForm;
	}

	@Override
	public Boolean deleteDepartmentMaster(DepartmentMasterForm departmentMasterForm) {

		return departmentMasterDao.deleteDepartmentMaster(departmentMasterForm);
	}

	@Override
	public List<DepartmentMasterForm> findDepartmentMasterDetails() {

		return departmentMasterDao.findDepartmentMasterDetails();
	}

	@Override
	public DepartmentMasterForm findDepartmentMasterDetailsByCode(String code) {

		return departmentMasterDao.findDepartmentMasterDetailsByCode(code);
	}

	@Override
	public HashMap<String, String> getDepartmentCodes() {

		List<DepartmentMasterForm> listOfDepartments = departmentMasterDao.findDepartmentMasterDetails();

		HashMap<String, String> departmentCodes = new HashMap<String, String>();

		for (DepartmentMasterForm departmentMasterForm : listOfDepartments) {
			departmentCodes.put(departmentMasterForm.getCode(), departmentMasterForm.getCode());
		}
		return departmentCodes;
	}
}
