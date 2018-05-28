package com.sims.portal.masters.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.model.masters.beans.AccountMasterForm;

public interface AccountMasterFormRepository extends JpaRepository<AccountMasterForm, Long>{

    List<AccountMasterForm> findByCode(String code);
}
