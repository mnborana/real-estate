package com.vs.realestate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vs.realestate.entity.Installment;

@Repository
public class InstallmentImpl implements InstallmentDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void saveInstallment(String[] modeName, int[] noOfInstallment) {
		
		Session session = sessionFactory.getCurrentSession();
		
		System.out.println(modeName.length);
		
		for(int i=0; i<modeName.length; i++){
			
			Installment theInstallment = new Installment();
			theInstallment.setModeName(modeName[i]);
			theInstallment.setNoOfInstallment(noOfInstallment[i]);
			
			session.save(theInstallment);
			
		}
		
	}

	@Override
	public List<Installment> getInstallmentsList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Installment> query = session.createQuery("from Installment", Installment.class);
		
		List<Installment> installmentsList = query.getResultList();
		
		return installmentsList;
	}
	
	
	
	@Override
	public String getLastMode() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query maxIdQuery = session.createQuery("select max(id) from Installment");
		List maxIdList = maxIdQuery.getResultList();
		List lastModeRecord = new ArrayList<>();
		
		String s = "";
		
		if(!maxIdList.isEmpty()){
			
			Query query = session.createQuery("select modeName from Installment where id=?");
			query.setParameter(0, maxIdList.get(0));
			
			lastModeRecord = query.getResultList();
			s = lastModeRecord.get(0).toString();
			
		}
		
		return s;
	}
	
	
	
}
