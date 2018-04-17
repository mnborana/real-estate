package com.vs.realestate.service;

import java.util.Date;
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

	@Override
	@Transactional
	public List<Installment> getModeInfo() {
		return salePlotDAO.getModeInfo();
	}

	@Override
	@Transactional
	public void saveSalesPlot(String date, int site_id, int plot_id, int client_id, int mode_id, int token_amt,
			int price, int sqft, int length, int width, String plotName) {
		salePlotDAO.saveSalesPlot(date, site_id, plot_id, client_id, mode_id, token_amt, price, sqft, length, width, plotName);
	}

	@Override
	@Transactional
	public List showSalePlots() {
		return salePlotDAO.showSalePlots();
	}

}
