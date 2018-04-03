package com.vs.realestate.service;

import java.util.List;

import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;

public interface PaymentService {

	List<Payment> getPaymentDetails();

	void savePayments(Payment thePayment);

	List<AddClient> selectClientsList();

	List<Plotting> selectPlots();

	List<Payment> selectRemainingAmt();

	List<Installment> getModes();

	List<Payment> getInstallmentNo();

}
