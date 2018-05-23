package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.SectionMasterForm;

public interface SectionMasterService {

	public SectionMasterForm saveSectionMaster(SectionMasterForm sectionMasterForm);

	public SectionMasterForm updateSectionMaster(SectionMasterForm sectionMasterForm);

	public Boolean deleteSectionMaster(SectionMasterForm sectionMasterForm);

	public List<SectionMasterForm> findSectionMasterDetails();

	public SectionMasterForm findSectionMasterDetailsByCode(String code);

}
