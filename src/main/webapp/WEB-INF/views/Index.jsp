<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
    <title>Ellison Electronics</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/changes.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="icon" type="image/png" href="assets/img/logo4.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="ashion/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="ashion/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ashion/css/util.css">
	<link rel="stylesheet" type="text/css" href="ashion/css/main.css">
</head>
<body style="background-color: #E6F9E6;">

<jsp:include page="header.jsp" />

<!-- Message -->
<div class="text-center" style="color: black; font-size: 14px; font-weight: bold;">
    ${message}
</div>

<!-- Product Items List -->
<div class="container">
    <div class="row text-center">

        <c:forEach var="product" items="${products}">
            <div class="col-sm-4" style='height: 350px;'>
                <div class="thumbnail">
                <img src="${product.productImageURL1}" alt="IMG-PRODUCT"style="height: 150px; max-width: 180px">
                    <%-- <img src="./productImageURL1?productid=${product.productId}" alt="Product"
                         style="height: 150px; max-width: 180px"> --%>
                    <p class="productname">${product.productName}</p>

                    <p class="productinfo">
                        <%-- <c:choose>
                            <c:when test="${fn:length(product.productInfo) > 100}">
                                ${fn:substring(product.productInfo, 0, 100)}..
                            </c:when>
                            <c:otherwise>
                                ${product.prodInfo}
                            </c:otherwise>
                        </c:choose> --%>
                    </p>

                    <p class="price">Rs ${product.basePrice}</p>

                    <form method="post">
                        <c:choose>
                            <c:when test="${product.quantity == 0}">
                                <button type="submit"
                                        formaction="./AddtoCart?userid=${username}&pid=${product.productId}&pqty=1"
                                        class="btn btn-success">Add to Cart</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="submit"
                                        formaction="./AddtoCart?userid=${username}&pid=${product.productId}&pqty=1"
                                        class="btn btn-primary">Buy Now</button>
                            </c:when>
                            <c:otherwise>
                                <button type="submit"
                                        formaction="./AddtoCart?userid=${username}&pid=${product.productId}&pqty=0"
                                        class="btn btn-danger">Remove From Cart</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="submit" formaction="cartDetails.jsp"
                                        class="btn btn-success">Checkout</button>
                            </c:otherwise>
                        </c:choose>
                    </form>

                    <br/>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
<!-- End Product Items List -->

<%@ include file="footer.jsp" %>
<!--===============================================================================================-->	
	<script src="ashion/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="ashion/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="ashion/vendor/bootstrap/js/popper.js"></script>
	<script src="ashion/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="ashion/vendor/select2/select2.min.js"></script>
</body>
</html>
