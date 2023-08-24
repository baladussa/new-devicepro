package com.entity;

public class Product_Order {

	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phnno;
	private String fulladd;
	private String productName;
	private String brand;
	private String price;
	private String paymentType;
	
	public Product_Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhnno() {
		return phnno;
	}

	public void setPhnno(String phnno) {
		this.phnno = phnno;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "Product_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", phnno=" + phnno + ", fulladd=" + fulladd + ", productName=" + productName + ", brand=" + brand
				+ ", price=" + price + ", paymentType=" + paymentType + "]";
	}

	
	
}
