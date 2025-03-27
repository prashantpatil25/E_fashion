<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <title>Wishlist</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

    <h2 class="text-center mb-4">Your Wishlist</h2>

    <c:choose>
        <c:when test="${empty wishlistItems}">
            <div class="alert alert-info text-center" role="alert">
                Your wishlist is empty. Start adding your favorite products!
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Product Name</th>
                        <th>Added On</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${wishlistItems}">
                        <tr>
                            <td>${item.product.productName}</td>
                            <td>${item.createdAt}</td>
                            <td>
                                <a href="wishlist/delete/${item.wishlistId}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to remove this item?');">
                                    Remove
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="text-center mt-3">
                <a href="products" class="btn btn-primary">Continue Shopping</a>
            </div>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
