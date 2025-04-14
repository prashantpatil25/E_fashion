package com.grownited.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.grownited.entity.WishListEntity;
import com.grownited.entity.UserEntity;

import com.grownited.repository.ProductRepository;
import com.grownited.repository.WishlistRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class WishListController {

    @Autowired
    WishlistRepository wishListRepository;

    @Autowired
    ProductRepository productRepository;

    // Add to wishlist
    @GetMapping("addtowishlist")
    public String addToWishlist(@RequestParam("productId") Integer productId, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Integer userId = user.getUserId();

        WishListEntity wishlist = new WishListEntity();
        wishlist.setProductId(productId);
        wishlist.setUserId(userId);
        wishlist.setCreatedAt(LocalDate.now());

        wishListRepository.save(wishlist);
        return "redirect:/wishlist";
    }

    // Show wishlist for current user
    @GetMapping("wishlist")
    public String listWishlist(HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Integer userId = user.getUserId();
        List<WishListEntity> list = wishListRepository.findByUserId(userId);
        model.addAttribute("wishlist", list);

        return "Wishlist"; // Wishlist.jsp
    }

    // Remove from wishlist
    @GetMapping("removewishlist")
    public String removeFromWishlist(@RequestParam("wishlistId") Integer wishlistId) {
        wishListRepository.deleteById(wishlistId);
        return "redirect:/wishlist";
    }

    // View wishlist item (optional)
    @GetMapping("viewwishlist")
    public String viewWishlist(@RequestParam("wishlistId") Integer wishlistId, Model model) {
        Optional<WishListEntity> wishlistItem = wishListRepository.findById(wishlistId);
        if (wishlistItem.isPresent()) {
            model.addAttribute("wishlistItem", wishlistItem.get());
            return "ViewWishlist";
        }
        return "redirect:/wishlist";
    }

}
