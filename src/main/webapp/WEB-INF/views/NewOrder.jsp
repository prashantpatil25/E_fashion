<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

    <h2 class="text-center mb-4">Your Orders</h2>
    
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Order ID</th>
                <th>Status</th>
                <th>Total Amount</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%--<c:forEach var="order" items="${orders}">
                <c:set var="statusClass" value="bg-secondary"/> <!-- Default -->
                <c:choose>
                    <c:when test='${order.status == "Pending"}'><c:set var="statusClass" value="bg-warning"/></c:when>
                    <c:when test='${order.status == "Completed"}'><c:set var="statusClass" value="bg-success"/></c:when>
                    <c:when test='${order.status == "Cancelled"}'><c:set var="statusClass" value="bg-danger"/></c:when>
                </c:choose>
                 
                <tr>
                    <td>${order.orderId}</td>
                    <td>
                        <span class="badge ${statusClass}">${order.status}</span>
                    </td>
                    <td>&#8377; ${order.totalAmount}</td>
                    <td>
                        <a href="orders/delete/${order.orderId}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to cancel this order?');">Cancel</a>
                    </td>
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
