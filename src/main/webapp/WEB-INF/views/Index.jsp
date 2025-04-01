<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="/css/style.css">
<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- Start Navbar  -->
	<nav class="navbar navbar-expand-lg  bg-primary fixed-top navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i
				class="fa-solid fa-cart-shopping"></i> E Fashion Store</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<c:choose>
						<c:when test="${empty user}">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="home"><i class="fa-solid fa-house"></i>
								Home</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item" c:if="${user.role=='ROLE_ADMIN'}"><a
								class="nav-link active" aria-current="page" href="/admin/"><i
								class="fa-solid fa-house"></i> Home</a></li>
							<li class="nav-item" c:if="${user.role=='ROLE_USER'}"><a
								class="nav-link active" aria-current="page" href="/"><i
								class="fa-solid fa-house"></i> Home</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/newproduct">Product</a></li>
					<li class="nav-item dropdown ">
						<a class="nav-link dropdown-toggle dropdown-toggle-split" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Category </a>
						<ul class="dropdown-menu ">
							 <c:forEach var="c" items="${categories}">
								<%-- <li><a class="dropdown-item"
										href="/products?category=${c.name}">${c.name}</a></li> --%>
								<li><a class="dropdown-item" href="#">Men's</a></li>
								<li><a class="dropdown-item" href="#">Women's</a></li>
								<li><a class="dropdown-item" href="#">Kid's</a></li>
								<li><a class="dropdown-item" href="#">Footwear</a></li>
								<li><a class="dropdown-item" href="#">Accessories</a></li>
								<li><a class="dropdown-item" href="#">Beauty</a></li>
								<li><a class="dropdown-item" href="#">Ethic & Traditional Wear</a></li>
								<li><a class="dropdown-item" href="#">Seasonal Collection</a></li>
							</c:forEach>
						</ul>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<c:choose>
						<c:when test="${empty user}">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="/login"><i
								class="fa-solid fa-right-to-bracket"></i> LOGIN</a></li>
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="/signup">REGISTER</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="/user/cart"><i
								class="fa-solid fa-cart-shopping"></i> Cart [ ${countCart} ]</a></li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle active" href="#" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									<i class="fa-solid fa-user"></i> ${user.name}
								</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/user/profile">Profile</a></li>
									<li><a class="dropdown-item" href="/user/user-orders">My Orders</a></li>
									<li><a class="dropdown-item" href="/logout">Logout</a></li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<section>

		<!-- Start Slider  -->
		<div id="carouselExample" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/ecom1.png" class="d-block w-100" alt="..." height="350px" >
				</div>
				<div class="carousel-item">
					<img src="images/ecom2.jpg" class="d-block w-100" alt="..." height="350px">
				</div>
				<div class="carousel-item">
					<img src="images/ecom3.jpg" class="d-block w-100" alt="..." height="350px">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- End Slider  -->

		<!-- Start Category Module -->
		<div class="container">
			<div class="row">
				<p class="text-center fs-4">Category</p>
				<%-- <c:forEach var="c" items="${category}"> --%>
					
					<div class="col-md-2">
						<div class="card rounded-circle shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="images/Men.png" width="65%" height="140px"><br>
								<p>Men's</p>
								<%-- <img src="<c:url value='/img/category_img/${c.imageName}' />" width="65%" height="140px"><br>
								<a href="<c:url value='/products?category=${c.name}' />" class="text-decoration-none">${c.name}</a> --%>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="card rounded-circle shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="images/Women.jpg" width="65%" height="140px"><br>
								<p>Women's</p>
								<%-- <img src="<c:url value='/img/category_img/${c.imageName}' />" width="65%" height="140px"><br>
								<a href="<c:url value='/products?category=${c.name}' />" class="text-decoration-none">${c.name}</a> --%>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="card rounded-circle shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="images/kid.jpeg" width="65%" height="140px"><br>
								<p>Kid's</p>
								<%-- <img src="<c:url value='/img/category_img/${c.imageName}' />" width="65%" height="140px"><br>
								<a href="<c:url value='/products?category=${c.name}' />" class="text-decoration-none">${c.name}</a> --%>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="card rounded-circle shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="images/canvas.jfif" width="65%" height="140px"><br>
								<p>Footwear</p>
								<%-- <img src="<c:url value='/img/category_img/${c.imageName}' />" width="65%" height="140px"><br>
								<a href="<c:url value='/products?category=${c.name}' />" class="text-decoration-none">${c.name}</a> --%>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="card rounded-circle shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="images/accessories.jpg" width="65%" height="140px"><br>
								<p>Accessories</p>
								<%-- <img src="<c:url value='/img/category_img/${c.imageName}' />" width="65%" height="140px"><br>
								<a href="<c:url value='/products?category=${c.name}' />" class="text-decoration-none">${c.name}</a> --%>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="card rounded-circle shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="images/beuty.png" width="65%" height="140px"><br>
								<p>Beauty</p>
								<%-- <img src="<c:url value='/img/category_img/${c.imageName}' />" width="65%" height="140px"><br>
								<a href="<c:url value='/products?category=${c.name}' />" class="text-decoration-none">${c.name}</a> --%>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="card rounded-circle shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="images/product4.jpg" width="65%" height="140px"><br>
								<p>Ethic & Traditional Wear</p>
								<%-- <img src="<c:url value='/img/category_img/${c.imageName}' />" width="65%" height="140px"><br>
								<a href="<c:url value='/products?category=${c.name}' />" class="text-decoration-none">${c.name}</a> --%>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="card rounded-circle shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="images/product4.jpg" width="65%" height="140px"><br>
								<p>Seasonal Collection</p>
								<%-- <img src="<c:url value='/img/category_img/${c.imageName}' />" width="65%" height="140px"><br>
								<a href="<c:url value='/products?category=${c.name}' />" class="text-decoration-none">${c.name}</a> --%>
							</div>
						</div>
					</div>
				<%-- </c:forEach> --%>
			</div>
		</div>
		<!-- End Category Module -->

		<!-- Start Latest Product Module -->
		<div class="container-fluid bg-light p-3">
			<div class="row">
				<p class="text-center fs-4">Latest Products</p>
				<c:forEach var="p" items="${products}">
					<div class="col-md-3">
						<div class="card shadow-sm p-3 mb-5 bg-body-tertiary rounded">
							<div class="card-body text-center">
								<img src="<c:url value='/img/product_img/${p.image}' />" width="65%" height="140px">
								<p class="text-center">
									<a href="<c:url value='/product/${p.id}' />" class="text-decoration-none">${p.title}</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- End Latest Product Module -->

	</section>
	<div class="container-fluid p-1 bg-primary text-center text-white" style="margin-top: 250px">
		<p>eFashion.com</p>
	</div>
	<!-- End Footer  -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
	
</body>
</html>
