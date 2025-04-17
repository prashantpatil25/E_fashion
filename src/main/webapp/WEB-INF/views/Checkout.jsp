<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Checkout</h4>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/pay" method="post">
                        <div class="mb-3">
                            <label class="form-label">Amount</label>
                            <input type="text" class="form-control" readonly="readonly" value="${amount}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Credit Card Number</label>
                            <input type="text" class="form-control" size="16" name="ccNum" placeholder="Enter 16-digit card number" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Expiry Date (MMYY)</label>
                            <input type="text" class="form-control" name="expDate" size="4" placeholder="e.g. 1225" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Pay</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
