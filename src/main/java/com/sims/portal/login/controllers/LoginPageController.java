package com.sims.portal.login.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sims.portal.beans.ErrorMessage;
import com.sims.portal.beans.ValidationResponse;
import com.sims.portal.beans.LoginForm;
import com.sims.portal.security.services.SecurityContextService;


@Controller
@RequestMapping("/login")
public class LoginPageController {

	private static final Logger logger = LoggerFactory.getLogger(LoginPageController.class);

	protected static final String LOGIN_INVALID_MSG_CODE = "login.failed.invalid.message";

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private SecurityContextService securityContextService;

	@RequestMapping(method = RequestMethod.GET)
	public String loginPage(ModelMap model, String error, String logout, Locale locale) {

		logger.debug("From Login Page Method ");

		model.addAttribute("LoginForm", new LoginForm());
		if (error != null) {
			model.addAttribute("error", messageSource.getMessage(LOGIN_INVALID_MSG_CODE, null, locale));
		}

		if (securityContextService.isUserAnonymous()) {
			return "login.page";
		}

		return "welcome.page";
	}

	
	@RequestMapping(value="validate",method=RequestMethod.POST)
	public @ResponseBody ValidationResponse processFormAjaxJson(Model model, @ModelAttribute(value="LoginForm") @Valid LoginForm loginForm, BindingResult result ){
		ValidationResponse res = new com.sims.portal.beans.ValidationResponse();
		if(!result.hasErrors()){
			res.setStatus("SUCCESS");
		}else{
			res.setStatus("FAIL");
			List<FieldError> allErrors = result.getFieldErrors();
			List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
			for (FieldError objectError : allErrors) {
				errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getDefaultMessage()));
			}
			res.setErrorMessageList(errorMesages);
			
		}
		
		return res;
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
