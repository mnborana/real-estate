package com.vs.realestate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vs.realestate.entity.Plotting;

@Repository
public class SalePlotDAOImpl implements SalePlotDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Plotting> getPlotNames() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("select id, plot_name from Plotting where site_id=1");
		
		List<Object[]> plotList = query.getResultList();
		
		List<Plotting> plotDetsils = new ArrayList<>();
		
		for (Object[] temp : plotList) {
			Plotting plotting = new Plotting();
			
			plotting.setId((Integer)temp[0]);
			plotting.setPlot_name((String)temp[1]);
			plotDetsils.add(plotting);
		}
		System.out.println(plotDetsils);
		return plotDetsils;
	}

}
