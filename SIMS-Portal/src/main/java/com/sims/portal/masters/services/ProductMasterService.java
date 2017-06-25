package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.ProductMasterForm;

public interface ProductMasterService {

	public ProductMasterForm saveProductMaster(ProductMasterForm productMasterForm);

	public ProductMasterForm updateProductMaster(ProductMasterForm productMasterForm);

	public Boolean deleteProductMaster(ProductMasterForm productMasterForm);

	public List<ProductMasterForm> findProductMasterDetails();

	public ProductMasterForm findProductMasterDetailsByCode(String code);

}
