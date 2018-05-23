package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.dao.EmployeeMasterDao;
import com.sims.portal.masters.services.EmployeeMasterService;
import com.sims.portal.model.masters.beans.EmployeeMasterForm;

@Service
public class EmployeeMasterServiceImpl implements EmployeeMasterService {

	@Autowired
	private EmployeeMasterDao employeeMasterDao;

	public EmployeeMasterForm saveEmployeeMaster(EmployeeMasterForm employeeMasterForm) {

		employeeMasterDao.saveEmployeeMaster(employeeMasterForm);

		return employeeMasterForm;

	}

	@Override
	public EmployeeMasterForm updateEmployeeMaster(EmployeeMasterForm employeeMasterForm) {

		employeeMasterDao.updateEmployeeMaster(employeeMasterForm);

		return employeeMasterForm;
	}

	@Override
	public Boolean deleteEmployeeMaster(EmployeeMasterForm employeeMasterForm) {

		return employeeMasterDao.deleteEmployeeMaster(employeeMasterForm);
	}

	@Override
	public List<EmployeeMasterForm> findEmployeeMasterDetails() {

		return employeeMasterDao.findEmployeeMasterDetails();
	}

	@Override
	public EmployeeMasterForm findEmployeeMasterDetailsByCode(String code) {

		return employeeMasterDao.findEmployeeMasterDetailsByCode(code);
	}
}
