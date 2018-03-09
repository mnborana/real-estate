/**
 *Author : OMKAR SHIVADEKAR
 *Document : Organization.java
 *Date : 08-Mar-2018
 *Time : 1:18:49 PM 
 */
package com.vs.realestate.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="org")
public class Organization {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="date")
	private String date;
	
	@Column(name="orgname")
	private String orgname;
	
	@Column(name="name")
	private String name;
	
	@Column(name="address")
	private String address;
	
	@Column(name="contact")
	private long contact;
	
	@Column(name="email")
	private String email;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getContact() {
		return contact;
	}

	public void setContact(long contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Organization()
	{
		
	}
	public Organization(int id, String date, String orgname, String name, String address, long contact, String email) {
		super();
		this.id = id;
		this.date = date;
		this.orgname = orgname;
		this.name = name;
		this.address = address;
		this.contact = contact;
		this.email = email;
	}

	@Override
	public String toString() {
		return "Organization [id=" + id + ", date=" + date + ", orgname=" + orgname + ", name=" + name + ", address="
				+ address + ", contact=" + contact + ", email=" + email + "]";
	}
	
	

}
