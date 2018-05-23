package com.sims.portal.masters.dao;

import java.util.List;

import com.sims.portal.model.masters.beans.SectionMasterForm;

public interface SectionMasterDao {

	public SectionMasterForm saveSectionMaster(SectionMasterForm sectionMasterForm);
	
	public SectionMasterForm updateSectionMaster(SectionMasterForm sectionMasterForm);
	
	public Boolean deleteSectionMaster(SectionMasterForm sectionMasterForm);

	public List<SectionMasterForm> findSectionMasterDetails();

	public SectionMasterForm findSectionMasterDetailsByCode(String code);

}
