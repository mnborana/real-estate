package com.vs.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.AddClientDAO;
import com.vs.realestate.entity.AddClient;

@Service
public class AddClientServiceImpl implements AddClientService {
	
	
	@Autowired
	AddClientDAO theClientDao;

	@Override
	@Transactional
	public void saveClientService(AddClient theClient) {
		
		theClientDao.saveClientDao(theClient);
		
	}

	@Override
	@Transactional
	public List<AddClient> getClientListDao() {
		return theClientDao.getClientListService();
	}

	@Override
	@Transactional
	public void deleteClientService(int clientDeleteId) {
		
		theClientDao.deleteClientDao(clientDeleteId);
		
	}
	
	
	
}
