/**
 *Author : OMKAR SHIVADEKAR
 *Document : PlotDAO.java
 *Date : 11-Mar-2018
 *Time : 6:13:34 PM 
 */
package com.vs.realestate.dao;

import java.util.List;

import com.vs.realestate.entity.AddSite;

public interface PlotDAO {
	
	public List<AddSite> getSiteNames();
	
	public List<AddSite> getSiteDetails(String siteId);
	
	public void savePlotes(int siteid,String plotName[],int len[],int width[],int sqft[],int amt[]);

}
