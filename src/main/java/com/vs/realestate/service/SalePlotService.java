package com.vs.realestate.service;

import java.util.List;

import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Plotting;

public interface SalePlotService {

	List<Plotting> getPlotNames(String siteId);

	List<Plotting> getPlotInfo(String plotId);

}
