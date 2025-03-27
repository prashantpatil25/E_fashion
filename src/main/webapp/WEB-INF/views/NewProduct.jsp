<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-body">
            <h2 class="text-center">Product Details</h2>

            <div class="row">
                <!-- Product Images Carousel -->
                <div class="col-md-3">
                    <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="images/product4.jpg" class="d-block w-100" alt="Product Image 1">
                            </div>
                            <div class="carousel-item">
                                <img src="images/product1.jpg" class="d-block w-100" alt="Product Image 2">
                            </div>
                            <div class="carousel-item">
                                <img src="images/product3.jpg" class="d-block w-100" alt="Product Image 3">
                            </div>
                        </div>
                        <!-- Carousel Controls -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>

                <!-- Product Details -->
                <div class="col-md-6">
                    <p><strong>Product Name:</strong> Stylish T-Shirt</p>
                    <p><strong>Category:</strong> Clothing</p>
                    <p><strong>Sub-Category:</strong> Men’s Wear</p>
                    <p><strong>Base Price:</strong> <span class="text-decoration-line-through">$20.00</span></p>
                    <p><strong>Offer Price:</strong> <span class="text-success">$15.00</span></p>
                    <p><strong>Offer Percentage:</strong> <span class="badge bg-success">25% OFF</span></p>
                    <p><strong>Quantity:</strong> 50</p>
                    <p><strong>Product Details:</strong> A high-quality cotton T-shirt perfect for casual wear.</p>
                    <button class="btn btn-primary">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
