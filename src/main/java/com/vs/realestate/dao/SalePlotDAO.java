package com.vs.realestate.dao;

import java.util.Date;
import java.util.List;

import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Plotting;

public interface SalePlotDAO {

	List<Plotting> getPlotNames(String siteId);

	List<Plotting> getPlotInfo(String plotId);

	List<Installment> getModeInfo();

	void saveSalesPlot(String date, int site_id, int plot_id, int client_id, int mode_id, int token_amt, int price,
			int sqft, int length, int width, String plotName);

	List showSalePlots();
	
}
