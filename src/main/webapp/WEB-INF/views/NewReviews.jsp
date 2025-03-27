<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <title>Product Reviews</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .rating-stars {
            color: gold;
        }
    </style>
</head>
<body class="container mt-4">

    <h2 class="text-center mb-4">Product Reviews</h2>

    <c:choose>
        <c:when test="${empty reviews}">
            <div class="alert alert-info text-center" role="alert">
                No reviews yet. Be the first to review this product!
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>User</th>
                        <th>Rating</th>
                        <th>Review</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="review" items="${reviews}">
                        <tr>
                            <td>${review.user.username}</td>
                            <td>
                                <span class="rating-stars">
                                    <c:forEach begin="1" end="${review.rating}">
                                        ★
                                    </c:forEach>
                                    <c:forEach begin="${review.rating + 1}" end="5">
                                        ☆
                                    </c:forEach>
                                </span>
                            </td>
                            <td>${review.reviewText}</td>
                            <td>${review.createdAt}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

    <div class="text-center mt-4">
        <a href="products" class="btn btn-primary">Back to Products</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</
