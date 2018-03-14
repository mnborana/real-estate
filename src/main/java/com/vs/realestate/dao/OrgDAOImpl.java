/**
 *Author : OMKAR SHIVADEKAR
 *Document : OrgDAOImpl.java
 *Date : 08-Mar-2018
 *Time : 4:31:14 PM 
 */
package com.vs.realestate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vs.realestate.entity.Organization;
import com.vs.realestate.service.OrgService;

@Repository
public class OrgDAOImpl implements OrgDAO {
	
	/*injecting session factory (DI)*/
	@Autowired
	SessionFactory sessionFactory;
	

	@Override
	public void saveOrg(Organization theOrg) {

		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
						
		//save/update the customer
		currentSession.saveOrUpdate(theOrg);

	}


	@Override
	public List<Organization> getOrgDetails() {

		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Organization> theQuery = currentSession.createQuery("from Organization",Organization.class);
		
		List<Organization> orgDetails = theQuery.getResultList();
		
		return orgDetails;
	}

}
