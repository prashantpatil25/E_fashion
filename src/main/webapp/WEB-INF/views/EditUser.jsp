<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Edit User</title>

<jsp:include page="AdminCss.jsp"></jsp:include>

<!-- Custom Styles -->
<style>
    label {
        font-weight: bold;
    }
</style>

</head>
<body style="background: #DBE4EE">

<jsp:include page="AdminHeader.jsp"></jsp:include>
<jsp:include page="AdminSidebar.jsp"></jsp:include>

<main id="main" class="main">
    <div class="pagetitle">
        <h1>Edit User</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                <li class="breadcrumb-item"><a href="listuser">User List</a></li>
                <li class="breadcrumb-item active">Edit User</li>
            </ol>
        </nav>
    </div>

    <section class="section dashboard">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Update User Information</h5>

                        <form action="updateuser" method="post">
                            <input type="hidden" name="userId" value="${user.userId}">

                            <div class="mb-3">
                                <label for="firstName" class="form-label">First Name</label>
                                <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstName}" required>
                            </div>

                            <div class="mb-3">
                                <label for="lastName" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastName}" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                            </div>

                            <div class="mb-3">
                                <label for="contactNum" class="form-label">Contact Number</label>
                                <input type="text" class="form-control" id="contactNum" name="contactNum" value="${user.contactNum}" required>
                            </div>

                            <div class="mb-3">
                                <label for="role" class="form-label">User Role</label>
                                <select class="form-control" id="role" name="role">
                                    <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
                                    <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>User</option>
                                </select>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="listuser" class="btn btn-secondary">Back</a>
                                <button type="submit" class="btn btn-primary">Update User</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<jsp:include page="AdminFooter.jsp"></jsp:include>
<jsp:include page="AdminJs.jsp"></jsp:include>

</body>
</html>
