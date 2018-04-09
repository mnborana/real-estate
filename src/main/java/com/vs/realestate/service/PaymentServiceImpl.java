package com.vs.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.PaymentDAO;
import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentDAO thePaymentdao;


	@Override
	@Transactional
	public void savePayments(Payment thePayment) {
		// TODO Auto-generated method stub
		
		thePaymentdao.savePayments(thePayment);
		
	}

	@Override
	@Transactional
	public List<AddClient> selectClientsList() {
		// TODO Auto-generated method stub
		return thePaymentdao.selectClientNameList();
	}

	@Override
	@Transactional
	public List<Plotting> selectPlots(String clintId) {
		// TODO Auto-generated method stub
		
		return thePaymentdao.selectPlots(clintId);
	}

	@Override
	@Transactional
	public List<Installment> getModes(String payId) {
		// TODO Auto-generated method stub
		return thePaymentdao.getModes(payId);
	}

	/* (non-Javadoc)
	 * @see com.vs.realestate.service.PaymentService#getServicePaymentList()
	 */
	@Override
	@Transactional
	public List getServicePaymentList() {
		
		return thePaymentdao.getPaymentList();
	}


	

}
