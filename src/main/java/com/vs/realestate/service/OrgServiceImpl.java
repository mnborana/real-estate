/**
 *Author : OMKAR SHIVADEKAR
 *Document : OrgServiceImpl.java
 *Date : 08-Mar-2018
 *Time : 4:18:13 PM 
 */
package com.vs.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.realestate.dao.OrgDAO;
import com.vs.realestate.entity.Organization;

@Service
public class OrgServiceImpl implements OrgService {

	@Autowired
	OrgDAO theOrgDAO;
	
	@Transactional
	@Override
	public void saveOrg(Organization theOrg) {

		 theOrgDAO.saveOrg(theOrg);
	
	}

	@Transactional
	@Override
	public List<Organization> getOrgDetails() {
		
		return theOrgDAO.getOrgDetails();
	}

	@Transactional
	@Override
	public List<Organization> getOrgDetails(String orgId) {
		
		return theOrgDAO.getOrgDetails(orgId);
	}

	@Transactional
	@Override
	public void deleteOrg(int orgId) {
		
		theOrgDAO.deleteOrg(orgId);
	}

}
