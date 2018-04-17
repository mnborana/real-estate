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
	public void saveInstallment(Installment installment, String[] modeName, int[] noOfInstallment) {
		
		Session session = sessionFactory.getCurrentSession();
		System.out.println("theInstallment   "+installment);
		
		for(int i=0; i<modeName.length; i++){
			
			Installment theInstallment = new Installment();
			
			if(installment.getId()!=0){
				theInstallment.setId(installment.getId());
			}
			
			theInstallment.setModeName(modeName[i]);
			theInstallment.setNoOfInstallment(noOfInstallment[i]);
			
			session.saveOrUpdate(theInstallment);
			
		}
		
	}

	@Override
	public List<Installment> getInstallmentsList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Installment> query = session.createQuery("from Installment", Installment.class);
		
		List<Installment> installmentsList = query.getResultList();
		System.out.println("install ment is:"+installmentsList);
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
			
			if(lastModeRecord.isEmpty()){
				s = "Mode_0";
			}
			else{
				s = lastModeRecord.get(0).toString();
			}
		}
		
		return s;
	}

	@Override
	public void deleteMode(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("delete from Installment where id=?");
		query.setParameter(0, id);
		query.executeUpdate();
	}

	@Override
	public List<Installment> getServiceModeUpdate(int updateId) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Installment where id=?");
		query.setParameter(0, updateId);
		
		List list = query.getResultList();
		System.out.println("List  "+list);
		return list;
	}
	
	
}
