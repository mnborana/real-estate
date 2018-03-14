/**
 *Author : OMKAR SHIVADEKAR
 *Document : PlotServiceImpl.java
 *Date : 11-Mar-2018
 *Time : 6:05:01 PM 
 */
package com.vs.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.PlotDAO;
import com.vs.realestate.entity.AddSite;

@Service
public class PlotServiceImpl implements PlotService {

	@Autowired
	PlotDAO thePlotDAO;
	
	@Transactional
	@Override
	public List<AddSite> getSiteNames() {

		return thePlotDAO.getSiteNames();
	}

	@Transactional
	@Override
	public List<AddSite> getSiteDetails(String siteId) {

		return thePlotDAO.getSiteDetails(siteId);
	}

	@Transactional
	@Override
	public void savePlotes(int siteid, String[] plotName, int[] len, int[] width, int[] sqft, int[] amt) {

		thePlotDAO.savePlotes(siteid,plotName,len,width,sqft,amt);
	}

}
