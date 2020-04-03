package com.sims.portal.masters.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.model.masters.beans.EmployeeMasterForm;

public interface EmployeeMasterFormRepository extends JpaRepository<EmployeeMasterForm, Long> {

	List<EmployeeMasterForm> findByCode(String code);

}
