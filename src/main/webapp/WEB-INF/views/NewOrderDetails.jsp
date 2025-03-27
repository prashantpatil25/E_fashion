<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <title>Order Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

    <h2 class="text-center mb-4">Order Details</h2>
    
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Order Detail ID</th>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
          <%--   <c:forEach var="detail" items="${orderDetails}">
                <c:set var="statusClass" value="bg-secondary"/>
                <c:choose>
                    <c:when test='${detail.status == "Pending"}'><c:set var="statusClass" value="bg-warning"/></c:when>
                    <c:when test='${detail.status == "Shipped"}'><c:set var="statusClass" value="bg-info"/></c:when>
                    <c:when test='${detail.status == "Delivered"}'><c:set var="statusClass" value="bg-success"/></c:when>
                    <c:when test='${detail.status == "Cancelled"}'><c:set var="statusClass" value="bg-danger"/></c:when>
                </c:choose>

                <tr>
                    <td>${detail.orderDetailId}</td>
                    <td>${detail.productId}</td>
                    <td>${detail.quantity}</td>
                    <td>&#8377; ${detail.price}</td>
                    <td><span class="badge ${statusClass}">${detail.status}</span></td>
                </tr>
            </c:forEach>--%>
        </tbody>
    </table>

    <div class="text-center mt-3">
        <a href="home" class="btn btn-secondary">Back to Home</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
