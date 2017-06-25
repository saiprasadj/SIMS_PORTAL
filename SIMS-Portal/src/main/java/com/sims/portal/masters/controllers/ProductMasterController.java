package com.sims.portal.masters.controllers;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.sims.portal.masters.constants.MastersPageConstants;
import com.sims.portal.masters.services.ProductMasterService;
import com.sims.portal.model.masters.beans.ProductMasterForm;

@RequestMapping(value = "/master/product")
@Controller
public class ProductMasterController {

	@Autowired
	private ProductMasterService productMasterService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showProductMasterPage() {

		ModelAndView modelAndView = new ModelAndView();
		setDefaultDataForProductMasterPage(modelAndView);

		// LIST PAGE DATA
		findProductMasterDetails(modelAndView);

		return modelAndView;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveProductMaster(@ModelAttribute("productMasterForm") ProductMasterForm productMasterForm) {

		ModelAndView modelAndView = new ModelAndView();
		System.out.println("ProductMasterForm " + productMasterForm.getName());
		productMasterService.saveProductMaster(productMasterForm);
		setDefaultDataForProductMasterPage(modelAndView);
		findProductMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Saved Successfully !!!");

		return modelAndView;
	}

	public ModelAndView findProductMasterDetails(ModelAndView modelAndView) {

		List<ProductMasterForm> productMasterFormList = productMasterService.findProductMasterDetails();
		modelAndView.addObject("productMasterFormListData", productMasterFormList);

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{code}", method = RequestMethod.GET)
	public ModelAndView findProductMasterDetailsByCode(@PathVariable(name = "code") String productMasterCode) {

		System.out.println("Code Received &&&&&&&&&&&&&&  " + productMasterCode);
		ModelAndView modelAndView = new ModelAndView();
		ProductMasterForm productMasterForm = productMasterService.findProductMasterDetailsByCode(productMasterCode);
		modelAndView.addObject("productMasterForm", productMasterForm);
		findProductMasterDetails(modelAndView);
		modelAndView.setViewName(MastersPageConstants.PRODUCT_MASTER_MAIN_PAGE);
		modelAndView.addObject("tabToShow", "details");
		modelAndView.addObject("productMasterURL", "product/update/" + productMasterForm.getId());

		return modelAndView;
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public ModelAndView updateProductMaster(@PathVariable(name = "id") Long id,
			@ModelAttribute("productMasterForm") ProductMasterForm productMasterForm) {

		System.out.println("UPDATING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("UPDATE CODE === " + id);
		productMasterForm.setId(id);
		productMasterService.updateProductMaster(productMasterForm);
		setDefaultDataForProductMasterPage(modelAndView);
		findProductMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Updated Successfully !!!");

		// modelAndView.setViewName("redirect:/master/product");

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteProductMasterDetailsByCode(@PathVariable(name = "id") Long id,
			@ModelAttribute("productMasterForm") ProductMasterForm productMasterForm) {

		System.out.println("DELETING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		productMasterForm.setId(id);
		productMasterService.deleteProductMaster(productMasterForm);
		setDefaultDataForProductMasterPage(modelAndView);
		findProductMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Deleted Successfully !!!");
		return modelAndView;
	}

	private ModelAndView setDefaultDataForProductMasterPage(ModelAndView modelAndView) {

		modelAndView.addObject("productMasterForm", new ProductMasterForm());

		HashMap<String, String> typesOfCustomersMap = new HashMap<String, String>();

		typesOfCustomersMap.put("customertype1", "Customer Type 1");
		typesOfCustomersMap.put("customertype2", "Customer Type 2");
		typesOfCustomersMap.put("customertype3", "Customer Type 3");
		typesOfCustomersMap.put("customertype4", "Customer Type 4");
		typesOfCustomersMap.put("customertype5", "Customer Type 5");

		modelAndView.addObject("typesOfCustomersMap", typesOfCustomersMap);
		modelAndView.addObject("productMasterURL", "product/save");
		modelAndView.setViewName(MastersPageConstants.PRODUCT_MASTER_MAIN_PAGE);
		return modelAndView;
	}

}
