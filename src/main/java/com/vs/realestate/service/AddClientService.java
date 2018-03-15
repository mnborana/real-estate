package com.vs.realestate.service;

import java.util.List;

import com.vs.realestate.entity.AddClient;

public interface AddClientService {

	public void saveClientService(AddClient theClient);
	public List<AddClient> getClientListDao();
	public void deleteClientService(int clientDeleteId);
	
}
