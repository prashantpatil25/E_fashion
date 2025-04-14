package com.grownited.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;	
	private String productName;	
	private Integer categoryId;	//pk
	private Integer subCategoryId;	//fk : user
	private Double basePrice; // Change Integer to Double
	private Double offerPrice; // Change Integer to Double

	
	private Double offerPercentage;	
	@Column(columnDefinition = "TEXT")
	private String productDetail;	
	private String productImageURL1;	
	private String productImageURL2;	
	private String productImageURL3;	//PK 
	private Integer quantity;	//fk : User
	private Date createdAt;
	
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getSubCategoryId() {
		return subCategoryId;
	}
	public void setSubCategoryId(Integer subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	public Double getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(Double basePrice) {
		this.basePrice = basePrice;
	}
	public Double getOfferPrice() {
		return offerPrice;
	}
	public void setOfferPrice(Double offerPrice) {
		this.offerPrice = offerPrice;
	}
	public Double getOfferPercentage() {
		return offerPercentage;
	}
	public void setOfferPercentage(Double offerPercentage) {
		this.offerPercentage = offerPercentage;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public String getProductImageURL1() {
		return productImageURL1;
	}
	public void setProductImageURL1(String productImageURL1) {
		this.productImageURL1 = productImageURL1;
	}
	public String getProductImageURL2() {
		return productImageURL2;
	}
	public void setProductImageURL2(String productImageURL2) {
		this.productImageURL2 = productImageURL2;
	}
	public String getProductImageURL3() {
		return productImageURL3;
	}
	public void setProductImageURL3(String productImageURL3) {
		this.productImageURL3 = productImageURL3;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
		
}