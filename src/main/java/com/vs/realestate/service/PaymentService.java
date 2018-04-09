package com.vs.realestate.service;

import java.util.List;

import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;

public interface PaymentService {


	void savePayments(Payment thePayment);

	List<AddClient> selectClientsList();

	List<Plotting> selectPlots(String clintId);

	public List getServicePaymentList();

	List<Installment> getModes(String payId);


}
