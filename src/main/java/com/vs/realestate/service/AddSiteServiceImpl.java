package com.vs.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.AddSiteDAO;
import com.vs.realestate.entity.AddSite;

@Service
public class AddSiteServiceImpl implements AddSiteService {

	@Autowired
	 AddSiteDAO addSiteDAO; 
	
	@Override
	@Transactional
	public void saveSite(AddSite addSite) {

		addSiteDAO.saveSite(addSite);
	}

	@Override
	@Transactional
	public List<AddSite> getSites() {

		return addSiteDAO.getSites();
	}

	@Override
	@Transactional
	public void deleteSite(int id) {
		
		addSiteDAO.deleteSite(id);
	}

	@Override
	@Transactional
	public List getSiteInfoForUpdate(String siteId) {
		
		return addSiteDAO.getSiteInfoForUpdate(siteId);
	}

}
