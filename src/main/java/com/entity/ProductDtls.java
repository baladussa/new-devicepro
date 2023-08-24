package com.entity;

public class ProductDtls {

	private int productId;
	private String productName;
	private String brand;
	private String price;
	private String productCategory;
	private String status;
	private String photoName;
	private String email;

	public ProductDtls() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDtls(String productName, String brand, String price, String productCategory, String status, String photoName,
			String email) {
		super();
		this.productName = productName;
		this.brand = brand;
		this.price = price;
		this.productCategory = productCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}

	@Override
	public String toString() {
		return "ProductDtls [productId=" + productId + ", productName=" + productName + ", brand=" + brand + ", price=" + price
				+ ", productCategory=" + productCategory + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
