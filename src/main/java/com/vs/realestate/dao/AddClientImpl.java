package com.vs.realestate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vs.realestate.entity.AddClient;

@Repository
public class AddClientImpl implements AddClientDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void saveClientDao(AddClient theClient) {
		
		Session session = sessionFactory.getCurrentSession();
		session.save(theClient);
		
	}

	@Override
	public List<AddClient> getClientListService() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<AddClient> query = session.createQuery("from AddClient", AddClient.class);
		
		List<AddClient> clientList = query.getResultList();
		
		return clientList;
	}

	@Override
	public void deleteClientDao(int clientDeleteId) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<AddClient> query = session.createQuery("delete from AddClient where id=?");
		query.setParameter(0, clientDeleteId);
		
		query.executeUpdate();
		
	}
	
	
	
}
