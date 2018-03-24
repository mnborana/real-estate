/**
 *Author : OMKAR SHIVADEKAR
 *Document : OrgService.java
 *Date : 08-Mar-2018
 *Time : 4:16:18 PM 
 */
package com.vs.realestate.service;

import java.util.List;

import com.vs.realestate.entity.Organization;

public interface OrgService {

	public void saveOrg(Organization theOrg);
	
	public List<Organization> getOrgDetails();
	
	public List<Organization> getOrgDetails(String orgId);
	
	public void deleteOrg(int orgId);
}
