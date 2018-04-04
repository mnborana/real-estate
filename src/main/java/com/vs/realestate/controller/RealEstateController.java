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
import org.springframework.web.bind.annotation.GetMapping;
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
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;
import com.vs.realestate.entity.SalePlot;
import com.vs.realestate.service.OrgService;
import com.vs.realestate.service.PaymentService;
import com.vs.realestate.service.PlotService;
import com.vs.realestate.service.SalePlotService;
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
	SalePlotService salePlotService;

	@Autowired
	AddClientService clientService;
	
	@Autowired
	PaymentService thepaymentservice;
	
	Gson gson=new Gson();
	
	@RequestMapping("/hello")
	public String page()
	{
		return "dashboard";
	}
	
	//////////////////// ADDSITE ///////////////////////	
	

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
	//////////////////// ADDSITE ///////////////////////	

	
	//////////////////// SALEPLOT ///////////////////////	
	
	@RequestMapping("salePlot")
	public String salePlot(Model model) {
		
		model.addAttribute("salePlot", new SalePlot());
		
		//getting id,site names to show in dropDown
		List<AddSite> siteNames = thePlotService.getSiteNames();
		
		model.addAttribute("siteNames", siteNames);
		
		/*List<Plotting> plotNames = salePlotService.getPlotNames();
		model.addAttribute("plotNames", plotNames);*/

		return "/sale/salePlot";
	}
	
	//AJAX for getting site detail
	@RequestMapping(value="/plot.htm",method = RequestMethod.POST)
	public @ResponseBody String getPlots(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String siteId = request.getParameter("siteId");
		
		List<Plotting> plotNames = salePlotService.getPlotNames(siteId);
		
		response.setContentType("application/json");
		
		String json=gson.toJson(plotNames);
		
		return json;
		
	}
	
	//AJAX for getting plot Info
	/*@RequestMapping(value="/plotInfo.htm",method = RequestMethod.POST)
	public @ResponseBody String getPlotInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String plotId = request.getParameter("plotId");
		
		System.out.println(plotId);
		
		List<Plotting> plotNames = salePlotService.getPlotNames(siteId);
		
		response.setContentType("application/json");
		
		String json=gson.toJson(plotNames);
		
		return json;
		//return "";

	}*/

	//////////////////// SALEPLOT ///////////////////////	
	
	///////////////////PAYMENT  /////////////////////////
	@RequestMapping("/payment")
	public String listOfPaymentDetails(Model theModel)
	{
		
		theModel.addAttribute("payment",new Payment());
		
		/*//Fetch Payment Details
		List<Payment> thepaymentlist=thepaymentservice.getPaymentDetails();
		theModel.addAttribute("listOfPayments",thepaymentlist);*/
		
		//select Client 
		List<AddClient> selectClientList=thepaymentservice.selectClientsList();
		theModel.addAttribute("listOfClientsList",selectClientList);
		
		/*//select Plots
		List<Plotting> selectPlotting=thepaymentservice.selectPlots();
		theModel.addAttribute("selectPlotting",selectPlotting);*/
		
		/*//remaining Amount
		List<Payment> listRemAmt=thepaymentservice.selectRemainingAmt();
		theModel.addAttribute("listRemAmt",listRemAmt);
		
		//set Mode and its Values
		List<Installment> getMode=thepaymentservice.getModes();
		theModel.addAttribute("theModes",getMode);
		
		//set installments number
		List<Payment> theInstallmentNo=thepaymentservice.getInstallmentNo();
		theModel.addAttribute("installmentNo",theInstallmentNo);*/
		
		return "/payment/addPayment";
	}
	
	
	@PostMapping("/savePayment")
	public String savePaymentDetails(@ModelAttribute("payment") Payment thePayment)
	{
		thepaymentservice.savePayments(thePayment);
		
		return "redirect:/listPayment";
		
	}
	
	
	
	///////////////////PAYMENT  /////////////////////////
	
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
	public @ResponseBody String getUpdateMode(HttpServletRequest request,HttpServletResponse response) throws Exception {
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
		
		List<AddClient> theClientList = clientService.getClientListService();
		
		model.addAttribute("clientList", theClientList);
		
		return "/sale/addClient";
	}
	
	@PostMapping("/saveClient")
	public String saveClient(@ModelAttribute AddClient addClient, RedirectAttributes redirectAttrs){
		
		clientService.saveClientService(addClient);
		
		redirectAttrs.addFlashAttribute("result", "Client saved successfully");
		return "redirect:/addClient";
	}
	
	@PostMapping("/deleteClient")
	public String deleteClient(@RequestParam int clientDeleteId, RedirectAttributes redirectAttrs){
		
		clientService.deleteClientService(clientDeleteId);
		
		redirectAttrs.addFlashAttribute("result", "Record Deleted Successfully");
		
		return "redirect:/addClient";
	}
	
	
	@RequestMapping(value="/updateClient", method=RequestMethod.POST)
	public @ResponseBody String getUpdateClientData(HttpServletRequest request, HttpServletResponse response){
		
		String clientId = request.getParameter("clientId");
		System.out.println("clientId  "+clientId);
		List clientDetails = clientService.getclientDetailsService(Integer.parseInt(clientId));
		
		response.setContentType("application/json");
		Gson gson=new Gson();
		String json=gson.toJson(clientDetails);
		
		return json;
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
		
		theModel.addAttribute("delete", theOrg);
		
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
		
		//getting details to show in datatable
		//theModel.addAttribute("plotDetails", plotDetails);
		
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
		
		List plotDetails = thePlotService.getPlotDetatils(siteId);
		
		response.setContentType("application/json");
		
		String json=gson.toJson(siteDetails);
		
		/*String newJson = gson.toJson(plotDetails);
		
		String finalJson=json.concat(newJson);
		*/
		//json+=gson.toJson(plotDetails);
		
		System.out.println(json);
		
		return json;
	}
	
	@RequestMapping(value="/plotDetails.htm",method = RequestMethod.POST)
	public @ResponseBody String getPlotInfo(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String siteId = request.getParameter("siteid");
		
		List<Plotting> plotDetails = thePlotService.getPlotDetatils(siteId);
		
		//System.out.println("contr ---- "+plotDetails.toString());
		
		response.setContentType("application/json");
		
		String newJson = gson.toJson(plotDetails);
		
		return newJson;
	}
	
	@RequestMapping(value="/org.htm",method = RequestMethod.POST)
	public @ResponseBody String getOrgInfo(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String orgId = request.getParameter("orgId");
		
		List<Organization> orgDetails = theOrgService.getOrgDetails(orgId);
		
		response.setContentType("application/json");
		
		String json=gson.toJson(orgDetails);
		
		return json;
	}
	
	@PostMapping("/deleteOrg")
	public String deleteOrg(@RequestParam int id, RedirectAttributes redirectAttrs)
	{
		theOrgService.deleteOrg(id);
		
		redirectAttrs.addFlashAttribute("status", "Record Deleted Successfully");
		
		return "redirect:/organization";
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
