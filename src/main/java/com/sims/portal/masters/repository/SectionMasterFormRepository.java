package com.sims.portal.masters.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.model.masters.beans.SectionMasterForm;

public interface SectionMasterFormRepository extends JpaRepository<SectionMasterForm, Long> {

	List<SectionMasterForm> findByCode(String code);

}
