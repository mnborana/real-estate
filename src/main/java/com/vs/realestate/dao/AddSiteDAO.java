package com.vs.realestate.dao;

import java.util.List;

import com.vs.realestate.entity.AddSite;

public interface AddSiteDAO {
	
	public void saveSite(AddSite addSite);

	public List<AddSite> getSites();

	public void deleteSite(int id);

	public List getSiteInfoForUpdate(String siteId);

}
