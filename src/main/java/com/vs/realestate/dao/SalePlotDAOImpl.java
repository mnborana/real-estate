package com.vs.realestate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vs.realestate.entity.AddSite;
import com.vs.realestate.entity.Plotting;

@Repository
public class SalePlotDAOImpl implements SalePlotDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Plotting> getPlotNames(String siteId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("select id, plot_name from Plotting where site_id=:site_id");
		
		query.setParameter("site_id",Integer.parseInt(siteId));
		
		List<Object[]> plotList = query.getResultList();
		
		List<Plotting> plotDetsils = new ArrayList<>();
		
		for (Object[] temp : plotList) {
			Plotting plotting = new Plotting();
			
			plotting.setId((Integer)temp[0]);
			plotting.setPlot_name((String)temp[1]);
			plotDetsils.add(plotting);
		}
		return plotDetsils;
	}

	@Override
	public List<Plotting> getPlotInfo(String plotId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("SELECT A.address, A.zone, P.amt, P.sqft, P.width, P.length FROM "
				+ " AddSite A INNER JOIN Plotting P ON P.site_id=A.id AND P.id=:plot_id");
		
		query.setParameter("plot_id",Integer.parseInt(plotId));
		
		List<Object[]> plotDetailList = query.getResultList();
		
		List plotInfo = new ArrayList<>();
		
		for (Object[] temp : plotDetailList) {
			Plotting plotting = new Plotting();
			AddSite addSite = new AddSite();
			
			addSite.setAddress((String)temp[0]);
			addSite.setZone((String)temp[1]);
			plotInfo.add(addSite);
			
			plotting.setAmt((Integer)temp[2]);
			plotting.setSqft((Integer)temp[3]);
			plotting.setWidth((Integer)temp[4]);
			plotting.setLength((Integer)temp[5]);
			plotInfo.add(plotting);
		}
		
		return plotInfo;
	}

}