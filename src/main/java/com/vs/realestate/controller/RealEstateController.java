/**
 *Author : OMKAR SHIVADEKAR
 *Document : RealEstateController.java
 *Date : 07-Mar-2018
 *Time : 5:40:05 PM 
 */
package com.vs.realestate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.service.InstallmentService;
import com.vs.realestate.entity.Organization;
import com.vs.realestate.service.OrgService;
import com.google.gson.Gson;
import com.vs.realestate.entity.AddSite;
import com.vs.realestate.service.AddSiteService;


@Controller
public class RealEstateController {
	
	@Autowired
	InstallmentService installmentService;

	@Autowired
	AddSiteService addSiteService; 
	
	@Autowired
	OrgService theOrgService;
	
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

	
	//////////////////// INSTALLMENT ///////////////////////
	
	@RequestMapping("/addInstallments")
	public String addInstallments(Model model)
	{	
		model.addAttribute("installments", new Installment());
		
		List<Installment> installmentList = installmentService.getServiceInstallmentsList();
		System.out.println(installmentList);
		model.addAttribute("installmentsList", installmentList);
		
		return "/settings/installment";
	}
	
	@PostMapping("/saveInstallments")
	public String saveInstallments(@RequestParam String modeName[], @RequestParam int noOfInstallment[], Model model, RedirectAttributes redirectAttrs){
		
		installmentService.saveInstallment(modeName, noOfInstallment);
		
		List<Installment> installmentList = installmentService.getServiceInstallmentsList();
		System.out.println(installmentList);
		model.addAttribute("installmentsList", installmentList);
		
		model.addAttribute("installments", new Installment());
		
		redirectAttrs.addFlashAttribute("result", "Mode Saved Successfully");
		
		return "redirect:/addInstallments";
	}
	
	
	@PostMapping("/getLastMode")
	public @ResponseBody String getLastMode(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String lastModeStatus = request.getParameter("getLastMode");
		String lastMode = "";
		
		if(lastModeStatus.equals("1")){
			lastMode = installmentService.getServiceLastMode();
		}
		
		response.setContentType("application/json");
		Gson gson=new Gson();
		String json=gson.toJson(lastMode);
		return json;
	}
	
	/*
	@RequestMapping("/check")     
	@ResponseBody
	public String check(@RequestParam Integer id, HttpServletRequest request, HttpServletResponse response, Model model) {
	    boolean a = getSomeResult();
	    if (a == true) {
	        model.addAttribute("alreadySaved", true);
	        return view;
	    } else {
	        model.addAttribute("alreadySaved", false);
	        return view;
	    }
	}*/
	
	
	////////////////////// INSTALLMENT /////////////////////////
	
	@RequestMapping("/organization")
	public String organization(Model theModel)
	{	
		//created modelAttribue to bind the insert form data
		Organization theOrg = new Organization();
		theModel.addAttribute("orgnization", theOrg);
		
		return "/settings/organization";
	}
	
	@PostMapping("/saveOrganization")
	public String saveOrg(@ModelAttribute("orgnization") Organization theOrg, RedirectAttributes rda)
	{
		theOrgService.saveOrg(theOrg);
		
		rda.addFlashAttribute("status", "Save Successfully");
		
		return "redirect:/organization";
	}
}
