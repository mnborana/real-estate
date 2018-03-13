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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.service.InstallmentService;
import com.vs.realestate.entity.Organization;
import com.vs.realestate.service.OrgService;
import com.vs.realestate.service.PlotService;
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
	
	@Autowired
	PlotService thePlotService;
	
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
		//getting data to show in datatable
		List<Organization> orgDetails = theOrgService.getOrgDetails();
		
		//adding details into model
		theModel.addAttribute("orgDetails",orgDetails);
		
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
	
	@RequestMapping("/plotting")
	public String plotting(Model theModel)
	{
		//getting id,site names to show in dropDown
		List<AddSite> siteNames = thePlotService.getSiteNames();
		
		//System.out.println(siteNames.get(0).getSiteName());
		
		//adding names into model
		theModel.addAttribute("siteNames", siteNames);
		
		return "/purchase/plotting";
	}
	
	@RequestMapping(value="/siteinfo.htm",method = RequestMethod.POST)
	public @ResponseBody String getSiteInfo(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String siteId = request.getParameter("siteid");
		
		List<AddSite> siteDetails = thePlotService.getSiteDetails(siteId);
		
		System.out.println(siteDetails.toString());
		
		return "working";
	}
}
