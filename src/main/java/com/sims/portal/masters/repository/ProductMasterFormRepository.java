package com.sims.portal.masters.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.model.masters.beans.ProductMasterForm;

public interface ProductMasterFormRepository extends JpaRepository<ProductMasterForm, Long>{
    List<ProductMasterForm> findByCode(String code);
}
