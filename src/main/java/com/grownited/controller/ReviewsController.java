package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.ReviewsEntity;
import com.grownited.repository.ReviewsRepository;

@Controller
public class ReviewsController {
		@Autowired
		ReviewsRepository repositoryReviews;
		@GetMapping("newreviews")
		public String newReviews() {
			return "NewReviews";
		}
		
		@PostMapping("savereviews")
		public String saveReviews(ReviewsEntity entityReviews) {
			repositoryReviews.save(entityReviews);
			return "NewReviews";
		}
}
