package com.sims.portal.masters.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.model.masters.beans.DepartmentMasterForm;

public interface DepartmentMasterFormRepository
		extends JpaRepository<DepartmentMasterForm, Long> {

	List<DepartmentMasterForm> findByCode(String code);

}
