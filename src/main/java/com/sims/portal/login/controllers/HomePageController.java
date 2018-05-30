package com.sims.portal.login.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.sims.portal.beans.ForgotPassword;
import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.services.utils.DefaultUserDetails;
import com.sims.portal.user.services.AdminService;

@Controller
public class HomePageController {

	@Autowired
	private AdminService adminService;

	@GetMapping(value = { "/", "/welcome" })
	public String homePage(ModelMap model) {

		DefaultUserDetails principal = (DefaultUserDetails) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal();
		UserCredentials details = adminService
				.findUserCredential(Integer.parseInt(principal.getUsername()));
		if (details.getChangePassword() == 1) {
			model.put("changepasswrod", new ForgotPassword());
			return "changepassword.page";
		}

		return "welcome.page";
	}

}