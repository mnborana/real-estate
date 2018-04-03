/**
 *Author : OMKAR SHIVADEKAR
 *Document : PlotDAOImple.java
 *Date : 11-Mar-2018
 *Time : 6:14:29 PM 
 */
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
public class PlotDAOImple implements PlotDAO {
	
	/*injecting session factory (DI)*/
	@Autowired
	SessionFactory sessionFactory;


	@Override
	public List<AddSite> getSiteNames() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query theQuery = session.createQuery("select id, siteName from AddSite");
		
		
		List<Object[]> details = theQuery.getResultList();
		
		//System.out.println("Add sites:"+details);
		
		List<AddSite> siteDetails = new ArrayList<>();
		
		
		for(Object[] temp:details)
		{
			AddSite theSite =new AddSite();
			
			theSite.setId((Integer)temp[0]);
			theSite.setSiteName((String)temp[1]);
			siteDetails.add(theSite);
			
		}
		
		
		//System.out.println(siteDetails.toString());
		
		return siteDetails;
	}


	@Override
	public List<AddSite> getSiteDetails(String siteId) {

		Session session = sessionFactory.getCurrentSession();
		
		Query<AddSite> theQuery = session.createQuery("from AddSite where id=:siteid",AddSite.class);
		
		theQuery.setParameter("siteid", Integer.parseInt(siteId));
		
		List details = theQuery.getResultList();
		
		return details;
	}


	@Override
	public void savePlotes(int siteid, String[] plotName, int[] len, int[] width, int[] sqft, int[] amt) {

		Session session = sessionFactory.getCurrentSession();
		
		for(int i=0;i<plotName.length;i++)
		{
			Plotting thePlot = new Plotting();
			thePlot.setSite_id(siteid);
			thePlot.setPlot_name(plotName[i]);
			thePlot.setLength(len[i]);
			thePlot.setWidth(width[i]);
			thePlot.setSqft(sqft[i]);
			thePlot.setAmt(amt[i]);
			
			session.save(thePlot);
		}
	}


	@Override
	public List<Plotting> getPlotDetatils(String siteId) {
	
		Session session = sessionFactory.getCurrentSession();
		
		Query theQuery = session.createQuery("SELECT p.id,s.siteName,p.plot_name,p.length,p.width,p.sqft,p.amt FROM Plotting AS p LEFT JOIN AddSite AS s ON p.site_id=s.id WHERE s.id=:siteId"); 
		
		theQuery.setParameter("siteId", Integer.parseInt(siteId));
		
		List <Object[]>details = theQuery.getResultList();
		
		List plotDetails = new ArrayList<>();
		
		for(Object[] temp : details)
		{
			plotDetails.add(temp[0]);
			plotDetails.add(temp[1]);
			plotDetails.add(temp[2]);
			plotDetails.add(temp[3]);
			plotDetails.add(temp[4]);
			plotDetails.add(temp[5]);
			plotDetails.add(temp[6]);
		}
		
		System.out.println(plotDetails.toString());
		
		return plotDetails;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
