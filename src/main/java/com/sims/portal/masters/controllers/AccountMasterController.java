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
import com.sims.portal.masters.services.AccountMasterService;
import com.sims.portal.model.masters.beans.AccountMasterForm;

@RequestMapping(value = "/master/account")
@Controller
public class AccountMasterController {

	@Autowired
	private AccountMasterService accountMasterService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showAccountMasterPage() {

		ModelAndView modelAndView = new ModelAndView();
		setDefaultDataForAccountMasterPage(modelAndView);

		// LIST PAGE DATA
		findAccountMasterDetails(modelAndView);

		return modelAndView;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveAccountMaster(@ModelAttribute("accountMasterForm") AccountMasterForm accountMasterForm) {

		ModelAndView modelAndView = new ModelAndView();
		System.out.println("AccountMasterForm " + accountMasterForm.getName());
		accountMasterService.saveAccountMaster(accountMasterForm);
		setDefaultDataForAccountMasterPage(modelAndView);
		findAccountMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Saved Successfully !!!");

		return modelAndView;
	}

	public ModelAndView findAccountMasterDetails(ModelAndView modelAndView) {

		List<AccountMasterForm> accountMasterFormList = accountMasterService.findAccountMasterDetails();
		modelAndView.addObject("accountMasterFormListData", accountMasterFormList);

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{code}", method = RequestMethod.GET)
	public ModelAndView findAccountMasterDetailsByCode(@PathVariable(name = "code") String accountMasterCode) {

		System.out.println("Code Received &&&&&&&&&&&&&&  " + accountMasterCode);
		ModelAndView modelAndView = new ModelAndView();
		AccountMasterForm accountMasterForm = accountMasterService.findAccountMasterDetailsByCode(accountMasterCode);
		modelAndView.addObject("accountMasterForm", accountMasterForm);
		findAccountMasterDetails(modelAndView);
		modelAndView.setViewName(MastersPageConstants.ACCOUNT_MASTER_MAIN_PAGE);
		modelAndView.addObject("tabToShow", "details");
		modelAndView.addObject("accountMasterURL", "account/update/" + accountMasterForm.getId());

		return modelAndView;
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public ModelAndView updateAccountMaster(@PathVariable(name = "id") Long id,
			@ModelAttribute("accountMasterForm") AccountMasterForm accountMasterForm) {

		System.out.println("UPDATING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("UPDATE CODE === " + id);
		accountMasterForm.setId(id);
		accountMasterService.updateAccountMaster(accountMasterForm);
		setDefaultDataForAccountMasterPage(modelAndView);
		findAccountMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Updated Successfully !!!");
		
		//modelAndView.setViewName("redirect:/master/account");

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteAccountMasterDetailsByCode(@PathVariable(name = "id") Long id,
			@ModelAttribute("accountMasterForm") AccountMasterForm accountMasterForm) {

		System.out.println("DELETING ID =========== " + id);
		ModelAndView modelAndView = new ModelAndView();
		accountMasterForm.setId(id);
		accountMasterService.deleteAccountMaster(accountMasterForm);
		setDefaultDataForAccountMasterPage(modelAndView);
		findAccountMasterDetails(modelAndView);
		modelAndView.addObject("message", "Data Deleted Successfully !!!");
		return modelAndView;
	}

	private ModelAndView setDefaultDataForAccountMasterPage(ModelAndView modelAndView) {

		modelAndView.addObject("accountMasterForm", new AccountMasterForm());

		HashMap<String, String> typesOfCustomersMap = new HashMap<String, String>();

		typesOfCustomersMap.put("customertype1", "Customer Type 1");
		typesOfCustomersMap.put("customertype2", "Customer Type 2");
		typesOfCustomersMap.put("customertype3", "Customer Type 3");
		typesOfCustomersMap.put("customertype4", "Customer Type 4");
		typesOfCustomersMap.put("customertype5", "Customer Type 5");

		modelAndView.addObject("typesOfCustomersMap", typesOfCustomersMap);
		modelAndView.addObject("accountMasterURL", "account/save");
		modelAndView.setViewName(MastersPageConstants.ACCOUNT_MASTER_MAIN_PAGE);
		return modelAndView;
	}

}
