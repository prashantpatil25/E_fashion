<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

    <h2 class="text-center mb-4">Your Shopping Cart</h2>

    <c:choose>
        <c:when test="${empty cartItems}">
            <div class="alert alert-warning text-center" role="alert">
                Your cart is empty. Start shopping now!
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td>${item.product.productName}</td>
                            <td>${item.quantity}</td>
                            <td>
                                <a href="cart/delete/${item.cartId}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to remove this item?');">
                                    Remove
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="d-flex justify-content-between mt-3">
                <a href="products" class="btn btn-primary">Continue Shopping</a>
                <a href="orders/place" class="btn btn-success">Place Order</a>
            </div>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
