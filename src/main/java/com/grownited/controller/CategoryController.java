package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CategoryEntity;
import com.grownited.entity.SubCategoryEntity;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.SubCategoryRepository;

@Controller
public class CategoryController {
		
		@Autowired
		CategoryRepository repositoryCategory;
		
		@Autowired
		SubCategoryRepository repositorySubcategory;
		@GetMapping("newcategory")
		public String newCategory() {
			return "NewCategory";
		}
		
		@PostMapping("savecategory")
		public String saveCategory(CategoryEntity entityCategory) {
			System.out.println(entityCategory.getCategoryName());
			repositoryCategory.save(entityCategory);
			return "NewCategory";
		}
		
		@GetMapping("newsubcategory")
		public String newSubcategory() {
			return "NewSubCategory";
		}
		
		@PostMapping("savesubcategory")
		public String saveSubcategory(SubCategoryEntity entitySubcategory) {
			System.out.println(entitySubcategory.getSubCategoryName());
			repositorySubcategory.save(entitySubcategory);
			return "NewSubCategory";
		}
}
