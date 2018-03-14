/**
 *Author : OMKAR SHIVADEKAR
 *Document : PlotService.java
 *Date : 11-Mar-2018
 *Time : 6:02:59 PM 
 */
package com.vs.realestate.service;

import java.util.List;

import com.vs.realestate.entity.AddSite;

public interface PlotService {

	public List<AddSite> getSiteNames();
	
	public List<AddSite> getSiteDetails(String siteId);
}
