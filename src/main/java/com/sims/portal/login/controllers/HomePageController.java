package com.sims.portal.login.controllers;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sims.portal.beans.ForgotPassword;
import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.services.utils.DefaultUserDetails;
import com.sims.portal.user.dao.AdminDao;
import com.sims.portal.user.services.AdminService;

@Controller
public class HomePageController {

	@Autowired
	AdminService adminService;
	@Autowired
	AdminDao adminDao;

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {

		DefaultUserDetails principal = (DefaultUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		UserCredentials details = adminService.findUserCredential(Integer.parseInt(principal.getUsername()));
		if (details.getChangePassword() == 1) {
			model.put("changepasswrod", new ForgotPassword());
			return "changepassword.page";
		}

		return "welcome.page";
	}

	public String getpassword() {
		int leftLimit = 97;
		int rightLimit = 122;
		int targetStringLength = 10;
		StringBuilder buffer = new StringBuilder(targetStringLength);
		for (int i = 0; i < targetStringLength; i++) {
			int randomLimitedInt = leftLimit + (int) (new Random().nextFloat() * (rightLimit - leftLimit + 1));
			buffer.append((char) randomLimitedInt);
		}
		return buffer.toString();
	}

}