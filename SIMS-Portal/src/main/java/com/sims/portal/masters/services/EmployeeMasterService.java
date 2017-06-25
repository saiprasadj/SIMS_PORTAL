package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.EmployeeMasterForm;

public interface EmployeeMasterService {

	public EmployeeMasterForm saveEmployeeMaster(EmployeeMasterForm employeeMasterForm);

	public EmployeeMasterForm updateEmployeeMaster(EmployeeMasterForm employeeMasterForm);

	public Boolean deleteEmployeeMaster(EmployeeMasterForm employeeMasterForm);

	public List<EmployeeMasterForm> findEmployeeMasterDetails();

	public EmployeeMasterForm findEmployeeMasterDetailsByCode(String code);

}
