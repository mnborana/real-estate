/**
 *Author : OMKAR SHIVADEKAR
 *Document : OrgServiceImpl.java
 *Date : 08-Mar-2018
 *Time : 4:18:13 PM 
 */
package com.vs.realestate.service;

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

}
