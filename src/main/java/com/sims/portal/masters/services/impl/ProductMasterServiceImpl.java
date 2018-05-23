package com.sims.portal.masters.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sims.portal.masters.dao.ProductMasterDao;
import com.sims.portal.masters.services.ProductMasterService;
import com.sims.portal.model.masters.beans.ProductMasterForm;

@Service
public class ProductMasterServiceImpl implements ProductMasterService {

	@Autowired
	private ProductMasterDao productMasterDao;

	public ProductMasterForm saveProductMaster(ProductMasterForm productMasterForm) {

		productMasterDao.saveProductMaster(productMasterForm);

		return productMasterForm;

	}

	@Override
	public ProductMasterForm updateProductMaster(ProductMasterForm productMasterForm) {

		productMasterDao.updateProductMaster(productMasterForm);

		return productMasterForm;
	}

	@Override
	public Boolean deleteProductMaster(ProductMasterForm productMasterForm) {

		return productMasterDao.deleteProductMaster(productMasterForm);
	}

	@Override
	public List<ProductMasterForm> findProductMasterDetails() {

		return productMasterDao.findProductMasterDetails();
	}

	@Override
	public ProductMasterForm findProductMasterDetailsByCode(String code) {

		return productMasterDao.findProductMasterDetailsByCode(code);
	}
}
