package com.vs.realestate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.InstallmentDao;

@Service
public class InstallmentServiceImpl implements InstallmentService {

	@Autowired
	InstallmentDao installmentDao;
	
	@Override
	@Transactional
	public void saveInstallment(String[] modeName, int[] noOfInstallment) {
		
		installmentDao.saveInstallment(modeName, noOfInstallment);
		
	}
	
	
	
}
