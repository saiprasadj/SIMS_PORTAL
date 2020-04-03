package com.sims.portal.tankprocess.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sims.portal.models.tankprocess.beans.DailyTankRecordingForm;
import com.sims.portal.tankprocess.constants.TankProcessConstants;
import com.sims.portal.tankprocess.services.DailyTankRecordingService;

@Controller
@RequestMapping(value = TankProcessConstants.TILES_DAILY_TANK_RECORDING_CONTROLLER_MAIN_URL)
public class DailyTankRecordingController {

	@Autowired
	private DailyTankRecordingService dailyTankRecordingService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showDailyTankRecordingForm() {

		ModelAndView modelAndView = new ModelAndView();

		findAllDailyTankRecordingForm(modelAndView);
		modelAndView.addObject("dailyTankRecordingForm", new DailyTankRecordingForm());
		modelAndView.addObject("dailyTankRecordingURL",
				TankProcessConstants.TILES_DAILY_TANK_RECORDING_CONTROLLER_SAVE_URL);
		modelAndView.setViewName(TankProcessConstants.TILES_DAILY_TANK_RECORDING_CONTROLLER_SHOW_MAIN_JSP);

		return modelAndView;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveAccountMaster(
			@ModelAttribute("dailyTankRecordingForm") DailyTankRecordingForm dailyTankRecordingForm) {

		ModelAndView modelAndView = new ModelAndView();
		dailyTankRecordingService.saveDailyTankRecordingForm(dailyTankRecordingForm);
		setDefaultDataForDailyTankRecordingPage(modelAndView);
		findAllDailyTankRecordingForm(modelAndView);
		modelAndView.addObject("message", "Data Saved Successfully !!!");

		return modelAndView;
	}

	public ModelAndView findAllDailyTankRecordingForm(ModelAndView modelAndView) {

		List<DailyTankRecordingForm> dailyTankRecordingFormListData = dailyTankRecordingService
				.findDailyTankRecordingForm();
		modelAndView.addObject("dailyTankRecordingFormListData", dailyTankRecordingFormListData);

		return modelAndView;
	}

	private ModelAndView setDefaultDataForDailyTankRecordingPage(ModelAndView modelAndView) {

		modelAndView.addObject("dailyTankRecordingForm", new DailyTankRecordingForm());
		modelAndView.addObject("dailyTankRecordingURL",
				TankProcessConstants.TILES_DAILY_TANK_RECORDING_CONTROLLER_SAVE_URL);
		modelAndView.setViewName(TankProcessConstants.TILES_DAILY_TANK_RECORDING_CONTROLLER_SHOW_MAIN_JSP);

		return modelAndView;
	}

}
