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
import com.sims.portal.masters.services.SectionMasterService;
import com.sims.portal.model.masters.beans.SectionMasterForm;

@RequestMapping(value = "/master/section")
@Controller
public class SectionMasterController {

	@Autowired
	private SectionMasterService sectionMasterService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showSectionMasterPage() {

		ModelAndView modelAndView = new ModelAndView();
		setDefaultDataForSectionMasterPage(modelAndView);

		// LIST PAGE DATA
		findSectionMasterDetails(modelAndView);

		return modelAndView;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveSectionMaster(@ModelAttribute("sectionMasterForm") SectionMasterForm sectionMasterForm) {

		ModelAndView modelAndView = new ModelAndView();
		System.out.println("SectionMasterForm " + sectionMasterForm.getName());
		sectionMasterService.saveSectionMaster(sectionMasterForm);
		setDefaultDataForSectionMasterPage(modelAndView);
		findSectionMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Saved Successfully !!!");

		return modelAndView;
	}

	public ModelAndView findSectionMasterDetails(ModelAndView modelAndView) {

		List<SectionMasterForm> sectionMasterFormList = sectionMasterService.findSectionMasterDetails();
		modelAndView.addObject("sectionMasterFormListData", sectionMasterFormList);

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{code}", method = RequestMethod.GET)
	public ModelAndView findSectionMasterDetailsByCode(@PathVariable(name = "code") String sectionMasterCode) {

		System.out.println("Code Received &&&&&&&&&&&&&&  " + sectionMasterCode);
		ModelAndView modelAndView = new ModelAndView();
		SectionMasterForm sectionMasterForm = sectionMasterService.findSectionMasterDetailsByCode(sectionMasterCode);
		modelAndView.addObject("sectionMasterForm", sectionMasterForm);
		findSectionMasterDetails(modelAndView);
		modelAndView.setViewName(MastersPageConstants.SECTION_MASTER_MAIN_PAGE);
		modelAndView.addObject("tabToShow", "details");
		modelAndView.addObject("sectionMasterURL", "section/update/" + sectionMasterForm.getId());

		return modelAndView;
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public ModelAndView updateSectionMaster(@PathVariable(name = "id") Long id,
			@ModelAttribute("sectionMasterForm") SectionMasterForm sectionMasterForm) {

		System.out.println("UPDATING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("UPDATE CODE === " + id);
		sectionMasterForm.setId(id);
		sectionMasterService.updateSectionMaster(sectionMasterForm);
		setDefaultDataForSectionMasterPage(modelAndView);
		findSectionMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Updated Successfully !!!");

		// modelAndView.setViewName("redirect:/master/section");

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteSectionMasterDetailsByCode(@PathVariable(name = "id") Long id,
			@ModelAttribute("sectionMasterForm") SectionMasterForm sectionMasterForm) {

		System.out.println("DELETING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		sectionMasterForm.setId(id);
		sectionMasterService.deleteSectionMaster(sectionMasterForm);
		setDefaultDataForSectionMasterPage(modelAndView);
		findSectionMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Deleted Successfully !!!");
		return modelAndView;
	}

	private ModelAndView setDefaultDataForSectionMasterPage(ModelAndView modelAndView) {

		modelAndView.addObject("sectionMasterForm", new SectionMasterForm());

		HashMap<String, String> typesOfCustomersMap = new HashMap<String, String>();

		typesOfCustomersMap.put("customertype1", "Customer Type 1");
		typesOfCustomersMap.put("customertype2", "Customer Type 2");
		typesOfCustomersMap.put("customertype3", "Customer Type 3");
		typesOfCustomersMap.put("customertype4", "Customer Type 4");
		typesOfCustomersMap.put("customertype5", "Customer Type 5");

		modelAndView.addObject("typesOfCustomersMap", typesOfCustomersMap);
		modelAndView.addObject("sectionMasterURL", "section/save");
		modelAndView.setViewName(MastersPageConstants.SECTION_MASTER_MAIN_PAGE);
		return modelAndView;
	}

}
