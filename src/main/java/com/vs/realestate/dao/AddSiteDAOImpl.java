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
		
		currentSession.save(addSite);
	}

	@Override
	public List<AddSite> getSites() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<AddSite> theQuery = session.createQuery("from AddSite", AddSite.class);
		
		List<AddSite> addSite=theQuery.getResultList();
		
		//System.out.println("List "+addSite);
		
		return addSite;
	}
	
}
