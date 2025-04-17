package com.grownited.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.CategoryEntity;
import com.grownited.entity.OrderDetailEntity;
import com.grownited.entity.OrdersEntity;
import com.grownited.entity.ProductEntity;
import com.grownited.entity.SubCategoryEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.OrderDetailRepository;
import com.grownited.repository.OrdersRepository;
import com.grownited.repository.ProductRepository;
import com.grownited.repository.SubCategoryRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class SellerController {
		
	@Autowired
	ProductRepository repositoryProduct;
	
	@Autowired
	CategoryRepository repoCategory;
	
	@Autowired
	SubCategoryRepository repoSubCategory;
	
	@Autowired
	OrdersRepository repoorders;
	
	@Autowired
	OrderDetailRepository repoorderdetail;
	
	@Autowired
	Cloudinary cloudinary;
		
		@Autowired
		UserRepository userRepository;
		
		@Autowired
		ProductRepository productRepository;
		
		
		@GetMapping("sellerdashboard")
		public String sellerDashboard(Model model) {
			
			Long totalUsers =userRepository.count();
			Long totalProducts = productRepository.count();
			
			model.addAttribute("totalProducts",totalProducts);
			model.addAttribute("totalUsers",totalUsers);
			return "Seller";
		}
		
		@GetMapping("sellerprofile")
		public String userprofile() {
			return "SellerProfile";
		}
		
		@GetMapping("sellerproduct")
		public String product(Model model) {
	        List<CategoryEntity> allCategory = repoCategory.findAll();
			
			model.addAttribute("allCategory",allCategory);
	        List<SubCategoryEntity> allSubCategory = repoSubCategory.findAll();
			
			model.addAttribute("allSubCategory",allSubCategory);
			return "Product";
		}
		
		@PostMapping("sellersaveproduct")
		public String saveProduct(ProductEntity entityproduct,@RequestParam("productImage1") MultipartFile productImage1, @RequestParam("productImage2") MultipartFile productImage2, @RequestParam("productImage3") MultipartFile productImage3) {
			System.out.println(productImage1.getOriginalFilename());// file name
			System.out.println(productImage2.getOriginalFilename());
			System.out.println(productImage3.getOriginalFilename());
			try {
				Map result = cloudinary.uploader().upload(productImage1.getBytes(), ObjectUtils.emptyMap());
				System.out.println(result);
				System.out.println(result.get("url"));
				entityproduct.setProductImageURL1(result.get("url").toString());
				
				Map result1 = cloudinary.uploader().upload(productImage2.getBytes(), ObjectUtils.emptyMap());
				System.out.println(result1);
				System.out.println(result1.get("url"));
				entityproduct.setProductImageURL2(result1.get("url").toString());
				
				Map result2 = cloudinary.uploader().upload(productImage3.getBytes(), ObjectUtils.emptyMap());
				System.out.println(result2);
				System.out.println(result2.get("url"));
				entityproduct.setProductImageURL3(result2.get("url").toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			System.out.println(entityproduct.getProductName());
			System.out.println(entityproduct.getOfferPercentage());
			System.out.println(entityproduct.getProductDetail());
			System.out.println(entityproduct.getQuantity());
			entityproduct.setCreatedAt(new Date());
			repositoryProduct.save(entityproduct);
			return "redirect:/sellerlistproduct";
		}
		
		//listproduct
			@GetMapping("sellerlistproduct")
			public String listproduct(Model model) {
				//List<ProductEntity> productList = repositoryProduct.findAll();
				
				//how to send data from controller to jsp 
				//Model 
				//model.addAttribute("productList", productList);
								//dataName , dataValue 
				List<Object[]> listProduct = repositoryProduct.getAll();
				model.addAttribute("productList", listProduct);
				return "SellerListProduct";
			}

			@GetMapping("sellerviewproduct")
			public String viewProduct(Integer productId, Model model) {
//				System.out.println("id ===> " + productId);
//				Optional<ProductEntity> op = repositoryProduct.findById(productId);
//				if (op.isEmpty()) {
//				not found
//				} else {
//				data found
//				ProductEntity product = op.get();
//				send data to jsp ->
//				model.addAttribute("product", product);
//	          }
				List<Object[]> op = repositoryProduct.getByProductId(productId);
				model.addAttribute("product", op);
				return "SellerViewProduct";
			}
			
			@GetMapping("Sellerdeleteproduct")
			public String deleteProduct(Integer productId) {
				repositoryProduct.deleteById(productId);
				return "redirect:/selleristproduct";
			}	
			@GetMapping("sellereditproduct")
			public String editProduct(Integer productId,Model model) {
				Optional<ProductEntity> op = repositoryProduct.findById(productId);
				if (op.isEmpty()) {
					return "redirect:/sellerlistproduct";
				} else {
					model.addAttribute("product",op.get());
					return "SellerEditProduct";
				}
			}
			@PostMapping("sellerupdateproduct")
			public String updateProduct(ProductEntity productEntity, @RequestParam("productImage1") MultipartFile productImage1, @RequestParam("productImage2") MultipartFile productImage2, @RequestParam("productImage3") MultipartFile productImage3) {//pcode vhreg type vid 
				
				System.out.println(productEntity.getProductId());//id? db? 
				System.out.println(productImage1.getOriginalFilename());
				System.out.println(productImage2.getOriginalFilename());
				System.out.println(productImage3.getOriginalFilename());
				
				Optional<ProductEntity> op = repositoryProduct.findById(productEntity.getProductId());
				try {
				    if (!productImage1.isEmpty()) {
				        Map result = cloudinary.uploader().upload(productImage1.getBytes(), ObjectUtils.emptyMap());
				        productEntity.setProductImageURL1(result.get("url").toString());
				    } else {
				        productEntity.setProductImageURL1(op.get().getProductImageURL1());
				    }

				    if (!productImage2.isEmpty()) {
				        Map result1 = cloudinary.uploader().upload(productImage2.getBytes(), ObjectUtils.emptyMap());
				        productEntity.setProductImageURL2(result1.get("url").toString());
				    } else {
				        productEntity.setProductImageURL2(op.get().getProductImageURL2());
				    }

				    if (!productImage3.isEmpty()) {
				        Map result2 = cloudinary.uploader().upload(productImage3.getBytes(), ObjectUtils.emptyMap());
				        productEntity.setProductImageURL3(result2.get("url").toString());
				    } else {
				        productEntity.setProductImageURL3(op.get().getProductImageURL3());
				    }

				} catch (IOException e) {
				    e.printStackTrace();
				}

				/*
				 * try { Map result = cloudinary.uploader().upload(productImage1.getBytes(),
				 * ObjectUtils.emptyMap()); System.out.println(result);
				 * System.out.println(result.get("url"));
				 * productEntity.setProductImageURL1(result.get("url").toString());
				 * 
				 * Map result1 = cloudinary.uploader().upload(productImage2.getBytes(),
				 * ObjectUtils.emptyMap()); System.out.println(result1);
				 * System.out.println(result1.get("url"));
				 * productEntity.setProductImageURL2(result1.get("url").toString());
				 * 
				 * Map result2 = cloudinary.uploader().upload(productImage3.getBytes(),
				 * ObjectUtils.emptyMap()); System.out.println(result2);
				 * System.out.println(result2.get("url"));
				 * productEntity.setProductImageURL3(result2.get("url").toString()); } catch
				 * (IOException e) { e.printStackTrace(); }
				 */		
				System.out.println(productEntity.getProductImageURL1());
				if(op.isPresent())
				{
					ProductEntity dbProduct = op.get(); //pcode vhreg type id userId 
					dbProduct.setProductName(productEntity.getProductName());//code 
					dbProduct.setBasePrice(productEntity.getBasePrice());
					dbProduct.setOfferPrice(productEntity.getOfferPrice());
					dbProduct.setOfferPercentage(productEntity.getOfferPercentage());
					dbProduct.setProductDetail(productEntity.getProductDetail());
					dbProduct.setProductImageURL1(productEntity.getProductImageURL1());
					dbProduct.setProductImageURL2(productEntity.getProductImageURL2());
					dbProduct.setProductImageURL3(productEntity.getProductImageURL3());
					dbProduct.setQuantity(productEntity.getQuantity());
					repositoryProduct.save(dbProduct);
				}
				return "redirect:/sellerlistproduct";
			}
			
			/*
			 * @GetMapping("/userviewproduct") public String userViewProduct(Integer
			 * productId,Model model) { Optional<ProductEntity> op =
			 * repositoryProduct.findById(productId);
			 * 
			 * if(op.isPresent()) { model.addAttribute("product",op.get()); return
			 * "UserViewProduct"; }else { return "redirect:/home"; }
			 * 
			 * }
			 */
			
			@GetMapping("sellerneworders")
			public String newOrders() {
				return "NewOrder";
			}
			
			@PostMapping("sellersaveorders")
			public String saveOrders(OrdersEntity entityorders, HttpSession session) {
				System.out.println(entityorders.getTotalAmount());
				entityorders.setCreatedAt(new Date());
				UserEntity user = (UserEntity) session.getAttribute("user");
				Integer userId = user.getUserId(); 
				entityorders.setUserId(userId);
				repoorders.save(entityorders);
				return "redirect:/sellerlistorders";
			}
			
			//listorders
			@GetMapping("sellerlistorders")
			public String listorders(Model model) {
				//List<OrdersEntity> ordersList = repoorders.findAll();
				
				//how to send data from controller to jsp 
				//Model 
				//model.addAttribute("ordersList", ordersList);
								//dataName , dataValue 
				List<Object[]> listOrders = repoorders.getAll();
				model.addAttribute("ordersList", listOrders);
				return "SellerListOrders";
			}

			@GetMapping("sellervieworders")
			public String viewOrders(Integer orderId, Model model) {
//				System.out.println("id ===> " + orderId);
//				Optional<OrdersEntity> op = repoorders.findById(orderId);
//				if (op.isEmpty()) {
//				not found
//				} else {
//				data found
//				OrdersEntity orders = op.get();
//				send data to jsp ->
//				model.addAttribute("orders", orders);
//				}
				List<Object[]> op = repoorders.getByOrderId(orderId);
				model.addAttribute("orders", op);
				return "ViewOrders";
			}
			
			@GetMapping("sellerdeleteorders")
			public String deleteOrders(Integer orderId) {
				repoorders.deleteById(orderId);
				return "redirect:/sellerlistorders";
			}	
			@GetMapping("sellereditorders")
			public String editOrder(Integer orderId,Model model) {
				Optional<OrdersEntity> op = repoorders.findById(orderId);
				if (op.isEmpty()) {
					return "redirect:/listorders";
				} else {
					model.addAttribute("orders",op.get());
					return "EditOrders";

				}
			}
			@PostMapping("sellerupdateorder")
			public String updateOrder(OrdersEntity orderEntity) {//pcode vhreg type vid 
				
				System.out.println(orderEntity.getOrderId());//id? db? 

				Optional<OrdersEntity> op = repoorders.findById(orderEntity.getOrderId());
				
				if(op.isPresent())
				{
					OrdersEntity dbOrder = op.get(); //pcode vhreg type id userId 
					dbOrder.setTotalAmount(orderEntity.getTotalAmount());//code
					dbOrder.setStatus(orderEntity.getStatus());
					repoorders.save(dbOrder);
				}
				return "redirect:/sellerlistorders";
			}
			
			@GetMapping("sellerneworderdetail")
			public String newOrderDetail(Model model) {
		       
		       List<ProductEntity> allProduct = repositoryProduct.findAll();// all state
				model.addAttribute("allProduct",allProduct);
				List<OrdersEntity> allOrders = repoorders.findAll();// all state
				model.addAttribute("allOrders",allOrders);
				return "NewOrderDetails";
			}
			
			@PostMapping("sellersaveorderdetail")
			public String saveOrderDetail(OrderDetailEntity entityorderdetail) {
				System.out.println(entityorderdetail.getQuantity());
				System.out.println(entityorderdetail.getPrice());
				System.out.println(entityorderdetail.getProductId());
				System.out.println(entityorderdetail.getStatus());
				repoorderdetail.save(entityorderdetail);
				return "redirect:/sellerlistorderdetail";
			}
			//listorderdetail
				@GetMapping("sellerlistorderdetail")
				public String listorderdetail(Model model) { 
					List<Object[]> listorderdetail = repoorderdetail.getAll();
					model.addAttribute("allorderdetail", listorderdetail);
					return "SellerListOrderDetail";
				}
			
				@GetMapping("sellervieworderdetail")
				public String viewOrderDetail(Integer orderDetailId, Model model) {
//					System.out.println("id ===> " + orderDetailId);
//					Optional<OrderDetailEntity> op = repoorderdetail.findById(orderDetailId);
//					if (op.isEmpty()) {
//					not found
//					} else {
//					data found
//					OrderDetailEntity orderdetail = op.get();
//					send data to jsp ->
//					model.addAttribute("orderdetail", orderdetail);
//					}
					List<Object[]> op = repoorderdetail.getByOrderDetailId(orderDetailId);
					model.addAttribute("orderdetail", op);
					return "ViewOrderDetail";
				}
				
				@GetMapping("sellerdeleteorderdetail")
				public String deleteOrderDetail(Integer orderDetailId) {
					repoorderdetail.deleteById(orderDetailId);
					return "redirect:/sellerlistorderdetail";
				}	
				@GetMapping("sellereditorderdetail")
				public String editOrderDetail(Integer orderDetailId,Model model) {
					Optional<OrderDetailEntity> op = repoorderdetail.findById(orderDetailId);
					if (op.isEmpty()) {
						return "redirect:/sellerlistorderdetail";
					} else {
						model.addAttribute("orderdetail",op.get());
						return "EditOrderDetail";

					}
				}
				@PostMapping("sellerupdateorderdetail")
				public String updateOrderDetail(OrderDetailEntity orderDetailEntity) {//pcode vhreg type vid 
					
					System.out.println(orderDetailEntity.getOrderDetailId());//id? db? 

					Optional<OrderDetailEntity> op = repoorderdetail.findById(orderDetailEntity.getOrderDetailId());
					
					if(op.isPresent())
					{
						OrderDetailEntity dbOrderDetail = op.get(); //pcode vhreg type id userId 
						dbOrderDetail.setQuantity(orderDetailEntity.getQuantity());//code
						dbOrderDetail.setPrice(orderDetailEntity.getPrice());
						dbOrderDetail.setStatus(orderDetailEntity.getStatus());
						repoorderdetail.save(dbOrderDetail);
					}
					return "redirect:/sellerlistorderdetail";
				}

	}
	


