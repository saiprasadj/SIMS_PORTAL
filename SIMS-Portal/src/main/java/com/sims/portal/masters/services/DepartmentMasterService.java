package com.sims.portal.masters.services;

import java.util.HashMap;
import java.util.List;

import com.sims.portal.model.masters.beans.DepartmentMasterForm;

public interface DepartmentMasterService {

	public DepartmentMasterForm saveDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	public DepartmentMasterForm updateDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	public Boolean deleteDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	public List<DepartmentMasterForm> findDepartmentMasterDetails();

	public DepartmentMasterForm findDepartmentMasterDetailsByCode(String code);
	
	public HashMap<String,String> getDepartmentCodes();

}
