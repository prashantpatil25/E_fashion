package com.grownited.entity;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "products")
public class ProductEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
	private String productName;
	private Integer categoryId;
	private Integer subCategoryId;
	private Double basePrice;
	private Double offerPrice;
	private Double offerPercentage;
	private String productDetail;
	private String productImageURL1;
	private String productImageURL2;
	private String productImageURL3;
	private Integer quantity;
	private Date createdAt;
}
