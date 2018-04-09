package com.vs.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.SalePlotDAO;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Plotting;

@Service
public class SalePlotServiceImpl implements SalePlotService {

	@Autowired
	SalePlotDAO salePlotDAO;
	
	@Override
	@Transactional
	public List<Plotting> getPlotNames(String siteId) {
		
		return salePlotDAO.getPlotNames(siteId);
	}

	@Override
	@Transactional
	public List<Plotting> getPlotInfo(String plotId) {
		return salePlotDAO.getPlotInfo(plotId);
	}

}
