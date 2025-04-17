<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin Dashboard</title>


<jsp:include page="AdminCss.jsp"></jsp:include>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body style="background: #DBE4EE">
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<jsp:include page="AdminSidebar.jsp"></jsp:include>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Admin Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-4">
							<div class="card info-card sales-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Sales <span>| Overall</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>145</h6>
											<!-- <span class="text-success small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">increase</span> -->

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-4">
							<div class="card info-card revenue-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Revenue <span>| Overall</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-rupee"></i>
										</div>
										<div class="ps-3">
											<h6>${totalRevenue}</h6>
											<!-- <span class="text-success small pt-1 fw-bold">8%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>
 -->
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-4">

							<div class="card info-card customers-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Customers <span>| Overall</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6>${totalUsers}</h6>
											<!-- <span class="text-danger small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">decrease</span> -->

										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card -->

						<!-- Reports -->
						<div class="col-12">
							<div class="card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								
								<div class="card-body">
                  <h5 class="card-title">User Analysis <span>/ Year</span></h5>

                  <!-- Bar Chart -->
                   <canvas id="myChart" width="400" height="180"></canvas>

                   <script>
					      var ctx = document.getElementById('myChart').getContext('2d');
					      var myChart = new Chart(ctx, {
					        type: 'bar',
					        data: {
					          labels: ['January', 'February', 'March', 'April', 'May', 'June','July','August','September','October','November','December'],
					          datasets: [{
					            label: 'user Data',
					            data: [${monthWiseUsers[0]}, ${monthWiseUsers[1]}, ${monthWiseUsers[2]}, ${monthWiseUsers[3]}, ${monthWiseUsers[4]}, ${monthWiseUsers[5]}, ${monthWiseUsers[6]}, ${monthWiseUsers[7]}, ${monthWiseUsers[8]}, ${monthWiseUsers[9]}, ${monthWiseUsers[10]}, ${monthWiseUsers[11]}],
					            backgroundColor: [
					              'rgba(255, 99, 132, 0.2)',
					              'rgba(54, 162, 235, 0.2)',
					              'rgba(255, 206, 86, 0.2)',
					              'rgba(75, 192, 192, 0.2)',
					              'rgba(153, 102, 255, 0.2)',
					              'rgba(255, 159, 64, 0.2)'
					            ],
					            borderColor: [
					              'rgba(255, 99, 132, 1)',
					              'rgba(54, 162, 235, 1)',
					              'rgba(255, 206, 86, 1)',
					              'rgba(75, 192, 192, 1)',
					              'rgba(153, 102, 255, 1)',
					              'rgba(255, 159, 64, 1)'
					            ],
					            borderWidth: 1
					          }]
					        },
					        options: {
					          scales: {
					            y: {
					              beginAtZero: true
					            }
					          }
					        }
					      });
					    </script>
                  <!-- End Bar Chart -->

                </div>

              </div>
            </div>
						<!-- End Reports -->

					</div>
				</div>
			

			</div>
		</section>

	</main>
	<!-- main content end  -->


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>





	<jsp:include page="AdminFooter.jsp"></jsp:include>

	<jsp:include page="AdminJs.jsp"></jsp:include>
	
	

	
</body>
</html>