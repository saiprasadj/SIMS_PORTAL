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
import com.sims.portal.masters.services.DepartmentMasterService;
import com.sims.portal.model.masters.beans.DepartmentMasterForm;

@RequestMapping(value = "/master/department")
@Controller
public class DepartmentMasterController {

	@Autowired
	private DepartmentMasterService departmentMasterService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showDepartmentMasterPage() {

		ModelAndView modelAndView = new ModelAndView();
		setDefaultDataForDepartmentMasterPage(modelAndView);

		// LIST PAGE DATA
		findDepartmentMasterDetails(modelAndView);

		return modelAndView;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveDepartmentMaster(
			@ModelAttribute("departmentMasterForm") DepartmentMasterForm departmentMasterForm) {

		ModelAndView modelAndView = new ModelAndView();
		System.out.println("DepartmentMasterForm " + departmentMasterForm.getName());
		departmentMasterService.saveDepartmentMaster(departmentMasterForm);
		setDefaultDataForDepartmentMasterPage(modelAndView);
		findDepartmentMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Saved Successfully !!!");

		return modelAndView;
	}

	public ModelAndView findDepartmentMasterDetails(ModelAndView modelAndView) {

		List<DepartmentMasterForm> departmentMasterFormList = departmentMasterService
				.findDepartmentMasterDetails();
		modelAndView.addObject("departmentMasterFormListData", departmentMasterFormList);

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{code}", method = RequestMethod.GET)
	public ModelAndView findDepartmentMasterDetailsByCode(
			@PathVariable(name = "code") String departmentMasterCode) {

		System.out.println("Code Received &&&&&&&&&&&&&&  " + departmentMasterCode);
		ModelAndView modelAndView = new ModelAndView();
		DepartmentMasterForm departmentMasterForm = departmentMasterService
				.findDepartmentMasterDetailsByCode(departmentMasterCode);
		modelAndView.addObject("departmentMasterForm", departmentMasterForm);
		findDepartmentMasterDetails(modelAndView);
		modelAndView.setViewName(MastersPageConstants.DEPARTMENT_MASTER_MAIN_PAGE);
		modelAndView.addObject("tabToShow", "details");
		modelAndView.addObject("departmentMasterURL",
				"department/update/" + departmentMasterForm.getId());

		return modelAndView;
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public ModelAndView updateDepartmentMaster(@PathVariable(name = "id") Long id,
			@ModelAttribute("departmentMasterForm") DepartmentMasterForm departmentMasterForm) {

		System.out.println("UPDATING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("UPDATE CODE === " + id);
		departmentMasterForm.setId(id);
		departmentMasterService.updateDepartmentMaster(departmentMasterForm);
		setDefaultDataForDepartmentMasterPage(modelAndView);
		findDepartmentMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Updated Successfully !!!");

		// modelAndView.setViewName("redirect:/master/department");

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteDepartmentMasterDetailsByCode(
			@PathVariable(name = "id") Long id,
			@ModelAttribute("departmentMasterForm") DepartmentMasterForm departmentMasterForm) {

		System.out.println("DELETING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		departmentMasterForm.setId(id);
		departmentMasterService.deleteDepartmentMaster(departmentMasterForm);
		setDefaultDataForDepartmentMasterPage(modelAndView);
		findDepartmentMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Deleted Successfully !!!");
		return modelAndView;
	}

	private ModelAndView setDefaultDataForDepartmentMasterPage(
			ModelAndView modelAndView) {

		modelAndView.addObject("departmentMasterForm", new DepartmentMasterForm());

		HashMap<String, String> typesOfCustomersMap = new HashMap<String, String>();

		typesOfCustomersMap.put("customertype1", "Customer Type 1");
		typesOfCustomersMap.put("customertype2", "Customer Type 2");
		typesOfCustomersMap.put("customertype3", "Customer Type 3");
		typesOfCustomersMap.put("customertype4", "Customer Type 4");
		typesOfCustomersMap.put("customertype5", "Customer Type 5");

		modelAndView.addObject("typesOfCustomersMap", typesOfCustomersMap);
		modelAndView.addObject("departmentMasterURL", "department/save");
		modelAndView.setViewName(MastersPageConstants.DEPARTMENT_MASTER_MAIN_PAGE);
		return modelAndView;
	}

}
