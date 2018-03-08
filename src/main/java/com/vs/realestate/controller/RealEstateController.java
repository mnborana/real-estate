/**
 *Author : OMKAR SHIVADEKAR
 *Document : RealEstateController.java
 *Date : 07-Mar-2018
 *Time : 5:40:05 PM 
 */
package com.vs.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RealEstateController {

	@RequestMapping("/hello")
	public String page()
	{
		return "dashboard";
	}
}
