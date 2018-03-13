package com.vs.realestate.dao;

import java.util.List;

import com.vs.realestate.entity.Installment;

public interface InstallmentDao {

	public void saveInstallment(String[] modeName, int[] noOfInstallment);
	public List<Installment> getInstallmentsList();
	public String getLastMode();	
	
	
}
