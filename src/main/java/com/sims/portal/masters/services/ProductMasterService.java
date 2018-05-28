package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.ProductMasterForm;

public interface ProductMasterService {

    void saveProductMaster(ProductMasterForm productMasterForm);

    List<ProductMasterForm> findProductMasterDetails();

    ProductMasterForm findProductMasterDetailsByCode(String productMasterCode);

    void updateProductMaster(ProductMasterForm productMasterForm);

    void deleteProductMaster(ProductMasterForm productMasterForm);

}
