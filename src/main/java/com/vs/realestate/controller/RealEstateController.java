/**
 *Author : OMKAR SHIVADEKAR
 *Document : RealEstateController.java
 *Date : 07-Mar-2018
 *Time : 5:40:05 PM 
 */
package com.vs.realestate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vs.realestate.entity.Installment;
import com.vs.realestate.service.InstallmentService;

@Controller
public class RealEstateController {
	
	@Autowired
	InstallmentService installmentService;

	@RequestMapping("/hello")
	public String page()
	{
		return "dashboard";
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
	
	
}
