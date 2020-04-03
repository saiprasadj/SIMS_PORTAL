package com.sims.portal.masters.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.repository.DepartmentMasterFormRepository;
import com.sims.portal.masters.services.DepartmentMasterService;
import com.sims.portal.model.masters.beans.DepartmentMasterForm;

@Service
public class DepartmentMasterServiceImpl implements DepartmentMasterService {

	@Autowired
	private DepartmentMasterFormRepository repository;

	@Override
	public void saveDepartmentMaster(DepartmentMasterForm departmentMasterForm) {
		repository.save(departmentMasterForm);
	}

	@Override
	public List<DepartmentMasterForm> findDepartmentMasterDetails() {
		return repository.findAll();
	}

	@Override
	public DepartmentMasterForm findDepartmentMasterDetailsByCode(String departmentMasterCode) {
		List<DepartmentMasterForm> departmentMasterForm = repository.findByCode(departmentMasterCode);
		if (!departmentMasterForm.isEmpty()) {

			return departmentMasterForm.get(0);
		}

		return new DepartmentMasterForm();
	}

	@Override
	public void updateDepartmentMaster(DepartmentMasterForm departmentMasterForm) {
		repository.save(departmentMasterForm);

	}

	@Override
	public void deleteDepartmentMaster(DepartmentMasterForm departmentMasterForm) {
		repository.delete(departmentMasterForm);

	}

	@Override
	public Map<String, String> getDepartmentCodes() {

		List<DepartmentMasterForm> listOfDepartments = findDepartmentMasterDetails();

		Map<String, String> departmentCodes = new HashMap<>();

		for (DepartmentMasterForm departmentMasterForm : listOfDepartments) {
			departmentCodes.put(departmentMasterForm.getCode(), departmentMasterForm.getCode());
		}
		return departmentCodes;
	}

}
