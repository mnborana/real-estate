package com.vs.realestate.dao;

import java.util.List;

import com.vs.realestate.entity.Plotting;

public interface SalePlotDAO {

	List<Plotting> getPlotNames(String siteId);

}
