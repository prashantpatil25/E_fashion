<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>List Orders</title>

<jsp:include page="AdminCss.jsp"></jsp:include>

<link href="https://cdn.datatables.net/2.2.2/css/dataTables.bootstrap5.min.css" rel="stylesheet"/>

</head>
<body style="background: #DBE4EE">

<jsp:include page="SellerHeader.jsp"></jsp:include>
<jsp:include page="SellerSidebar.jsp"></jsp:include>

<main id="main" class="main">
    <div class="pagetitle">
        <h1>List Orders</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="sellerashboard">Home</a></li>
                <li class="breadcrumb-item active">List Orders</li>
            </ol>
        </nav>
    </div>

    <section class="section dashboard">
        <div class="row" style="min-height: 500px;">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Orders<span>/all</span></h5>

                        <table class="table datatable datatable-table table-hover" id="orders">
                            <thead>
                                <tr>
                                    <th>Total Amount</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ordersList}" var="m">
                                    <tr>
                                        <td>${m[3]}</td>
                                        <td>${m[5]}</td>
                                        <td>${m[6]}</td>
                                        <td>${m[1]}</td>
                                        <td>
                                            <div class="d-flex gap-2">
                                                <a href="vieworders?orderId=${m[0]}" class="btn btn-sm btn-primary">View</a>
                                                <a href="deleteorders?orderId=${m[0]}" class="btn btn-sm btn-danger">Delete</a>
                                                <a href="editorders?orderId=${m[0]}" class="btn btn-sm btn-warning">Edit</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<jsp:include page="AdminFooter.jsp"></jsp:include>
<jsp:include page="AdminJs.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        let table = new DataTable('#orders');
    });
</script>

</body>
</html>