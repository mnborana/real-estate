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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.vs.realestate.entity.AddSite;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Organization;
import com.vs.realestate.service.AddSiteService;
import com.vs.realestate.service.InstallmentService;
import com.vs.realestate.service.OrgService;

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
		
		
		AddSite addSite = new AddSite();
		model.addAttribute("delete", addSite);
		
		model.addAttribute("addSite", new AddSite());
		
		return "/purchase/addSite";
	}
	
	@PostMapping("/saveSite")
	public String saveSite(@ModelAttribute("addSite") AddSite addSite, RedirectAttributes rda) {
		
		System.out.println(addSite);
		
		addSiteService.saveSite(addSite);
		
		rda.addFlashAttribute("status", "Site Save Successfully");
		
		return "redirect:/addSite";
	}	

	@RequestMapping("/deleteSite")
	public String deleteCustomer(@ModelAttribute("delete") AddSite site,  RedirectAttributes rda) {
		
		addSiteService.deleteSite(site.getId());

		rda.addFlashAttribute("status", "Record Deleted");
		
		return "redirect:/addSite";
	}	
	
	
	//AJAX for updating site detail
	@RequestMapping(value="/site.htm",method = RequestMethod.POST)
	public String updateSite(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String siteId = request.getParameter("siteId");
		
		List siteDetail = addSiteService.getSiteInfoForUpdate(siteId);
		
		response.setContentType("application/json");
		
		Gson gson=new Gson();
		
		String json=gson.toJson(siteDetail);
		
		System.out.println(json);
		
		return json;
	}
	
	
	@RequestMapping("/addInstallments")
	public String addInstallments(Model model)
	{	
		model.addAttribute("installments", new Installment());
		return "/settings/installment";
	}
	
	@PostMapping("/saveInstallments")
	public String saveInstallments(@RequestParam String modeName[], @RequestParam int noOfInstallment[], Model model, RedirectAttributes redirectAttrs){
		
		installmentService.saveInstallment(modeName, noOfInstallment);
		ModelAndView mv = new ModelAndView();
		
		model.addAttribute("installments", new Installment());
		redirectAttrs.addFlashAttribute("result", "Save Successfully");
		return "redirect:/addInstallments";
	}
	
	
	
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
