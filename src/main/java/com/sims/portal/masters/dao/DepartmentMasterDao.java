package com.sims.portal.masters.dao;

import java.util.List;

import com.sims.portal.model.masters.beans.DepartmentMasterForm;

public interface DepartmentMasterDao {

	public DepartmentMasterForm saveDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	public DepartmentMasterForm updateDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	public Boolean deleteDepartmentMaster(DepartmentMasterForm departmentMasterForm);

	public List<DepartmentMasterForm> findDepartmentMasterDetails();

	public DepartmentMasterForm findDepartmentMasterDetailsByCode(String code);

}
