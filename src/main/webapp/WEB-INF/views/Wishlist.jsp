<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Wishlist</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        a {
            color: red;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <h2 style="text-align: center;">🧡 मेरी Wishlist</h2>

    <c:if test="${empty wishlist}">
        <p style="text-align: center;">Wishlist खाली है!</p>
    </c:if>

    <c:if test="${not empty wishlist}">
        <table>
            <tr>
                <th>Wishlist ID</th>
                <th>Product ID</th>
                <th>Created At</th>
                <th>Remove</th>
            </tr>
            <c:forEach var="item" items="${wishlist}">
                <tr>
                    <td>${item.wishlistId}</td>
                    <td>${item.productId}</td>
                    <td>${item.createdAt}</td>
                    <td>
                      <a class="btn btn-remove" href="${pageContext.request.contextPath}/removewishlist?wishlistId=${item.wishlistId}">🗑 Remove</a>



                    </td>
                </tr>
            </c:forEach>
            
        </table>
    </c:if>
		
</body>
</html>
