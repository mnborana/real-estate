package com.vs.realestate.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class SalePlot {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="date")
	private String date;
	
	@Column(name="site_id")
	private int site_id;
	
	@Column(name="plot_id")
	private int plot_id;

	@Column(name="client_id")
	private int client_id;	

	@Column(name="installment_id")
	private int installment_id;

	@Column(name="token_amt")
	private int token_amt;
	 
	@Column(name="status")
	private int status;

	public SalePlot() {
		
	}

	public SalePlot(int id, String date, int site_id, int plot_id, int client_id, int installment_id, int token_amt,
			int status) {
		super();
		this.id = id;
		this.date = date;
		this.site_id = site_id;
		this.plot_id = plot_id;
		this.client_id = client_id;
		this.installment_id = installment_id;
		this.token_amt = token_amt;
		this.status = status;
	}

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

	public int getSite_id() {
		return site_id;
	}

	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}

	public int getPlot_id() {
		return plot_id;
	}

	public void setPlot_id(int plot_id) {
		this.plot_id = plot_id;
	}

	public int getClient_id() {
		return client_id;
	}

	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}

	public int getInstallment_id() {
		return installment_id;
	}

	public void setInstallment_id(int installment_id) {
		this.installment_id = installment_id;
	}

	public int getToken_amt() {
		return token_amt;
	}

	public void setToken_amt(int token_amt) {
		this.token_amt = token_amt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}