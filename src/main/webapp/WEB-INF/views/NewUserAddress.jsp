<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Addresses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">User Addresses</h2>
    
    <!-- Add Address Button -->
    <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addressModal">Add Address</button>
    
    <!-- Address Table -->
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Street</th>
                <th>Landmark</th>
                <th>City</th>
                <th>State</th>
                <th>Zip Code</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Home</td>
                <td>123 Main St</td>
                <td>Near Park</td>
                <td>New York</td>
                <td>NY</td>
                <td>10001</td>
                <td>
                    <button class="btn btn-warning btn-sm">Edit</button>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            <!-- More rows dynamically added from backend -->
        </tbody>
    </table>
</div>

<!-- Address Modal -->
<div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addressModalLabel">Add Address</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="saveuseraddress" method="post">
                    <div class="mb-2">
                        <label class="form-label">Title</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Street</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Landmark</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="mb-2">
                        <label class="form-label">City</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">State</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Zip Code</label>
                        <input type="text" class="form-control" required>
                    </div>
                     <input type="submit" value="Save UserAddress"/>
                    <!-- <button type="submit" class="btn btn-success">Save</button> -->
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
