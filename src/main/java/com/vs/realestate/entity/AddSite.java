package com.vs.realestate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="site_info")
public class AddSite {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="site_name")
	private String siteName;
	
	@Column(name="date")
	private String date; //date sellerName sellerContactNo sqft address price length width zone
	
	@Column(name="seller_name")
	private String sellerName;
	
	@Column(name="seller_contact_no")
	private long contactNo;
	
	@Column(name="sqft")
	private String sqft;
	
	@Column(name="address")
	private String address;
	
	@Column(name="price")
	private String price;
	
	@Column(name="length")
	private String length;
	
	@Column(name="width")
	private String width;
	
	@Column(name="zone")
	private String zone;
	
	@Column(name="status")
	private int status;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public long getContactNo() {
		return contactNo;
	}

	public void setContactNo(long contactNo) {
		this.contactNo = contactNo;
	}

	public String getSqft() {
		return sqft;
	}

	public void setSqft(String sqft) {
		this.sqft = sqft;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public AddSite() {
	
	}

	public AddSite(int id, String siteName) {
		super();
		this.id = id;
		this.siteName = siteName;
	}

	@Override
	public String toString() {
		return "AddSite [id=" + id + ", siteName=" + siteName + ", date=" + date + ", sellerName=" + sellerName
				+ ", sellerContactNo=" + contactNo + ", sqft=" + sqft + ", address=" + address + ", price="
				+ price + ", length=" + length + ", width=" + width + ", zone=" + zone + ", status=" + status + "]";
	}

}
