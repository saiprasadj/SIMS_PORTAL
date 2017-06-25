package com.sims.portal.masters.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sims.portal.masters.dao.ProductMasterDao;
import com.sims.portal.model.masters.beans.ProductMasterForm;

@Repository
@Transactional
public class ProductMasterDaoImpl implements ProductMasterDao {

	@PersistenceContext
	private EntityManager entityManager;

	public ProductMasterForm saveProductMaster(ProductMasterForm productMasterForm) {

		entityManager.persist(productMasterForm);

		return productMasterForm;
	}

	@Override
	public ProductMasterForm updateProductMaster(ProductMasterForm productMasterForm) {
		
		System.out.println("Merged ID BEFORE ====== "+productMasterForm.getId());
		entityManager.merge(productMasterForm);
		System.out.println("Merged ID AFTER ====== "+productMasterForm.getId());
		
		return productMasterForm;
	}
	
	
	@Override
	public Boolean deleteProductMaster(ProductMasterForm productMasterForm) {
		
		entityManager.remove(entityManager.merge(productMasterForm));
		return true;
	}
	
	@Override
	public List<ProductMasterForm> findProductMasterDetails() {

		List<ProductMasterForm> productMasterFormList = entityManager
				.createQuery("SELECT productMasterForm FROM ProductMasterForm productMasterForm ",
						ProductMasterForm.class)
				.getResultList();

		return productMasterFormList;
	}

	@Override
	public ProductMasterForm findProductMasterDetailsByCode(String code) {

		List<ProductMasterForm> productMasterForm = entityManager.createQuery(
				"SELECT productMasterForm FROM ProductMasterForm productMasterForm WHERE productMasterForm.code='"
						+code+"'",
				ProductMasterForm.class).getResultList();

		if (productMasterForm.size() > 0) {

			return productMasterForm.get(0);
		}

		return new ProductMasterForm();
	}
}
