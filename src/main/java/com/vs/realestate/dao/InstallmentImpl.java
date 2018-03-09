package com.vs.realestate.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	
	
	
}
