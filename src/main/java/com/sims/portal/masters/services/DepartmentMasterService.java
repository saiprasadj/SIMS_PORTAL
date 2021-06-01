package com.sims.portal.masters.services;

import java.util.List;
import java.util.Map;

import com.sims.portal.model.masters.beans.DepartmentMasterForm;

public interface DepartmentMasterService {

	void saveDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	List<DepartmentMasterForm> findDepartmentMasterDetails();

	DepartmentMasterForm findDepartmentMasterDetailsByCode(String departmentMasterCode);

	void updateDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	void deleteDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	Map<String, String> getDepartmentCodes();

}
