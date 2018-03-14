/**
 *Author : OMKAR SHIVADEKAR
 *Document : Plotting.java
 *Date : 13-Mar-2018
 *Time : 2:52:24 PM 
 */
package com.vs.realestate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="plotting_rates")
public class Plotting {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="site_id")
	private int site_id;
	
	@Column(name="plot_name")
	private String plot_name;

	@Column(name="length")
	private int length;
	
	@Column(name="width")
	private int width;
	
	@Column(name="sqft")
	private int sqft;
	
	@Column(name="total_amount")
	private int amt;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSite_id() {
		return site_id;
	}

	public void setSite_id(int site_id) {
		this.site_id = site_id;
	}

	public String getPlot_name() {
		return plot_name;
	}

	public void setPlot_name(String plot_name) {
		this.plot_name = plot_name;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getSqft() {
		return sqft;
	}

	public void setSqft(int sqft) {
		this.sqft = sqft;
	}

	public int getAmt() {
		return amt;
	}

	public void setAmt(int amt) {
		this.amt = amt;
	}
	
	@Override
	public String toString() {
		return "Plotting [id=" + id + ", site_id=" + site_id + ", plot_name=" + plot_name + ", length=" + length
				+ ", width=" + width + ", sqft=" + sqft + ", amt=" + amt + "]";
	}
	

}
