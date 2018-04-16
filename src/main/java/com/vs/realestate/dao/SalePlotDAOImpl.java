package com.vs.realestate.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.AddSite;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;
import com.vs.realestate.entity.SalePlot;

@Repository
public class SalePlotDAOImpl implements SalePlotDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Plotting> getPlotNames(String siteId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("select id, plot_name from Plotting where site_id=:site_id AND status=0");
		
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

	@Override
	public List<Installment> getModeInfo() {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("SELECT id, modeName FROM Installment");
		
		List<Object[]> modeList = query.getResultList();
		
		List<Installment> modeDetails = new ArrayList<>();
		
		for (Object[] temp : modeList) {
			Installment installment = new Installment();
			
			installment.setId((Integer)temp[0]);
			installment.setModeName((String)temp[1]);
			modeDetails.add(installment);
		}
		System.out.println("modeDetails : "+modeDetails);
		return modeDetails;
	}

	@Override
	public void saveSalesPlot(String date, int site_id, int plot_id, int client_id, int mode_id, int token_amt, 
			int price, int sqft, int length, int width, String plotName) {
		
		Session session = sessionFactory.getCurrentSession();
		
		SalePlot salePlot = new SalePlot();
		
		salePlot.setDate(date);
		salePlot.setSite_id(site_id);
		salePlot.setPlot_id(plot_id);
		salePlot.setClient_id(client_id);
		salePlot.setMode_id(mode_id);
		salePlot.setToken_amt(token_amt);
		
		session.save(salePlot);
		
		Plotting plotting = new Plotting();
		
		plotting.setId(plot_id);
		plotting.setSite_id(site_id);
		plotting.setPlot_name(plotName);
		plotting.setLength(length);
		plotting.setWidth(width);
		plotting.setSqft(sqft);
		plotting.setAmt(price);
		plotting.setStatus(1);
		
		session.update(plotting);
		
		
		
		// payment entry remaining
		
		
		
		Payment payment = new Payment();
		
		payment.setClientId(client_id);
		payment.setPlotId(plot_id);
		payment.setRequiredDate(date);
		payment.setTokenAmount(token_amt);
		payment.setRemAmount(price-token_amt);
		payment.setPayAmount(0);
		payment.setInstallmentNo(0);
		
		session.save(payment);
		
		

	}

	@Override
	public List showSalePlots() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("SELECT SalePlot.id, sale_plot.date, AddClient.name FROM SalePlot INNER JOIN AddClient ON SalePlot.client_id=AddClient.id");
		
		List<Object[]> salePlotList = query.getResultList();
		
		List salePlotDetails = new ArrayList<>();
		
		for (Object[] temp : salePlotList) {
			
			SalePlot salePlot = new SalePlot();
			AddClient addClient = new AddClient();
			
			salePlot.setId((Integer)temp[0]);
			salePlot.setDate((String)temp[1]);
			salePlotDetails.add(salePlot);
			
			addClient.setName((String)temp[2]);
			salePlotDetails.add(addClient);
			
		}
		
		System.out.println(salePlotDetails);
		
		return salePlotDetails;
	}

}
// display
/*SELECT 
sale_plot.date, client_info.name, site_info.site_name, plotting_rates.plot_name,plotting_rates.length, plotting_rates.width, plotting_rates.sqft 
FROM 
sale_plot, client_info, plotting_rates,site_info 
WHERE 
sale_plot.client_id=client_info.id 
AND 
sale_plot.site_id=site_info.id 
AND 
sale_plot.plot_id=plotting_rates.id*/

/*

inner join query

SELECT sale_plot.id, sale_plot.date, client_info.name, site_info.site_name, plotting_rates.plot_name, plotting_rates.length, plotting_rates.width,  plotting_rates.sqft FROM sale_plot INNER JOIN client_info ON sale_plot.client_id=client_info.id INNER JOIN site_info ON sale_plot.site_id=site_info.id INNER JOIN plotting_rates ON sale_plot.plot_id=plotting_rates.id

*/