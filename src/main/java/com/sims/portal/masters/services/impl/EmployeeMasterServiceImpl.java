package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.repository.EmployeeMasterFormRepository;
import com.sims.portal.masters.services.EmployeeMasterService;
import com.sims.portal.model.masters.beans.EmployeeMasterForm;

@Service
public class EmployeeMasterServiceImpl implements EmployeeMasterService {

    @Autowired
    private EmployeeMasterFormRepository repository;

    @Override
    public void saveEmployeeMaster(EmployeeMasterForm employeeMasterForm) {
        repository.save(employeeMasterForm);
    }

    @Override
    public List<EmployeeMasterForm> findEmployeeMasterDetails() {
        return repository.findAll();
    }

    @Override
    public EmployeeMasterForm findEmployeeMasterDetailsByCode(String employeeMasterCode) {
        List<EmployeeMasterForm> masterForms = repository.findByCode(employeeMasterCode);
        if (!masterForms.isEmpty()) {
            return masterForms.get(0);
        }
        return new EmployeeMasterForm();
    }

    @Override
    public void updateEmployeeMaster(EmployeeMasterForm employeeMasterForm) {
        repository.save(employeeMasterForm);
    }

    @Override
    public void deleteEmployeeMaster(EmployeeMasterForm employeeMasterForm) {
        repository.delete(employeeMasterForm);
    }

}
