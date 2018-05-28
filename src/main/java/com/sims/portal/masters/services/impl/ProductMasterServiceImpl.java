package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.repository.ProductMasterFormRepository;
import com.sims.portal.masters.services.ProductMasterService;
import com.sims.portal.model.masters.beans.ProductMasterForm;

@Service
public class ProductMasterServiceImpl implements ProductMasterService{
    
    @Autowired
    private ProductMasterFormRepository repository;

    @Override
    public void saveProductMaster(ProductMasterForm productMasterForm) {
        repository.save(productMasterForm);
    }

    @Override
    public List<ProductMasterForm> findProductMasterDetails() {
        return repository.findAll();
    }

    @Override
    public ProductMasterForm findProductMasterDetailsByCode(String productMasterCode) {
        List<ProductMasterForm> masterForms = repository.findByCode(productMasterCode);
        if (!masterForms.isEmpty()) {
            return masterForms.get(0);
        }
        return new ProductMasterForm();
    }

    @Override
    public void updateProductMaster(ProductMasterForm productMasterForm) {
        repository.save(productMasterForm);
    }

    @Override
    public void deleteProductMaster(ProductMasterForm productMasterForm) {
       repository.delete(productMasterForm);
    }

}
