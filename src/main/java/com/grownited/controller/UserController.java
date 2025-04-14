package com.grownited.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.grownited.repository.ProductRepository;

@Controller
public class UserController {

    @Autowired
    ProductRepository repositoryProduct;

    @GetMapping("/products")
    public String getAllProducts(Model model) {
        List<Object[]> allProduct = repositoryProduct.getAll();  
        
        for (Object[] row : allProduct) {
            // In fields ko correct type mein treat karein
            Integer productId = (Integer) row[0];   // productId ko Integer type mein
            String productName = (String) row[1];    // productName ko String type mein
            Double basePrice = (Double) row[2];      // basePrice ko Double type mein
            Double offerPrice = (Double) row[3];     // offerPrice ko Double type mein
            Double offerPercentage = (Double) row[4]; // offerPercentage ko Double type mein
            String productImageURL1 = (String) row[5];  // image URL ko String type mein
            
            // Debug ke liye product ki details print karna
            System.out.println("Product ID: " + productId);
            System.out.println("Product Name: " + productName);
            System.out.println("Base Price: " + basePrice);
            System.out.println("Offer Price: " + offerPrice);
            System.out.println("Offer Percentage: " + offerPercentage);
            System.out.println("Image URL: " + productImageURL1);
            System.out.println("---------------");
        }

        model.addAttribute("allProduct", allProduct);
        return "Products";
    }


    @GetMapping("productdetail")
    public String productdetail() {
        return "ProductDetail";
    }

    @GetMapping("blog")
    public String blog() {
        return "Blog";
    }

    @GetMapping("contact")
    public String contact() {
        return "Contact";
    }

    @GetMapping("about")
    public String about() {
        return "About";
    }

    @GetMapping("blogdetail")
    public String blogdetail() {
        return "BlogDetail";
    }
}
