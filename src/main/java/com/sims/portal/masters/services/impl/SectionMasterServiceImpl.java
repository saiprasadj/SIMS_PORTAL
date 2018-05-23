package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.dao.SectionMasterDao;
import com.sims.portal.masters.services.SectionMasterService;
import com.sims.portal.model.masters.beans.SectionMasterForm;

@Service
public class SectionMasterServiceImpl implements SectionMasterService {

	@Autowired
	private SectionMasterDao sectionMasterDao;

	public SectionMasterForm saveSectionMaster(SectionMasterForm sectionMasterForm) {

		sectionMasterDao.saveSectionMaster(sectionMasterForm);

		return sectionMasterForm;

	}

	@Override
	public SectionMasterForm updateSectionMaster(SectionMasterForm sectionMasterForm) {

		sectionMasterDao.updateSectionMaster(sectionMasterForm);

		return sectionMasterForm;
	}

	@Override
	public Boolean deleteSectionMaster(SectionMasterForm sectionMasterForm) {

		return sectionMasterDao.deleteSectionMaster(sectionMasterForm);
	}

	@Override
	public List<SectionMasterForm> findSectionMasterDetails() {

		return sectionMasterDao.findSectionMasterDetails();
	}

	@Override
	public SectionMasterForm findSectionMasterDetailsByCode(String code) {

		return sectionMasterDao.findSectionMasterDetailsByCode(code);
	}
}
