package com.sims.portal.masters.dao;

import java.util.List;

import com.sims.portal.model.masters.beans.ProductMasterForm;

public interface ProductMasterDao {

	public ProductMasterForm saveProductMaster(ProductMasterForm productMasterForm);
	
	public ProductMasterForm updateProductMaster(ProductMasterForm productMasterForm);
	
	public Boolean deleteProductMaster(ProductMasterForm productMasterForm);

	public List<ProductMasterForm> findProductMasterDetails();

	public ProductMasterForm findProductMasterDetailsByCode(String code);

}
