package com.vs.realestate.dao;

import java.util.List;

import com.vs.realestate.entity.AddClient;

public interface AddClientDAO {

	public void saveClientDao(AddClient theClient);
	public List<AddClient> getClientListService();
	public void deleteClientDao(int clientDeleteId);
	
}
