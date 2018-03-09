/**
 *Author : OMKAR SHIVADEKAR
 *Document : RealEstateController.java
 *Date : 07-Mar-2018
 *Time : 5:40:05 PM 
 */
package com.vs.realestate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vs.realestate.entity.AddSite;
import com.vs.realestate.service.AddSiteService;


@Controller
public class RealEstateController {

	@Autowired
	 AddSiteService addSiteService; 
	
	
	@RequestMapping("/hello")
	public String page()
	{
		return "dashboard";
	}
	
	@RequestMapping("addSite")
	public String addSite(Model model) {
		
		List<AddSite> theSite = addSiteService.getSites();
		
		model.addAttribute("sites", theSite);
		
		model.addAttribute("addSite", new AddSite());
		
		return "/purchase/addSite";
	}
	
	@PostMapping("/saveSite")
	public String saveSite(@ModelAttribute("addSite") AddSite addSite) {
		
		System.out.println(addSite);
		
		addSiteService.saveSite(addSite);
		
//		rda.addFlashAttribute("STATUS", "Site Added Successfully");
		
		return "redirect: /real-estate/addSite";
	}
}
