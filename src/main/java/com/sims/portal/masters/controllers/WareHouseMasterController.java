package com.sims.portal.masters.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sims.portal.masters.constants.MastersPageConstants;
import com.sims.portal.masters.services.WareHouseMasterService;
import com.sims.portal.model.masters.beans.WareHouseMasterForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value = "/master/warehouse")
@Controller
public class WareHouseMasterController {

	@Autowired
	private WareHouseMasterService wareHouseMasterService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showWareHouseMasterPage() {

		ModelAndView modelAndView = new ModelAndView();
		setDefaultDataForWareHouseMasterPage(modelAndView);

		// LIST PAGE DATA
		findWareHouseMasterDetails(modelAndView);

		return modelAndView;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveWareHouseMaster(
			@ModelAttribute("wareHouseMasterForm") WareHouseMasterForm wareHouseMasterForm) {

		ModelAndView modelAndView = new ModelAndView();
		log.info("WareHouseMasterForm " + wareHouseMasterForm.getName());
		wareHouseMasterService.saveWareHouseMaster(wareHouseMasterForm);
		setDefaultDataForWareHouseMasterPage(modelAndView);
		findWareHouseMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Saved Successfully !!!");

		return modelAndView;
	}

	public ModelAndView findWareHouseMasterDetails(ModelAndView modelAndView) {

		List<WareHouseMasterForm> wareHouseMasterFormList = wareHouseMasterService.findWareHouseMasterDetails();
		modelAndView.addObject("wareHouseMasterFormListData", wareHouseMasterFormList);

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{code}", method = RequestMethod.GET)
	public ModelAndView findWareHouseMasterDetailsByCode(@PathVariable(name = "code") String wareHouseMasterCode) {

		log.info("Code Received &&&&&&&&&&&&&&  " + wareHouseMasterCode);
		ModelAndView modelAndView = new ModelAndView();
		WareHouseMasterForm wareHouseMasterForm = wareHouseMasterService
				.findWareHouseMasterDetailsByCode(wareHouseMasterCode);
		modelAndView.addObject("wareHouseMasterForm", wareHouseMasterForm);
		findWareHouseMasterDetails(modelAndView);
		modelAndView.setViewName(MastersPageConstants.WARE_HOUSE_MASTER_MAIN_PAGE);
		modelAndView.addObject("tabToShow", "details");
		modelAndView.addObject("wareHouseMasterURL", "warehouse/update/" + wareHouseMasterForm.getId());

		return modelAndView;
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public ModelAndView updateWareHouseMaster(@PathVariable(name = "id") Long id,
			@ModelAttribute("wareHouseMasterForm") WareHouseMasterForm wareHouseMasterForm) {

		log.info("UPDATING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		log.info("UPDATE CODE === " + id);
		wareHouseMasterForm.setId(id);
		wareHouseMasterService.updateWareHouseMaster(wareHouseMasterForm);
		setDefaultDataForWareHouseMasterPage(modelAndView);
		findWareHouseMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Updated Successfully !!!");

		// modelAndView.setViewName("redirect:/master/wareHouse");

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteWareHouseMasterDetailsByCode(@PathVariable(name = "id") Long id,
			@ModelAttribute("wareHouseMasterForm") WareHouseMasterForm wareHouseMasterForm) {

		log.info("DELETING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		wareHouseMasterForm.setId(id);
		wareHouseMasterService.deleteWareHouseMaster(wareHouseMasterForm);
		setDefaultDataForWareHouseMasterPage(modelAndView);
		findWareHouseMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Deleted Successfully !!!");
		return modelAndView;
	}

	private ModelAndView setDefaultDataForWareHouseMasterPage(ModelAndView modelAndView) {

		modelAndView.addObject("wareHouseMasterForm", new WareHouseMasterForm());

		Map<String, String> typesOfCustomersMap = new HashMap<>();

		typesOfCustomersMap.put("customertype1", "Customer Type 1");
		typesOfCustomersMap.put("customertype2", "Customer Type 2");
		typesOfCustomersMap.put("customertype3", "Customer Type 3");
		typesOfCustomersMap.put("customertype4", "Customer Type 4");
		typesOfCustomersMap.put("customertype5", "Customer Type 5");

		modelAndView.addObject("typesOfCustomersMap", typesOfCustomersMap);
		modelAndView.addObject("wareHouseMasterURL", "warehouse/save");
		modelAndView.setViewName(MastersPageConstants.WARE_HOUSE_MASTER_MAIN_PAGE);
		return modelAndView;
	}

}
