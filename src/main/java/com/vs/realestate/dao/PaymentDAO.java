package com.vs.realestate.dao;

import java.util.List;

import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;

public interface PaymentDAO {


	void savePayments(Payment thePayment);

	public List getPaymentList();
	List<AddClient> selectClientNameList();

	List<Plotting> selectPlots(String clintId);


	List<Installment> getModes(String payId);


}
