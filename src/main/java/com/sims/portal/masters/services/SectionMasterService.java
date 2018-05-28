package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.SectionMasterForm;

public interface SectionMasterService {

    void saveSectionMaster(SectionMasterForm sectionMasterForm);

    List<SectionMasterForm> findSectionMasterDetails();

    SectionMasterForm findSectionMasterDetailsByCode(String sectionMasterCode);

    void updateSectionMaster(SectionMasterForm sectionMasterForm);

    void deleteSectionMaster(SectionMasterForm sectionMasterForm);

}
