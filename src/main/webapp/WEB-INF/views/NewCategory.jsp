<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
</head>
<body>
	<h2>Category</h2>
    
    <!-- Add New Category Form -->
    <form action="savecategory" method="post">
        <input type="text" name="categoryName" placeholder="Enter Category Name" required>
        <input type="submit" value="Save Category"/>
    </form>
</body>
</html>