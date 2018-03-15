package com.vs.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.SalePlotDAO;
import com.vs.realestate.entity.Plotting;

@Service
public class SalePlotServiceImpl implements SalePlotService {

	@Autowired
	SalePlotDAO salePlotDAO;
	
	@Override
	@Transactional
	public List<Plotting> getPlotNames() {
		
		return salePlotDAO.getPlotNames();
	}

}
