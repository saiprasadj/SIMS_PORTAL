package com.sims.portal.masters.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.model.masters.beans.WareHouseMasterForm;

public interface WareHouseMasterFormRepository
		extends JpaRepository<WareHouseMasterForm, Long> {

	List<WareHouseMasterForm> findByCode(String code);

}
