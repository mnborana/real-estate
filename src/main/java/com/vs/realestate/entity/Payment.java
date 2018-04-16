package com.vs.realestate.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="payment")
public class Payment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="client_id")
	private int clientId;
	
	@Column(name="plot_id")
	private int plotId;
	
	@Column(name="date")
	private String requiredDate;
	
	@Column(name="next_install_date")
	private String nextInstDate;
	
	@Column(name="rem_amount")
	private int remAmount;
	
	@Column(name="token_amount")
	private int tokenAmount;
	
	@Column(name="pay_amount")
	private int payAmount;
	
	
	@Column(name="installment_no")
	private int installmentNo;
	
	@Column(name="status")
	private int status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public int getPlotId() {
		return plotId;
	}

	public void setPlotId(int plotId) {
		this.plotId = plotId;
	}

	public String getRequiredDate() {
		return requiredDate;
	}

	public void setRequiredDate(String date) {
		this.requiredDate = date;
	}

	public int getRemAmount() {
		return remAmount;
	}

	public void setRemAmount(int remAmount) {
		this.remAmount = remAmount;
	}

	public int getTokenAmount() {
		return tokenAmount;
	}

	public void setTokenAmount(int tokenAmount) {
		this.tokenAmount = tokenAmount;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public int getInstallmentNo() {
		return installmentNo;
	}

	public void setInstallmentNo(int installmentNo) {
		this.installmentNo = installmentNo;
	}
	

	/**
	 * @return the nextInstDate
	 */
	public String getNextInstDate() {
		return nextInstDate;
	}

	/**
	 * @param nextInstDate the nextInstDate to set
	 */
	public void setNextInstDate(String nextInstDate) {
		this.nextInstDate = nextInstDate;
	}

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Payment [id=" + id + ", clientId=" + clientId + ", plotId=" + plotId + ", requiredDate=" + requiredDate
				+ ", remAmount=" + remAmount + ", tokenAmount=" + tokenAmount + ", payAmount=" + payAmount + ", installmentNo=" + installmentNo + "]";
	}
	
}
