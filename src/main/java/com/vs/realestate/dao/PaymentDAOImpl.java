package com.vs.realestate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Payment> getPaymentDetails() {
		
		//get hibernate session
		Session currentSession=sessionFactory.getCurrentSession();
		
		//create query
		Query<Payment> theQuery=currentSession.createQuery("from Payment",Payment.class);
		
		//execute query
		List<Payment> thePayment=theQuery.getResultList();
		
		//return result
		return thePayment;
	}

	@Override
	public void savePayments(Payment thePayment) {
		// TODO Auto-generated method stub
		
		//get hibernate session 
		Session currentSession=sessionFactory.getCurrentSession();
		
		//save 
		currentSession.save(thePayment);
	}

	@Override
	public List<AddClient> selectClientNameList() {
		// TODO Auto-generated method stub
		
		//get hibernate session
		
		Session currentSession1=sessionFactory.getCurrentSession();
		
		Query theClientQuery=currentSession1.createQuery("select id,name from AddClient");
		
		List<Object[]> listOfClientList=theClientQuery.getResultList();
		
	//	System.out.println("List of Client:"+listOfClientList);
		
		List<AddClient> listOfClient=new ArrayList();
		
		for (Object[] temp : listOfClientList) {
			
			AddClient client=new AddClient();
			client.setId((Integer) temp[0]);
			client.setName((String) temp[1]);
			listOfClient.add(client);
		}
		return listOfClient;
	}

	@Override
	public List<Plotting> selectPlots() {
		// TODO Auto-generated method stub
		
		//get hibernate Session 
		Session currentSession2=sessionFactory.getCurrentSession();
		
		Query thePlotsQuery=currentSession2.createQuery("select id,plot_name from Plotting");
		
		List<Object[]> thePlotsList=thePlotsQuery.getResultList();
		
		List<Plotting> listOfPlots=new ArrayList<>();
		
		for (Object[] objects : thePlotsList) {
			Plotting thePlots=new Plotting();
			thePlots.setId((Integer) objects[0]);
			thePlots.setPlot_name((String) objects[1]);
			listOfPlots.add(thePlots);
		}
		
		return listOfPlots;
	}

	@Override
	public List<Payment> selectRemAmt() {
		//get hibernate Session 
		Session currentSession3=sessionFactory.getCurrentSession();
		
		Query theRemAmt=currentSession3.createQuery("select remAmount from Payment where id=(select max(id) from Payment)");
		
		List<Object> theRemAmount=theRemAmt.getResultList();
		
		List<Payment> listOfPlots=new ArrayList<>();
		
		for (Object objects : theRemAmount) {
			Payment payment=new Payment();
			payment.setRemAmount((Integer) objects);
			listOfPlots.add(payment);
		}
				
		return listOfPlots;
	}

	@Override
	public List<Installment> getModes() {
		
		//get hibernate session 
		Session currentHibernateSession=sessionFactory.getCurrentSession();
		
		//create Query
		Query theModeQuery=currentHibernateSession.createQuery("select id,modeName from Installment where id=(select max(id) from Installment)");
		
		//execute Query
		List<Object[]> theModes=theModeQuery.getResultList();
		
		//get arrayList
		List<Installment> theModeList=new ArrayList<>();
		
		//add elements using foreach loop
		for (Object[] objects : theModes) {
			Installment installments=new Installment();
			installments.setId((Integer) objects[0]);
			installments.setModeName((String) objects[1]);
			theModeList.add(installments);
		}
		
		return theModeList;
	}

	@Override
	public List<Payment> getInstallmentNo() {
		
		//get hibernate session 
		Session gethibernateCurrSession=sessionFactory.getCurrentSession();
		
		//create query
		Query theInstallmentNo=gethibernateCurrSession.createQuery("select installmentNo from Payment where id=(select max(id) from Payment)");
		
		//execute query 
		List<Object> theInstallNo=theInstallmentNo.getResultList();
		
		//get Arraylist 
		List<Payment> theinstallmentsNo=new ArrayList<>();
		
		for (Object object : theInstallNo) {
			Payment payments=new Payment();
			payments.setInstallmentNo((Integer) object);
			theinstallmentsNo.add(payments);
		}
		
		//return list Object
		
		return theinstallmentsNo;
	}

	

	
	
	}


