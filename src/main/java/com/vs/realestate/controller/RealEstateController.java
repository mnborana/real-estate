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
import com.vs.realestate.service.AddClientService;
import com.vs.realestate.service.AddSiteService;
import com.vs.realestate.service.InstallmentService;
import com.vs.realestate.entity.Organization;
import com.vs.realestate.entity.Plotting;
import com.vs.realestate.service.OrgService;
import com.vs.realestate.service.PlotService;
import com.google.gson.Gson;
import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.AddSite;

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
	
	@Autowired
	AddClientService clientService;
	
	Gson gson=new Gson();
	
	
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
	public String deleteSite(@ModelAttribute("delete") AddSite site,  RedirectAttributes rda) {
		
		addSiteService.deleteSite(site.getId());

		rda.addFlashAttribute("status", "Record Deleted");
		
		return "redirect:/addSite";
	}	
	
	
	//AJAX for updating site detail
	@RequestMapping(value="/site.htm",method = RequestMethod.POST)
	public @ResponseBody String updateSite(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String siteId = request.getParameter("siteId");
		
		List siteDetail = addSiteService.getSiteInfoForUpdate(siteId);
		
		System.out.println("Ajax -> "+siteId);
		
		response.setContentType("application/json");
		
		String json=gson.toJson(siteDetail);
				
		return json;
	}
	
	
	//////////////////// INSTALLMENT ///////////////////////
	
	@RequestMapping("/addInstallments")
	public String addInstallments(Model model)
	{	
		model.addAttribute("installments", new Installment());
		
		List<Installment> installmentList = installmentService.getServiceInstallmentsList();
		
		model.addAttribute("installmentsList", installmentList);
		
		return "/settings/installment";
	}
	
	
	@PostMapping("/saveInstallments")
	public String saveInstallments(@ModelAttribute Installment installment, @RequestParam String modeName[], @RequestParam int noOfInstallment[], Model model, RedirectAttributes redirectAttrs){
		
		installmentService.saveInstallment(installment, modeName, noOfInstallment);
		List<Installment> installmentList = installmentService.getServiceInstallmentsList();
		
		model.addAttribute("installmentsList", installmentList);
		
		model.addAttribute("installments", new Installment());
		
		redirectAttrs.addFlashAttribute("result", "Mode Saved Successfully");
		
		return "redirect:/addInstallments";
	}
	
	
	@RequestMapping(value="/getLastMode.htm", method=RequestMethod.POST)
	public @ResponseBody String getLastMode(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String lastModeStatus = request.getParameter("getLastMode");
		
		String lastMode = "";
		
		if(lastModeStatus!=null){
			if( lastModeStatus.equals("1")){
				lastMode = installmentService.getServiceLastMode();
			}
		}
		
		return lastMode;
		
	}
	
	@PostMapping("deleteMode")
	public String deleteMode(@RequestParam int modeDeleteId, RedirectAttributes redirectAttrs){
		
		installmentService.deleteServiceMode(modeDeleteId);
		
		redirectAttrs.addFlashAttribute("result", "Record Deleted Successfully");
		
		return "redirect:/addInstallments";
		
	}
	
	@RequestMapping(value="/updateMode",method = RequestMethod.POST)
	public @ResponseBody String searchEmployee(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String updateId = request.getParameter("updateId");
		
		List modeDetails = installmentService.getServiceModeUpdate(Integer.parseInt(updateId));

		response.setContentType("application/json");
		Gson gson=new Gson();
		String json=gson.toJson(modeDetails);
		
		return json;
	}
	
	////////////////////// INSTALLMENT /////////////////////////
	
	
	
	////////////////////// ADD CLIENT /////////////////////////
	
	@RequestMapping("/addClient")
	public String addClient(Model model){
		
		model.addAttribute("clients", new AddClient());
		
		List<AddClient> theClientList = clientService.getClientListDao();
		
		model.addAttribute("clientList", theClientList);
		
		return "/sale/addClient";
	}
	
	@PostMapping("/saveClient")
	public String saveClient(@ModelAttribute AddClient addClient){
		
		clientService.saveClientService(addClient);
		
		return "redirect:/addClient";
	}
	
	@PostMapping("/deleteClient")
	public String deleteClient(@RequestParam int clientDeleteId, RedirectAttributes redirectAttrs){
		
		clientService.deleteClientService(clientDeleteId);
		
		redirectAttrs.addFlashAttribute("result", "Record Deleted Successfully");
		
		return "redirect:/addClient";
	}
	
	
	////////////////////// ADD CLIENT /////////////////////////
	
	
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
		theModel.addAttribute("siteNames", siteNames);
		
		//for inserting data
		Plotting thePlot = new Plotting();
		theModel.addAttribute("plotes", thePlot);
		
		return "/purchase/plotting";
	}
	
	@RequestMapping(value="/siteinfo.htm",method = RequestMethod.POST)
	public @ResponseBody String getSiteInfo(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String siteId = request.getParameter("siteid");
		
		List<AddSite> siteDetails = thePlotService.getSiteDetails(siteId);
		
		response.setContentType("application/json");
		
		String json=gson.toJson(siteDetails);
		
		System.out.println(siteDetails.toString());
		
		return json;
	}
	
	@PostMapping("/savePlotes")
	public String savePlotes(@RequestParam int site_id, @RequestParam String plot_name[], @RequestParam int length[],
			@RequestParam int width[],@RequestParam int sqft[],@RequestParam int amt[],RedirectAttributes rda)
	{
		thePlotService.savePlotes(site_id,plot_name,length,width,sqft,amt);
		
		rda.addFlashAttribute("status", "Save Successfully");
		
		return "redirect:/plotting";
	}
}
