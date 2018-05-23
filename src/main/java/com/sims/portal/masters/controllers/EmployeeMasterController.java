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
import com.sims.portal.masters.services.EmployeeMasterService;
import com.sims.portal.model.masters.beans.EmployeeMasterForm;

@RequestMapping(value = "/master/employee")
@Controller
public class EmployeeMasterController {

	@Autowired
	private EmployeeMasterService employeeMasterService;

	@Autowired
	private DepartmentMasterService departmentMasterService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showEmployeeMasterPage() {

		ModelAndView modelAndView = new ModelAndView();
		setDefaultDataForEmployeeMasterPage(modelAndView);

		// LIST PAGE DATA
		findEmployeeMasterDetails(modelAndView);

		return modelAndView;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveEmployeeMaster(
			@ModelAttribute("employeeMasterForm") EmployeeMasterForm employeeMasterForm) {

		ModelAndView modelAndView = new ModelAndView();
		System.out.println("EmployeeMasterForm " + employeeMasterForm.getName());
		employeeMasterService.saveEmployeeMaster(employeeMasterForm);
		setDefaultDataForEmployeeMasterPage(modelAndView);
		findEmployeeMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Saved Successfully !!!");

		return modelAndView;
	}

	public ModelAndView findEmployeeMasterDetails(ModelAndView modelAndView) {

		List<EmployeeMasterForm> employeeMasterFormList = employeeMasterService.findEmployeeMasterDetails();
		modelAndView.addObject("employeeMasterFormListData", employeeMasterFormList);

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{code}", method = RequestMethod.GET)
	public ModelAndView findEmployeeMasterDetailsByCode(@PathVariable(name = "code") String employeeMasterCode) {

		System.out.println("Code Received &&&&&&&&&&&&&&  " + employeeMasterCode);
		ModelAndView modelAndView = new ModelAndView();
		EmployeeMasterForm employeeMasterForm = employeeMasterService
				.findEmployeeMasterDetailsByCode(employeeMasterCode);
		modelAndView.addObject("employeeMasterForm", employeeMasterForm);
		findEmployeeMasterDetails(modelAndView);
		modelAndView.setViewName(MastersPageConstants.EMPLOYEE_MASTER_MAIN_PAGE);
		modelAndView.addObject("tabToShow", "details");
		modelAndView.addObject("employeeMasterURL", "employee/update/" + employeeMasterForm.getId());

		return modelAndView;
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public ModelAndView updateEmployeeMaster(@PathVariable(name = "id") Long id,
			@ModelAttribute("employeeMasterForm") EmployeeMasterForm employeeMasterForm) {

		System.out.println("UPDATING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("UPDATE CODE === " + id);
		employeeMasterForm.setId(id);
		employeeMasterService.updateEmployeeMaster(employeeMasterForm);
		setDefaultDataForEmployeeMasterPage(modelAndView);
		findEmployeeMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Updated Successfully !!!");

		// modelAndView.setViewName("redirect:/master/employee");

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteEmployeeMasterDetailsByCode(@PathVariable(name = "id") Long id,
			@ModelAttribute("employeeMasterForm") EmployeeMasterForm employeeMasterForm) {

		System.out.println("DELETING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		employeeMasterForm.setId(id);
		employeeMasterService.deleteEmployeeMaster(employeeMasterForm);
		setDefaultDataForEmployeeMasterPage(modelAndView);
		findEmployeeMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Deleted Successfully !!!");
		return modelAndView;
	}

	private ModelAndView setDefaultDataForEmployeeMasterPage(ModelAndView modelAndView) {

		modelAndView.addObject("employeeMasterForm", new EmployeeMasterForm());

		HashMap<String, String> departmentCodesMap = departmentMasterService.getDepartmentCodes();
		modelAndView.addObject("departmentCodesMap", departmentCodesMap);
		modelAndView.addObject("employeeMasterURL", "employee/save");
		modelAndView.setViewName(MastersPageConstants.EMPLOYEE_MASTER_MAIN_PAGE);
		return modelAndView;
	}

}
