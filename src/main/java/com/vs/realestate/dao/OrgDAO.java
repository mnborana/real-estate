/**
 *Author : OMKAR SHIVADEKAR
 *Document : orgDAO.java
 *Date : 08-Mar-2018
 *Time : 4:29:29 PM 
 */
package com.vs.realestate.dao;

import java.util.List;

import com.vs.realestate.entity.Organization;

public interface OrgDAO {
	
	public void saveOrg(Organization theOrg);
	
	public List<Organization>getOrgDetails();
	
	public List<Organization>getOrgDetails(String orgId);
	
	public void deleteOrg(int orgId);

}
