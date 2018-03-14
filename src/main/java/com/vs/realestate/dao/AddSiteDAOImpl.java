package com.vs.realestate.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.query.Query;

import com.vs.realestate.entity.AddSite;

@Repository
public class AddSiteDAOImpl implements AddSiteDAO {

	@Autowired
	 SessionFactory sessionFactory;

	@Override
	public void saveSite(AddSite addSite) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(addSite);
	}

	@Override
	public List<AddSite> getSites() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<AddSite> theQuery = currentSession.createQuery("from AddSite", AddSite.class);
		
		List<AddSite> addSite=theQuery.getResultList();
		
		//System.out.println("List "+addSite);
		
		return addSite;
	}

	@Override
	public void deleteSite(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from AddSite where id=:siteId");
		
		theQuery.setParameter("siteId", id);
		
		theQuery.executeUpdate();
	}

	@Override
	public List getSiteInfoForUpdate(String siteId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<AddSite> theQuery = currentSession.createQuery("from AddSite where id=:siteId", AddSite.class);
		
		theQuery.setParameter("siteId", Integer.parseInt(siteId));
		
		List siteDetail = theQuery.getResultList();

		return siteDetail;
	}
	
}
