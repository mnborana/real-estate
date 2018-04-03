package com.vs.realestate.dao;

import java.util.List;

import com.vs.realestate.entity.AddClient;
import com.vs.realestate.entity.Installment;
import com.vs.realestate.entity.Payment;
import com.vs.realestate.entity.Plotting;

public interface PaymentDAO {

	List<Payment> getPaymentDetails();

	void savePayments(Payment thePayment);

	List<AddClient> selectClientNameList();

	List<Plotting> selectPlots();

	List<Payment> selectRemAmt();

	List<Installment> getModes();

	List<Payment> getInstallmentNo();

}
