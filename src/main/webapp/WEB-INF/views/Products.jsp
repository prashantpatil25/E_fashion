<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/ashion/img/logo4.png"/>

    <!-- Bootstrap & Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/ashion/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/ashion/css/util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/ashion/css/main.css">

    <style>
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .product {
            width: 250px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            text-align: center;
            padding: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            transition: transform 0.3s ease;
        }

        .product:hover {
            transform: translateY(-5px);
        }

        .product-image-container {
            width: 100%;
            height: 200px;
            overflow: hidden;
        }

        .product-image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .product-image-container img:hover {
            transform: scale(1.1);
        }

        .product h3 {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }

        .product p {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }

        .btn-custom {
            display: inline-block;
            margin: 5px;
            padding: 8px 12px;
            background-color: #4caf50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-custom:hover {
            background-color: #388e3c;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            font-weight: bold;
        }
        .btn-buy {
    background-color: #007bff; /* Blue */
}


    </style>
</head>
<body>

    <!-- Page content here -->
    <div class="container">
        <h1>Available Products</h1>
        <div class="product-list">
            <c:forEach items="${allProduct}" var="product">
                <div class="product">
                 <!-- Wishlist Icon -->
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
                        <a href="addtowishlist/${p.productId}" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                            <img class="icon-heart1 dis-block trans-04" 
                                 src="ashion/images/icons/icon-heart-01.png" alt="Add to Wishlist">
                            <!-- <img class="icon-heart2 dis-block trans-04 ab-t-l" 
                                 src="ashion/images/icons/icon-heart-02.png" alt="Added to Wishlist"> -->
                        </a>
                    <div class="product-image-container">
                        <img src="${product[5]}" alt="Product Image">
    						
                    </div>
                    
                    <h3>${product[1]}</h3>
                     
                   
                    <p>Base Price: ₹${product[2]}</p>
                    <p>Offer Price: ₹${product[3]}</p>
                    <p>Offer Percentage: ${product[4]}%</p>
         
                    <a href="userviewproduct?productId=${product[0]}" class="btn-custom">View Details</a>
                    <a href="addtocart?productId=${product[0]}" class="btn-custom">Add to Cart</a>
                    <a href="buyNow?productId=${product[0]}" class="btn-custom btn-buy">Buy Now</a>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- JS Scripts -->
    <script src="${pageContext.request.contextPath}/static/ashion/vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/ashion/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
