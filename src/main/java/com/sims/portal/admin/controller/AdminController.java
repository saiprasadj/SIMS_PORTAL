package com.sims.portal.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sims.portal.model.user.UserDetails;
import com.sims.portal.user.services.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private AdminService adminService;

    @GetMapping("/profile")
    public String getProfile(ModelMap model) {

        return "profile.page";
    }

    
    @ModelAttribute("rolesMap")
    public Map<String,String> rolesMap() {
        return adminService.getAllRolesMap();
    }
    
    @GetMapping("/addNewUser")
    public String addNewUser(ModelMap model) {
        UserDetails userDetails = new UserDetails();
        model.addAttribute("userDetails", userDetails);
        return "addNewUser.page";
    }
    
    
    
}
