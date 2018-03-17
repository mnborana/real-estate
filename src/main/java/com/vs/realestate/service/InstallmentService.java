package com.vs.realestate.service;

import java.util.List;

import com.vs.realestate.entity.Installment;

public interface InstallmentService {
	
	public void saveInstallment(Installment installment, String modeName[], int[] noOfInstallment);
	public List<Installment> getServiceInstallmentsList();
	public String getServiceLastMode();
	public void deleteServiceMode(int id);
	public List<Installment> getServiceModeUpdate(int updateId);
}
