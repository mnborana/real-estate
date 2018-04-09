package com.vs.realestate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public void savePayments(Payment thePayment) {
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.save(thePayment);
	}

	@Override
	public List<AddClient> selectClientNameList() {
		Session currentSession1=sessionFactory.getCurrentSession();
		Query theClientQuery=currentSession1.createQuery("select id,name from AddClient");
		List<Object[]> listOfClientList=theClientQuery.getResultList();
		
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
	public List<Plotting> selectPlots(String clintId) {
		Session currentSession2=sessionFactory.getCurrentSession();
		
		Query thePlotsQuery=currentSession2.createQuery("SELECT MAX(PY.id),PL.plot_name FROM Payment PY,Plotting PL WHERE PY.clientId=:client_id AND PL.id=PY.plotId");
		thePlotsQuery.setParameter("client_id",Integer.parseInt(clintId));
		return thePlotsQuery.getResultList();
	}

	@Override
	public List<Installment> getModes(String payId) {
		Session currentHibernateSession=sessionFactory.getCurrentSession();

		Query theModeQuery=currentHibernateSession.createQuery("SELECT PY.remAmount,PY.installmentNo,INS.modeName,PY.plotId FROM Payment PY,Installment INS,SalePlot SP WHERE SP.plot_id=PY.plotId AND SP.client_id=PY.clientId AND INS.id=SP.mode_id AND PY.id=:pay_id");
		theModeQuery.setParameter("pay_id",Integer.parseInt(payId));
		return theModeQuery.getResultList();
	}

	/* (non-Javadoc)
	 * @see com.vs.realestate.dao.PaymentDAO#getPaymentList()
	 */
	@Override
	public List getPaymentList() {
		System.out.println("############################");
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("SELECT AC.name, "
				+ "PL.plot_name, PY.requiredDate, PY.nextInstDate, "
				+ "PY.installmentNo,PY.payAmount,PY.remAmount "
				+ "FROM Payment PY,AddClient AC,Plotting PL "
				+ "WHERE AC.id=PY.clientId AND PL.id=PY.plotId ORDER BY PY.id DESC");
		List paymentList=query.getResultList();
		System.out.println(">>>>>>"+paymentList);
		return query.getResultList();
	}


	

	
	
	}


