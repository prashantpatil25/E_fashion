package com.grownited.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grownited.entity.ProductEntity;
import com.grownited.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	ProductRepository repoProductRepository;
	
	public List<ProductEntity> getProductEntities(){
		return repoProductRepository.findAll();
	}
}
