<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users</title>
     <jsp:include page="AdminCss.jsp"></jsp:include>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
        }
        .card {
            border-radius: 10px;
            background: #fff;
        }
        table {
            width: 100%;
        }
        th {
            width: 40%;
            background: #343a40;
            color: white;
        }
        td {
            background: #f1f1f1;
        }
        .btn-back {
            margin-top: 15px;
        }
    </style>
</head>
<body style="background: #C3CFDD">

<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h2 class="text-center mb-4">View Seller Details</h2>

        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th>First Name</th>
                    <td>${user.firstName}</td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td>${user.lastName}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th>Contact Number</th>
                    <td>${user.contactNum}</td>
                </tr>
                <tr>
                    <th>Created At</th>
                    <td>${user.createdAt}</td>
                </tr>
            </tbody>
        </table>

        <div class="text-center">
            <a href="/login" class="btn btn-primary btn-back">
                <i class="bi bi-arrow-left"></i> Log Out
            </a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>