package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.repository.SectionMasterFormRepository;
import com.sims.portal.masters.services.SectionMasterService;
import com.sims.portal.model.masters.beans.SectionMasterForm;

@Service
public class SectionMasterServiceImpl implements SectionMasterService {

    @Autowired
    private SectionMasterFormRepository repository;

    @Override
    public void saveSectionMaster(SectionMasterForm sectionMasterForm) {
        repository.save(sectionMasterForm);
    }

    @Override
    public List<SectionMasterForm> findSectionMasterDetails() {
        return repository.findAll();
    }

    @Override
    public SectionMasterForm findSectionMasterDetailsByCode(String sectionMasterCode) {
        List<SectionMasterForm> masterForms = repository.findByCode(sectionMasterCode);
        if (!masterForms.isEmpty()) {
            return masterForms.get(0);
        }
        return new SectionMasterForm();
    }

    @Override
    public void updateSectionMaster(SectionMasterForm sectionMasterForm) {
        repository.save(sectionMasterForm);
    }

    @Override
    public void deleteSectionMaster(SectionMasterForm sectionMasterForm) {
        repository.delete(sectionMasterForm);
    }

}
