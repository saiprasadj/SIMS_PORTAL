package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.EmployeeMasterForm;

public interface EmployeeMasterService {

	void saveEmployeeMaster(EmployeeMasterForm employeeMasterForm);

	List<EmployeeMasterForm> findEmployeeMasterDetails();

	EmployeeMasterForm findEmployeeMasterDetailsByCode(String employeeMasterCode);

	void updateEmployeeMaster(EmployeeMasterForm employeeMasterForm);

	void deleteEmployeeMaster(EmployeeMasterForm employeeMasterForm);

}
